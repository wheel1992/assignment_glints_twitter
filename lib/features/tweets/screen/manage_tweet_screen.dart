import 'package:assignment_glints_twitter/features/login/controller/login_controller.dart';
import 'package:assignment_glints_twitter/features/tweets/controller/tweets_controller.dart';
import 'package:assignment_glints_twitter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

enum ManageTweetScreenType {
  create,
  edit,
}

class ManageTweetScreenArgument {
  final ManageTweetScreenType type;

  ManageTweetScreenArgument({required this.type});
}

class ManageTweetScreen extends StatefulWidget {
  const ManageTweetScreen({Key? key}) : super(key: key);

  @override
  _ManageTweetScreenState createState() => _ManageTweetScreenState();
}

class _ManageTweetScreenState extends State<ManageTweetScreen> {
  ManageTweetScreenArgument argument = Get.arguments;
  TweetsController _tweetsController = Get.find();
  LoginController _loginController = Get.find();

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
      appBar: AppBar(
        title: Text(getTitle()),
      ),
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

  String getTitle() {
    switch (argument.type) {
      case ManageTweetScreenType.create:
        return 'New Tweet';
      default:
        return 'Edit Tweet';
    }
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

  Future<void> handleOnButtonCreatePressed() async {
    final _success = await _tweetsController.createTweet(
      content: _content,
      userId: _loginController.rxUser.value.uid,
    );
    Get.back<bool>(result: _success);
  }
}
