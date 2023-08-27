import 'package:automatik_admin_final_project/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicianPage extends StatelessWidget {
  final UserController _userController = Get.find<UserController>();

  TechnicianPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _userController.fetchTechnicianUsers(); // Fetch user data before building the UI

    return Scaffold(
      body: Obx(
        () {
          if (_userController.technicianuserList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('First Name')),
                    DataColumn(label: Text('Last Name')),
                    DataColumn(
                        label: Text('Contact Number')), // Contact number header
                    DataColumn(label: Text('Actions')), // Change column label
                  ],
                  rows: _userController.technicianuserList.map((user) {
                    return DataRow(
                      cells: [
                        DataCell(Text(user.email)),
                        DataCell(Text(user.firstName)),
                        DataCell(Text(user.lastName)),
                        DataCell(
                            Text(user.phoneNumber)), // Display contact number
                        const DataCell(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock,
                                color: Colors.blue, // Change color to blue
                              ), // Add icon for changing password
                              SizedBox(width: 8),
                              Icon(
                                Icons.delete,
                                color: Colors.red, // Change color to red
                              ), // Add icon for deactivating account
                              SizedBox(width: 8),
                              Icon(
                                Icons.check_circle,
                                color: Colors.green, // Change color to green
                              ), // Add icon for approving authentication
                              SizedBox(width: 8),
                              Icon(
                                Icons.cancel,
                                color: Colors.red, // Change color to red
                              ), // Add icon for denying authentication
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
