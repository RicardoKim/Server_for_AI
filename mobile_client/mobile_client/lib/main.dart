import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

final ImagePicker _picker = ImagePicker();

Future sending_message(String message) async{
  String url = "http://localhost:5000/test";
  http.Response response = await http.post(
    url,
    headers: <String, String> {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: <String, String> {
      'message' : message
    },
  );
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  var responseBody = response.body;

  print("statusCode: $statusCode");
  print("responseHeaders: $responseHeaders");
  print("responseBody: $responseBody");
}

Future _getImage() async{
  PickedFile image = await _picker.getImage(source: ImageSource.gallery);
  setState((){
    _image = image;
  })
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'AI server beta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputController = TextEditingController();

  late PickedFile _image;
  String inputText = 'default';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Beta Test',
            ),
            new TextField(
              decoration: new InputDecoration(
                  hintText: "message"
              ),
              onSubmitted: (String str){
                setState((){
                  inputText = str;
                  sending_message(inputText);
                });
              },
            ),

          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      )
    );
  }
}
