import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class DashboardPage extends NyStatefulWidget {
  final Controller controller = Controller();
  DashboardPage({Key? key}) : super(key: key);
  
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends NyState<DashboardPage> {

  @override
  init() async {
    super.init();
    
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
  appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueAccent,
                Colors.teal,
              ],
            ),
          ),
        ),
      ),
  body: SafeArea(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        './public/assets/images/dashboard.jpg',
        fit: BoxFit.fill,
      ),
    ),
  ),
);
  }
}
