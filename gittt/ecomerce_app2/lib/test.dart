import "package:flutter/material.dart";

class Test extends StatefulWidget {
  const Test({super.key});
  @override
  State<Test> createState() => _Mytest();
}

class _Mytest extends State<Test> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("TEST"),
        ),
        body: const SizedBox(
          child: Center(),
        ));
  }
}
