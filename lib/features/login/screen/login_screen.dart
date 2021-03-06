import 'package:assignment_glints_twitter/features/login/controller/login_controller.dart';
import 'package:assignment_glints_twitter/features/tweets/screen/tweets_screen.dart';
import 'package:assignment_glints_twitter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  LoginController _loginController = Get.find();

  @override
  void initState() {
    super.initState();

    _loginController.init(authRepository: Get.find());
    /**
     * Start listening to change in LoginController.
     * If user is not null, it means user has login.
     * Directly navigate to tweets screen.
     */
    _loginController.rxUser.listen((user) {
      if (user.uid == '') {
        return;
      }

      navigateToTweetsScreen();
    });

    _email = Constants.valueEmpty;
    _password = Constants.valueEmpty;

    _textEmailController = TextEditingController(text: _email);
    _textPasswordController = TextEditingController(text: _password);
    _focusNodeEmail = FocusNode();
    _focusNodePassword = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          right: true,
          left: true,
          child: Column(
            children: [
              _buildTextFieldEmail(),
              _buildTextFieldPassword(),
              _buildButtonLogin(),
              _buildButtonRegisterAndLogin(),
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
        ConstantText.buttonLogin,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildButtonRegisterAndLogin() {
    return FlatButton(
      onPressed: handleOnButtonRegisterLoginPressed,
      child: Text(
        ConstantText.buttonRegisterAndLogin,
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
    _loginController.loginWithEmailPassword(email: _email, password: _password);
  }

  void handleOnButtonRegisterLoginPressed() {
    _loginController.createAndLoginWithEmailPassword(
        email: _email, password: _password);
  }

  void navigateToTweetsScreen() {
    Get.off(TweetsScreen());
  }
}
