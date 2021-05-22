import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mobiler.dev',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF626262),
        body: SafeArea(
          
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: "https://www.yemeksepeti.com",
            onWebViewCreated: (controller) {
              webViewController = controller;
              print("::: onWebViewCreated");
            },
            onPageStarted: (text) {
              print("::: onPageStarted");
            },
            onPageFinished: (text) {
              print("::: onPageFinished");
            },
            onWebResourceError: (error) {
              print("::: onWebResourceError");
            },
            navigationDelegate: (NavigationRequest request) {
              if (!request.url.contains('error')) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: Text("Tarayıda aç?"),
                        //backgroundColor: Color(0xFFEDD23B),
                        actions: <Widget>[
                          ButtonBar(
                            children: <Widget>[
                              ElevatedButton(
                                child: Text("Hayır"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                             ElevatedButton(
                                child: Text("Evet"),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  if (await canLaunch(request.url)) {
                                    await launch(
                                      request.url,
                                      forceSafariVC: false,
                                      forceWebView: false,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $request.url';
                                  }
                                },
                              )
                            ],
                          )
                        ],
                      );
                    });
                return NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
          ),
        ),
   
        );
  }
}