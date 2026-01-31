import 'package:flutter/material.dart';
import 'package:objective_c/objective_c.dart';
import 'package:uiview_mre/ffi.g.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final myProtocol = MyProtocol$Builder.implement(
      doSomething: () {
        print('test');
      },
    );
    return Scaffold(
      body: SafeArea(child: Text('OK\n${myProtocol.debugDescription}')),
    );
  }
}
