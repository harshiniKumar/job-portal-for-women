import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:azblob/azblob.dart';
import 'package:job_portal/components/rounded_button.dart';

import '../../../../constants/profile_constants.dart';
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
class GalleryFetch extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        body: RoundedButton(text: "Fetch Blob", press: () => getImageToAzure())
    );
  }
  List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
  Future getImageToAzure() async {
    // read file as Uint8List
    var storage = AzureStorage.parse(azureConnString);
    var uri = "gallery/14234";
    String container = "gallery";
    //   // get the mine type of the file
    //   String? contentType = lookupMimeType(fileName);
    var blob = storage.getBlob(uri);
    print(blob);
    // var response = await http.Response.fromStream(blob);
    Uint8List image = base64.decode(blob.toString());
    print(image);
    // var response = await http.Response.fromStream(image);
    // final result = jsonDecode(response.body) as Map<String, dynamic>;
    galleryList = Image.memory(image) as List<String>;
    if (kDebugMode) {
      print('In Gallery Fetch Function');
      print(galleryList);
    }
    //   // print("done");
    // } on AzureStorageException catch (ex) {
    //   print(ex.message);
    // } catch (err) {
    //   print(err);
  }
}


