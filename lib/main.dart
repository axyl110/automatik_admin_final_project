import 'package:automatik_admin_final_project/controller/sidebar_controller.dart';
import 'package:automatik_admin_final_project/controller/user_controller.dart';
import 'package:automatik_admin_final_project/routes/app_routes.dart';
import 'package:automatik_admin_final_project/views/bookings_page.dart';
import 'package:automatik_admin_final_project/views/customer_page.dart';
import 'package:automatik_admin_final_project/views/dashboard_page.dart';
import 'package:automatik_admin_final_project/views/earnings_page.dart';
import 'package:automatik_admin_final_project/views/login_page.dart';
import 'package:automatik_admin_final_project/views/sidebar_page.dart';
import 'package:automatik_admin_final_project/views/technician_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(UserController());
  Get.put(SidebarController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sidebar Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.dashboard,
      getPages: const [
        // Define the pages and their corresponding views here
      ],
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class SidebarLayout extends StatelessWidget {
  final SidebarController sidebarController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> menuItems = ['Dashboard', 'Bookings', 'Technicians', 'Customers', 'Earnings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Sidebar(), // Use the Sidebar as the drawer
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Obx(() {
          int selectedIndex = sidebarController.selectedIndex.value;
          return Text(menuItems[selectedIndex]);
        }),
      ),
      body: Obx(() {
        final selectedIndex = sidebarController.selectedIndex.value;
        switch (selectedIndex) {
          case 0:
            return DashboardPage();
          case 1:
            return BookingsPage();
          case 2:
            return TechnicianPage();
          case 3:
            return CustomerPage();
          case 4:
            return EarningsPage();
          default:
            return Center(child: Text('Invalid index'));
        }
      }),
    );
  }
}