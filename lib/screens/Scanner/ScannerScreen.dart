import 'package:flutter/material.dart';

class ScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/Scan.jpg",
            fit: BoxFit.fill,
          ),
          Image.asset(
            "assets/images/Scanner.png",
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
