import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube/models/video.dart';
const API_Key = "AIzaSyC7sJG--GLuK-OStluJrEr9bEQUw2PqgtY";

class Api {
  search( String search) async {
    http.Response response = await http.get("https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_Key&maxResults=10");

    decode(response);
  }
  decode(http.Response response){
    if(response.statusCode == 200){
      var decoded = json.decode(response.body);

      List<Video> videos = decoded["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();

      print(videos);
    }
  }
}