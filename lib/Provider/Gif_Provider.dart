import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api/Models/Model_Gifs.dart';

class GifProvider{


  Future<List<ModelGifs>> getGifs({required int offSet}) async{
    final url="https://api.giphy.com/v1/gifs/trending?api_key=wo7qxG4Q6j0f1o0r7UvXqR4J2ithslFR&limit=10&offset=$offSet&rating=G&lang=en";
    final respuesta=await http.get(Uri.parse(url) );
    if (respuesta.statusCode==200){
        String body=utf8.decode(respuesta.bodyBytes);
        final jsonData=jsonDecode(body);
        final gifs=Gifs.fromJsonList(jsonData);
        return gifs.items;
    }else{
      throw Exception("Ocurrio algo ${respuesta.statusCode}");
    }
  }
}
