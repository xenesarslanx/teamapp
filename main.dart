import 'package:flutter/material.dart';
import 'package:flutter_application_1/kayit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'YEMEK APP LOGİN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 void dispose(){
    t1.dispose();
    super.dispose();
  }
  void dispose2(){
    t2.dispose();
    super.dispose();
  }
  final TextEditingController t1 = TextEditingController(text: "");
  final TextEditingController t2 = TextEditingController(text: "");
  //final isimKontrolu = TextEditingController();
  //final sifreKontrolu = TextEditingController();
  //final genelKontrol = GlobalKey<FormState>();
  //final _formKey = GlobalKey<FormState>(); 
  //String isim,sifre;

  _printLatestValue(){
     print("first textfield: ${t1.text}");
  }
  _printLatestValue2(){
    print("second textfield: ${t2.text}");
  }
  @override
  void initState(){
    super.initState();
    t1.addListener(_printLatestValue);
    t2.addListener(_printLatestValue2);
  }
  
     @override    
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
                title: Text(widget.title),
                
      ),
      body: SafeArea(
              child: Container(       
          child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                 Container(
                   child:Text("Giriş")
                 ),
                           
      TextField(
        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),
        obscureText: false,
        controller:t1,
      ),
      TextField(
        style: TextStyle(color: Colors.green,fontWeight: FontWeight.w300),
        controller:t2,
        obscureText: true,
      ),
         ElevatedButton(
           child: Text('GİRİŞ'),
           onPressed: null,
           ),
                                      
                      Column(children: [
                        Text('kayıt ol'),
                      ],)
         ],
        ),
      ),
    ),
   );
  }
 }
 /*   TextFormField(
             validator:(yazi) {
                if(yazi.isEmpty){
                  return "lütfen bu kısmı doldurun";
                    }
              
                  },
                  onSaved: (yazi)=> isim = yazi,
              controller: isimKontrolu,
              decoration: InputDecoration(hintText: "isim"),
            ),*/