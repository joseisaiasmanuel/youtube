import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube/blocs/favorites_blocs.dart';
import 'package:youtube/models/video.dart';

class ScreenFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc=BlocProvider.of<FavoriteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text("Favoriotos"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body:StreamBuilder<Map<String, Video>>(
        stream:bloc.autFive,
        initialData: {},
        builder: (context,snapshot){
          return ListView(
            children:snapshot.data.values.map((v){
              return InkWell(
                onTap: (){

                },
                onLongPress:(){
                  bloc.toggleFavorite(v);

                } ,
                child: Row(
                  children:<Widget> [
                    Container(
                      width: 100,
                      height: 50,
                      child: Image.network(v.thunb),
                    ),
                    Expanded(
                      child: Text(v.title, style:TextStyle(color:Colors.white70),
                      maxLines: 2,
                      ),

                    )
                  ],
                ),

              );
            }).toList(),


          );


        },
      ),
    );
  }
}
