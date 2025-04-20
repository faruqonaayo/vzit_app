import 'package:flutter/material.dart';
import 'package:vzit_app/widgets/visited.dart';
import 'package:vzit_app/widgets/wish.dart';

class VzitApp extends StatelessWidget {
  const VzitApp({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vzit App")),
      body: SingleChildScrollView(child: Column(children: [Wish(), Visited()])),
    );
  }
}
