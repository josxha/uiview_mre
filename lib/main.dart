import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uiview_mre/ffi.g.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(CustomUIView);
    }
    return const Scaffold(body: Text('OK'),);
  }
}
