import 'package:assignment_glints_twitter/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _textEmailController;
  late TextEditingController _textPasswordController;
  late FocusNode _focusNodeEmail;
  late FocusNode _focusNodePassword;

  late String _email;
  late String _password;

  @override
  void initState() {
    super.initState();

    _textEmailController = TextEditingController(text: Constants.valueEmpty);
    _textPasswordController = TextEditingController(text: Constants.valueEmpty);
    _focusNodeEmail = FocusNode();
    _focusNodePassword = FocusNode();

    _email = Constants.valueEmpty;
    _password = Constants.valueEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          right: true,
          left: true,
          child: Column(
            children: [
              _buildTextFieldEmail(),
              _buildTextFieldPassword(),
              _buildButtonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldEmail() {
    return TextFormField(
      onChanged: handleOnTextFieldEmailChange,
      controller: _textEmailController,
      focusNode: _focusNodeEmail,
    );
  }

  Widget _buildTextFieldPassword() {
    return TextFormField(
      onChanged: handleOnTextFieldPasswordChange,
      controller: _textPasswordController,
      focusNode: _focusNodePassword,
    );
  }

  Widget _buildButtonLogin() {
    return FlatButton(
      onPressed: handleOnButtonLoginPressed,
      child: Text(
        ConstantText.login,
        textAlign: TextAlign.center,
      ),
    );
  }

  void handleOnTextFieldEmailChange(String? value) {
    setState(() {
      _email = value ?? Constants.valueEmpty;
    });
  }

  void handleOnTextFieldPasswordChange(String? value) {
    setState(() {
      _password = value ?? Constants.valueEmpty;
    });
  }

  void handleOnButtonLoginPressed() {
    print('_email is $_email');
    print('_password is $_password');
  }
}
