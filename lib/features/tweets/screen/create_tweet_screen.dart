import 'package:assignment_glints_twitter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateTweetScreen extends StatefulWidget {
  const CreateTweetScreen({Key? key}) : super(key: key);

  @override
  _CreateTweetScreenState createState() => _CreateTweetScreenState();
}

class _CreateTweetScreenState extends State<CreateTweetScreen> {
  late TextEditingController _textContentController;
  late FocusNode _focusNodeContent;
  late String _content;

  @override
  void initState() {
    super.initState();

    _content = Constants.valueEmpty;
    _textContentController = TextEditingController(text: Constants.valueEmpty);
    _focusNodeContent = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                controller: _textContentController,
                focusNode: _focusNodeContent,
                maxLength: Constants.maxTweetCharacters,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                onChanged: handleOnContentChange,
                minLines: 10,
                maxLines: 10,
              ),
              _buildButtonCreate(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonCreate() {
    return FlatButton(
      onPressed: handleOnButtonCreatePressed,
      child: Text(
        ConstantText.buttonCreateTweet,
        textAlign: TextAlign.center,
      ),
    );
  }

  void handleOnContentChange(String? value) {
    setState(() {
      _content = value ?? Constants.valueEmpty;
    });
  }

  void handleOnButtonCreatePressed() {
    print('_content is $_content');
    // _loginController.loginWithEmailPassword(email: _email, password: _password);
  }
}
