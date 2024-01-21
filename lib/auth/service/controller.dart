import 'package:appfirebase/pages/home_page.dart';
import 'package:appfirebase/widgets/mytext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  //! firebase auth servicega to'g'ridan to'g'ri muojat qilish
  final authh = FirebaseAuth.instance;

  //! user registratsiy
  //! usredan talab qilinuvchi malumotlar uchun funksiya
  Future<User?> userRegister(String userName, String email, String password,
      BuildContext context) async {
    try {
      UserCredential userCredential = await authh
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MyText(
            text: '$e',
            fontSize: 16,
            textColor: Colors.redAccent,
          ),
        ),
      );
    }
    return null;
  }

  //! User login

  Future<User?> userLogin(
      BuildContext context, String password, String email) async {
    try {
      UserCredential userCredential = await authh.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false);
      return userCredential.user;
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MyText(
            text: '$e',
            fontSize: 16,
            textColor: Colors.redAccent,
          ),
        ),
      );
    }
    return null;
  }
}
