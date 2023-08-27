// ignore_for_file: avoid_print

import 'package:automatik_admin_final_project/main.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.off(SidebarLayout()); // Navigate to the dashboard
    } catch (e) {
      print('Login error: $e');
    }
  }
}