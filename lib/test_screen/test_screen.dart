import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final myController = ScrollController();

  @override
  void initState() {
    myController.addListener(() {
      print('changed');
    });
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: myController,
        children: [
          SizedBox(
            height: 200,
          ),
          SizedBox(
            height: 200,
          ),
          SizedBox(
            height: 200,
          ),
          SizedBox(
            height: 200,
          ),
          Text('asdf'),
          SizedBox(
            height: 200,
          ),
          SizedBox(
            height: 200,
          ),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
