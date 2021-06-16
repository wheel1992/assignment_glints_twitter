import 'package:assignment_glints_twitter/models/user/user.dart';
import 'package:assignment_glints_twitter/repositories/auth/auth_repository_base.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late AuthRepositoryBase _authRepository;

  var rxUser = User.empty().obs;

  init({required AuthRepositoryBase authRepository}) {
    _authRepository = authRepository;
  }

  loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final _user = await _authRepository.signInWithEmailPassword(
        email: email, password: password);
    print('login complete $_user');
    rxUser.value = _user ?? User.empty();
  }

  createAndLoginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final _user = await _authRepository.createEmailPasswordAndSignIn(
        email: email, password: password);
    print('create and login complete $_user');
    rxUser.value = _user ?? User.empty();
  }
}
