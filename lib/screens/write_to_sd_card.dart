// import 'dart:html';
import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class WritetoSD extends StatefulWidget {
  const WritetoSD({Key? key}) : super(key: key);

  @override
  _WritetoSDState createState() => _WritetoSDState();
}

class _WritetoSDState extends State<WritetoSD> {
  late String data;
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<io.File> get _localFile async {
    final path = await _localPath;
    return io.File('$path/counter.txt');
  }

  Future<String> readContent() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      // Returning the contents of the file
      return contents;
    } catch (e) {
      // If encountering an error, return
      return 'Error!';
    }
  }

  Future<io.File> writeContent() async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('Hello Folk this is sample text');
  }

  @override
  void initState() {
    super.initState();
    data = "";
    writeContent();
    readContent().then((String value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write to Sd"),
      ),
      body: Container(
        child: Text("Data: $data"),
      ),
    );
  }
}
