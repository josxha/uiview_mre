import 'package:flutter/material.dart';
import 'package:uiview_mre/ffi.g.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    MyProtocol$Builder.implement(
      doSomething: () {
        print('test');
      },
    );
    return const Scaffold(body: Text('OK'));
  }
}
