import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube/api.dart';
import 'package:youtube/blocs/video_blocs.dart';
import 'package:youtube/screen/screen_home.dart';

import 'blocs/favorites_blocs.dart';

void main(){
  Api api = Api();
  api.search("eletro");

  runApp (MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideosBloc(),
        child: BlocProvider(
          bloc: FavoriteBloc(),
          child:MaterialApp(
            title: "Fluttertube",
            home: Home(),
          ) ,
        ) );
  }
}


