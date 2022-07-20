import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:job_portal/components/rounded_button.dart';
import 'package:job_portal/constants/constants.dart';
import 'package:job_portal/constants/profile_constants.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

import 'package:azblob/azblob.dart';

//use image_picker to get image

class GalleryUpload extends StatefulWidget {
  @override
  _GalleryUploadState createState() => _GalleryUploadState();
}
class _GalleryUploadState extends State<GalleryUpload> {
  /// Variables
  late File imageFile;
  bool load = false;

 var imageName = "Image_";

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryLightColor,
        appBar:AppBar( leading:IconButton(icon: const Icon(Icons.close_sharp),
            onPressed: () {
              Navigator.pop(context);
            }),title:Text("Upload Image",style:GoogleFonts.getFont('Lato')), backgroundColor:kPrimaryColor),
        body:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/upload.png'),
                  SizedBox(height:15.0),
                  RoundedButton(
                    color: kPrimaryColor,
                    press: () => _getFromGallery(context),
                    text: "Pick from Gallery",
                  ),
                  Container(
                    height: 15.0,
                  ),
                  RoundedButton(
                    color: kPrimaryColor,
                    text:"Pick from Camera",
                    press: () => _getFromCamera(context)
                  )
                ],
              ),
            );
  }

  /// Get from gallery
  _getFromGallery(BuildContext context) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        load = true;
      });
    }
    if(load)
    {
      String imageId = DateTime.now().millisecondsSinceEpoch.toString();
      imageName+= imageId;
      // setName();
      uploadImageToAzure(context);
    }
  }

  /// Get from Camera
  _getFromCamera(BuildContext context) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        load = true;
      });
      if(load)
        {
          String imageId = DateTime.now().millisecondsSinceEpoch.toString();
          imageName+= imageId;
          // setName();
          uploadImageToAzure(context);
        }
    }
  }
  setName()
  {
             String dir = path.dirname(imageFile.path);
             print('Original path: ${imageFile.path}');
             String newPath = path.join(dir, imageName);
             print('NewPath: ${newPath}');
             imageFile.renameSync(newPath);
  }
  Future uploadImageToAzure(BuildContext context) async {
    try {
      String fileName = path.basename(imageFile.path);
      print('FileName $fileName');
      // read file as Uint8List
      Uint8List content = await imageFile.readAsBytes();
      var storage = AzureStorage.parse(azureConnString);
      String container = "gallery";
      // get the mine type of the file
      String? contentType = lookupMimeType(fileName);
      await storage.putBlob('/$container/$userId/$fileName', bodyBytes: content,
          contentType: contentType,
          type: BlobType.BlockBlob);
      print("done");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: const Text("File Uploaded Successfully"),
              action: SnackBarAction(label: 'Close',onPressed: () {  SnackBarAction; }
           )
          )
        );
    } on AzureStorageException catch (ex) {
      print(ex.message);
    } catch (err) {
      print(err);
    }
  }
}
