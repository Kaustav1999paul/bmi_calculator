import 'package:flutter/material.dart';

import 'Home.dart';

void main() => runApp(app());

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0XFF0D0027),
          body: Home(),
        ),
      ),
    );
  }
}
