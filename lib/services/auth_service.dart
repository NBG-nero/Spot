import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // AuthService({this.auth});

  Stream<User> get authStateChanges => auth.idTokenChanges();

  Future getCurrentUser() async {
    return auth.currentUser;
  }

  Future getCurrentName() async {
    return auth.currentUser.displayName;
  }

  Future getCurrentEmail() async {
    return auth.currentUser.email;
  }

  Future getCurrentUid() async {
    return auth.currentUser.uid;
  }

  Future<String> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    final User currentUser = (await auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    print('auth function called');
    var updateInfo = UserInfo({"email": email});
    name = updateInfo.displayName;
    await currentUser.updateDisplayName(name);
    await currentUser.updatePhotoURL('');
    await currentUser.reload();
    return currentUser.uid;
  }

  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    print('auth function was called');
    return ((await auth.signInWithEmailAndPassword(
                email: email, password: password))
            .user)
        .uid;
  }

  Future signOut() async {
    return auth.signOut();
  }

  Future sendPasswordResetEmail(String email) async {
    return auth.sendPasswordResetEmail(email: email);
  }
  // Future<User> createUserWithEmailandPassword(
  //     String email, String password) async {
  //   UserCredential _user = await auth.createUserW)ithEmailAndPassword(
  //       email: email, password: password);
  //   return _user.user;
  // }

  // Future<User> createUserWithEmailAndPaasword(email, password);
  // Future<User> signInWithEmailAndPassword();
  // Future<User> signInWithGoogle();
  // Future<void> signOut();
  // Future<void> sendPasswordResetEmail(email);
  // Stream<User> get onAuthStateChanged;
  // void dispose();
}
