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
      return convertUserFromFirebaseCredential(_credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  Future<GlintsUser.User?> createEmailPasswordAndSignIn(
      {required String email, required String password}) async {
    try {
      final _credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return convertUserFromFirebaseCredential(_credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  GlintsUser.User convertUserFromFirebaseCredential(UserCredential credential) {
    return GlintsUser.User(
      displayName: credential.user!.displayName ?? '',
      email: credential.user!.email ?? '',
      uid: credential.user!.uid,
    );
  }
}
