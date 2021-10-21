// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:preview/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static addUser(_name, _email) async {
    final db = FirebaseFirestore.instance;
    final pEmail = await AuthService().getCurrentEmail();

    var updateInfo = UserInfo({"email": _email});
    _name = updateInfo.displayName;
    print('firebase function was called');
    await db
        .collection('userData')
        .doc(pEmail)
        .set({'name': _name, 'email': _email}).catchError((e) {
      print('firebase fucntion did not work');
    });
    // await db.collection('userData').doc()
  }
}
