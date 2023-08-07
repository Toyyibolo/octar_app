import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:octar_app/services/firebase_service.dart';

class Authentication {
  Future signUpUsingEmailAndPassword(
      String emailAddress, String password) async {
    try {
      final user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      ))
          .user!;
      if (user != null) {
        //call our database service to update the user data
        await FirestoreService(uid: user.uid).addInfo(email: emailAddress);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signInUsingEmailAndPassword(
      String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> CheckIfUserisLoggedIn() async {
    final user = await FirebaseAuth.instance.authStateChanges();
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }
}

signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //if (googleUser == null) throw Exception('Not Logged In');
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = (userCredential).user!;
    final userEmail = userCredential.additionalUserInfo!.profile;

    if (user != null) {
      print(userEmail);
      //FirestoreService(uid: user.uid).addInfo(email: userEmail!);
      return true;
    }
  } on FirebaseAuthException catch (e) {
    print(e.message);
  }
}

// signInWithEmailLink(String email) async {
//   ActionCodeSettings acs = ActionCodeSettings(
//     url: 'https://octarapp.page.link/',
//     handleCodeInApp: true,
//     androidPackageName: 'com.example.octar_app',
//     androidInstallApp: true,
//     androidMinimumVersion: "1",
//   );
//   try {
//     await FirebaseAuth.instance
//         .sendSignInLinkToEmail(email: email, actionCodeSettings: acs);
//   } on FirebaseAuthException catch (e) {
//     print(e.message);
//   }
// }
