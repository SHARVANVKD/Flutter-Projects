import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_logins_/firebase/UI/home_page.dart';
import 'package:firebase_logins_/firebase/Widgets/custom_snack_bar.dart';
import 'package:firebase_logins_/firebase_options.dart';
import 'package:flutter/material.dart';

class FirebaseCore {
  //connection
  static Future<FirebaseApp> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  //registration
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required BuildContext ctx,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
      if (user != null) {
        snack(ctx: ctx, message: 'Registration Successfully');
        Navigator.of(ctx).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage(user: user!)));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snack(ctx: ctx, message: 'Weak Password');
      } else if (e.code == 'email-already-in-use') {
        snack(ctx: ctx, message: 'Eamil Already Exist');
      }
    } catch (e) {
      snack(ctx: ctx, message: e.toString());
    }
    return user;
  }

  //login

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      if (user != null) {
        snack(ctx: context, message: 'Login Success');
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage(user: user!)));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snack(ctx: context, message: 'User Not Found');
      } else if (e.code == 'wrong-password') {
        snack(ctx: context, message: 'Password Error');
      }
    }
    return user;
  }
}
