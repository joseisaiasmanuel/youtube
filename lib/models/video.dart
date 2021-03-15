class Video {
  final String id;
  final String title;
  final String thunb;
  final String channel;

  Video({this.id,this.title,this.thunb,this.channel});
  factory Video.fromJson(Map<String, dynamic> json){
    if(json.containsKey("id"))
    return Video (
      id:json["id"]["videoId"],
      title:json["snippet"]["title"],
      thunb:json["snippet"]["thumbnails"]["high"]["url"],
      channel:json["snippet"]["channelTitle"]
    );
    else {

      return Video(
        id:json["videoId"],
        title: json["title"],
        thunb:json["thunb"],
        channel:json["channel"]
      );

    }

  }
  Map<String, dynamic> toJson(){

    return {
      "videoId":id,
      "title":title,
      "thunb": thunb,
      "channel": channel


    };
  }
}