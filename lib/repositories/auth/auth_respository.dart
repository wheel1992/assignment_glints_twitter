import 'package:firebase_auth/firebase_auth.dart';
import 'package:assignment_glints_twitter/models/user/user.dart' as GlintsUser;
import 'auth_repository_base.dart';

class AuthRepository extends AuthRepositoryBase {
  late FirebaseAuth _auth;

  void setup({required FirebaseAuth auth}) {
    _auth = auth;
  }

  @override
  Future<GlintsUser.User?> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final _credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return GlintsUser.User(
        displayName: _credential.user!.displayName ?? '',
        email: _credential.user!.email ?? '',
        uid: _credential.user!.uid,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }
}
