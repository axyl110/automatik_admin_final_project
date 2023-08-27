import 'package:automatik_admin_final_project/controller/sidebar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Sidebar extends StatelessWidget {
  final SidebarController sidebarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'Sidebar Navigation',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              sidebarController.changePageIndex(0);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: Text('Bookings'),
            onTap: () {
              sidebarController.changePageIndex(1);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: Text('Technicians'),
            onTap: () {
              sidebarController.changePageIndex(2);
              Navigator.pop(context); // Close the drawer
            },
          ),
         ListTile(
            title: Text('Customers'),
            onTap: () {
              sidebarController.changePageIndex(3);
              Navigator.pop(context); // Close the drawer
            },
          ),
        ListTile(
            title: Text('Earnings'),
            onTap: () {
              sidebarController.changePageIndex(4);
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}