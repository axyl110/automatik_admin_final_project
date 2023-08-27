// ignore_for_file: avoid_print

import 'package:automatik_admin_final_project/models/user_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<UserModel> technicianuserList = RxList<UserModel>();

  Future<void> fetchTechnicianUsers() async {
    try {
      var snapshot = await _firestore.collection('technician_users').get();
      technicianuserList.assignAll(snapshot.docs.map((doc) => UserModel.fromFirestore(doc)).toList());
    } catch (e) {
      print('Error fetching users: $e');
    }
  }
  Future<void> fetchCustomerUsers() async {
    try {
      var snapshot = await _firestore.collection('Customers').get();
      technicianuserList.assignAll(snapshot.docs.map((doc) => UserModel.fromFirestore(doc)).toList());
    } catch (e) {
      print('Error fetching users: $e');
    }
  }
}