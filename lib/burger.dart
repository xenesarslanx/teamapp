import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Burger extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Burger> {
  Widget gonderiListesi(){
  return Container(
    child:Column(
      children:<Widget>[
    StreamBuilder(
              stream:FirebaseFirestore.instance.collection("mutfak").snapshots(),
              builder:(context, snapshot){
                if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  shrinkWrap: true,
                   itemBuilder:(context,index){
                     DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
                     return GonderiGosterme(baslik:documentSnapshot["baslik"],);
                   },
                );
                }
              }
              )
      ]
      )
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body:  gonderiListesi(),
    );
  }
}
class GonderiGosterme extends StatelessWidget {
  String baslik;
 // String burger;
  GonderiGosterme({
  @required this.baslik,
 //  @required this.burger
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
        width: 400,
        height: 400,
        child: Stack(
          children:<Widget>[
            ClipRRect(
              borderRadius:BorderRadius.circular(8),
              child:Image.network(
              baslik,
              fit:BoxFit.cover,
              width: MediaQuery.of(context).size.width,),
            )
          ]
        ),
      ),
    );
  }
}