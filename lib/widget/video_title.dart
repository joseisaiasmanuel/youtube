import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube/blocs/favorites_blocs.dart';
import 'package:youtube/models/video.dart';

import '../api.dart';

class VideoTile extends StatelessWidget {
  final Video video;
  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    final bloc =BlocProvider.of<FavoriteBloc>(context);
    return GestureDetector(
      onTap: (){
        FlutterYoutube.playYoutubeVideoById(
            apiKey: API_Key, videoId: video.id);
      },
     child: Container(
       margin: EdgeInsets.symmetric(vertical: 4),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           AspectRatio(
             aspectRatio: 16.0 / 9.0,
             child: Image.network(
               video.thunb,
               fit: BoxFit.cover,
             ),
           ),
           Row(
             children: <Widget>[
               Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Padding(
                         padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                         child: Text(
                           video.title,
                           style: TextStyle(color: Colors.white, fontSize: 16.0),
                           maxLines: 2,
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.all(8),
                         child: Text(
                           video.channel,
                           style: TextStyle(color: Colors.white, fontSize: 14.0),
                         ),
                       )
                     ],
                   )),
               StreamBuilder<Map<String, Video>>(
                   stream: bloc.autFive,

                   builder: (context, snapshot) {
                     if (snapshot.hasData)
                       return IconButton(
                           icon: Icon(
                             snapshot.data.containsKey(video.id) ?
                             Icons.star: Icons.star_border,
                           ),
                           color: Colors.white,
                           iconSize: 30,
                           onPressed: () {
                             bloc.toggleFavorite(video);
                           });
                     else
                       return CircularProgressIndicator();
                   })
             ],
           )
         ],
       ),
     ),
    );
  }
}
