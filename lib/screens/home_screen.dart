import 'package:flutter/material.dart';
import 'package:writetosdcard/screens/write_to_sd_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Experiments"),
      ),
      body: TextButton(
        child: Text(
          "Experiment 9",
          style: TextStyle(fontSize: 20.0),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WritetoSD()));
        },
        style: ButtonStyle(),
      ),
    );
  }
}
