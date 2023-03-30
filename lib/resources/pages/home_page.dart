import 'package:flutter/material.dart';
import '/app/controllers/home_controller.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class MyHomePage extends NyStatefulWidget {
  final HomeController controller = HomeController();
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends NyState<MyHomePage> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   // Use a blue color for the background
  appBar: AppBar(
        title: Text(
          'AquaEcologue',
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
  body: Container(
     decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('https://images.unsplash.com/photo-1551244072-5d12893278ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80'),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
      child: Column(
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('./public/assets/images/mangrove.jpg'),
              radius: 100.0,
            ),
          ),
          SizedBox(height: 40.0),
      Text(
  'Coral Reef Monitoring App',
  style: TextStyle(
    color: Colors.white,
    letterSpacing: 2.0,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        blurRadius: 2.0,
        color: Colors.black,
        offset: Offset(1.0, 1.0),
      ),
    ],
  ),
),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(color: Colors.white), // Change the color of the divider to white
          ),
          Text(
  'Welcome back!',
  style: TextStyle(
    color: Colors.white,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    letterSpacing: 1.5,
    shadows: [
      Shadow(
        blurRadius: 2.0,
        color: Colors.black,
        offset: Offset(2.0, 2.0),
      ),
    ],
  ),
),
          SizedBox(height: 30.0,),
              
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
              ),
              SizedBox(height: 20.0,),
  
              SignInButton(
                Buttons.Twitter,
                onPressed: () {},
              ),
              SizedBox(height: 20.0,),
              SignInButton(
                Buttons.FacebookNew,
                onPressed: () {},
              ),
               SizedBox(height: 20.0,),
             
              SignInButton(
                Buttons.Microsoft,
                onPressed: () {},
              ),
            ],
          ),
        ),
  ),
    );
  }
}
