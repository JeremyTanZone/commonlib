import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("I'am new route"),
      ),
    );
  }
}
