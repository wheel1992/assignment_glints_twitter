import 'package:flutter/material.dart';

class TweetsScreen extends StatefulWidget {
  const TweetsScreen({Key? key}) : super(key: key);

  @override
  _TweetsScreenState createState() => _TweetsScreenState();
}

class _TweetsScreenState extends State<TweetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tweets'),
        actions: [
          FlatButton.icon(
            onPressed: handleOnButtonCreate,
            icon: Icon(
              Icons.add,
            ),
            label: Text('Create tweet'),
          ),
        ],
      ),
      body: Container(
        child: SafeArea(
          child: ListView(),
        ),
      ),
    );
  }

  void handleOnButtonCreate() {}
}
