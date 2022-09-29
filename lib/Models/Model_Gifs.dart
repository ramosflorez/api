import 'dart:convert';


class Gifs{
  List <ModelGifs> items=[];
  Gifs();
  Gifs.fromJsonList(jsonList){
    if (jsonList==Null) return;
    for (var item in jsonList['data']){
      final gif=new ModelGifs.fromJsonMap(item);
      items.add(gif);
    }


  }
}

class ModelGifs{
  late String Name;
  late String url;
  ModelGifs(this.Name, this.url);

  ModelGifs.fromJsonMap(Map <String, dynamic> json){
    Name=json["title"];
    url=json["images"]["downsized"]["url"];
  }
}