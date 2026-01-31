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
      doSomething: () => print('test1'),
    );
    final myProtocol2 = MyProtocol2$Builder.implement(
      doSomething: () => print('test2'),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('OK'),
            Text("MyProtocol: ${myProtocol.debugDescription.toDartString()}"),
            Text("MyProtocol2: ${myProtocol2.debugDescription.toDartString()}"),
          ],
        ),
      ),
    );
  }
}
