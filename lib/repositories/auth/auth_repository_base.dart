import 'dart:async';
import 'package:assignment_glints_twitter/models/user/user.dart' as GlintsUser;

abstract class AuthRepositoryBase {
  Future<GlintsUser.User?> signInWithEmailPassword(
      {required String email, required String password});
}
