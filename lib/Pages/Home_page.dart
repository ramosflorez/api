import 'package:api/main.dart';
import 'package:flutter/material.dart';
import 'package:api/Provider/Gif_Provider.dart';
import 'package:api/Widgets/listGifs.dart';
import '../Models/Model_Gifs.dart';

class MyHomeApp extends StatefulWidget{
  const MyHomeApp({Key? key, required this.title}): super (key:key);
  final String title;
  @override
  State<MyHomeApp> createState()=>_myHomePage_state();
  

}

class _myHomePage_state extends State<MyHomeApp>{
  int offSet = 1;
  late Future<List<ModelGifs>> _listtadoGifs;
  ScrollController _scrollController = ScrollController();
  bool visibilidad=false;




  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final getprovider=new GifProvider();
    _listtadoGifs=getprovider.getGifs(offSet: offSet);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==_scrollController.position.maxScrollExtent) {
          setState(() {
            visibilidad=true;
          });
      }
      if (_scrollController.position.pixels !=_scrollController.position.maxScrollExtent) {
        setState(() {
          visibilidad=false;
        });
      }

    });

  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _listtadoGifs,
        builder: (context, Snapshot){
          if (Snapshot.hasData){
            return GridView.count(
              controller: _scrollController,
              crossAxisCount: 2,
              children: listGifs(Snapshot.data as List<ModelGifs>),
            );

          }
            else{
              print(Snapshot.error);
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
      floatingActionButton: Visibility(
        visible: visibilidad,
         child: FloatingActionButton(
           child: Icon(Icons.add),
           onPressed: (){
             recargarGifs();
           },
         )

      ),
    );
  }

  void recargarGifs() {
    offSet += 19;
    final getprovider = GifProvider();
    getprovider.getGifs(offSet: offSet).then((nuevosvalores) {
      setState(() {
        _listtadoGifs.then((valores) => valores.addAll(nuevosvalores));
      });

    });
  }

  }
