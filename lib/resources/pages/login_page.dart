import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';
// ignore: unused_import
import 'dart:async';

class LoginPage extends NyStatefulWidget {
  final Controller controller = Controller();
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends NyState<LoginPage> {
  //variable to store Image , ImageUrl , Status from dropdown menu , Coordinatates
  File? imageFile;
  String imageUrl = '';
  String treeStatus = '';
  var locationMessage = '';

  bool _isElevated = true;

  ImagePicker image = ImagePicker();

//a controller to get what user typed as comment
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();
  final _textController4 = TextEditingController();

  //store user comment text input to a variable
  String userPost = '';

//list of data for dropdown menu Status
  List dropDownListData = [
    {
      "title": "Healthy Condition",
      "value": "Healthy Condition",
    },
    {"title": "Disease Detected", "value": "Disease Detected"},
    {"title": "Color Change", "value": "Color Change"},
    {"title": "Low Growth Rate", "value": "Low Growth Rate"},
  ];

  String defaultValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
          'Data Collection',
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
        actions: [
   Padding(
  padding: const EdgeInsets.all(10.0),
  child: Tooltip(
    message: 'Dashboard',
    child: CircleAvatar(
      backgroundColor: Colors.white.withOpacity(0.5),
      child: IconButton(
        icon: Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/dashboard');
        },
      ),
    ),
  ),
),
  ],
      ),
        body: SingleChildScrollView(
          //put a background image from url
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1581458227388-0259e2c7aa9d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Text(
                  //     'Select Coral Reef Image',
                  //     style: TextStyle(
                  //       fontSize: 24, // increased font size for more impact
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black,
                  //       fontFamily:
                  //           'Montserrat', // added a custom font for a unique look
                  //       letterSpacing:
                  //           1.5, // increased spacing between letters for better legibility
                  //       shadows: [
                  //         Shadow(
                  //           offset:
                  //               Offset(0, 2), // added a shadow to give depth
                  //           blurRadius: 4,
                  //           color: Colors.grey.withOpacity(0.4),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       getgall();
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       primary: Colors.black,
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //       ),
                  //       elevation: 3,
                  //     ),
                  //     child: Text(
                  //       'Pick Image from Gallery',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     getCam();
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.black,
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     elevation: 3,
                  //   ),
                  //   child: Text(
                  //     'Pick Image from Camera',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 18,
                  //     ),
                  //   ),
                  // ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            locationMessage,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),
                  Container(
                    height: 500,
                    width: 500,
                    color: Colors.black12,
                    child: imageFile != null
                        ? Image.file(imageFile!)
                        : Center(
                            
                          ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Column(
                  //     children: [
                  //       TextField(
                  //         controller: _textController1,
                  //         decoration: InputDecoration(
                  //           hintText: 'Enter Water Temperature (Celcius)',
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10.0),
                  //             borderSide: BorderSide(
                  //               width: 4.0,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 10.0,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Column(
                  //     children: [
                  //       TextField(
                  //         controller: _textController2,
                  //         decoration: InputDecoration(
                  //           hintText: 'Enter Depth of Water (meters)',
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10.0),
                  //             borderSide: BorderSide(
                  //               width: 4.0,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 10.0,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Column(
                  //     children: [
                  //       TextField(
                  //         controller: _textController3,
                  //         decoration: InputDecoration(
                  //           hintText: 'Enter pH of Water',
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10.0),
                  //             borderSide: BorderSide(
                  //               width: 4.0,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 10.0,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Column(
                  //     children: [
                  //       TextField(
                  //         controller: _textController4,
                  //         decoration: InputDecoration(
                  //           hintText: 'Enter Salinity of Water',
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10.0),
                  //             borderSide: BorderSide(
                  //               width: 4.0,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 10.0,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: defaultValue,
                          items: [
                            const DropdownMenuItem(
                                child: Text(
                                  "Coral Reef Status",
                                ),
                                value: ""),
                            ...dropDownListData
                                .map<DropdownMenuItem<String>>((data) {
                              return DropdownMenuItem(
                                  child: Text(data['title']),
                                  value: data['value']);
                            }).toList(),
                          ],
                          onChanged: (value) async {
                            treeStatus = value!;
                            print(treeStatus);

                            setState(() {
                              defaultValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton.icon(
  onPressed: () {
    getLocation();
  },
  icon: Icon(Icons.location_on, color: Colors.white),
  label: Text(
    'Set Location Site',
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold),
  ),
  style: ElevatedButton.styleFrom(
    primary: Colors.blue[900],
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                    onPressed: () {
                      _upload_image();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 5,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.deepPurpleAccent],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 150, maxHeight: 50),
                        alignment: Alignment.center,
                        child: Text(
                          'Upload Data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

//function to fetch image from camera
  getCam() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      imageFile = File(img!.path);
      print('${imageFile?.path}');
    });
  }

//function to fetch image from gallery
  getgall() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(img!.path);
    });
  }

//function to upload image to database
  void _upload_image() async {
    String temperature = _textController1.text;
    String depth = _textController2.text;
    String pH = _textController3.text;
    String salinity = _textController4.text;

    if (imageFile == null) {
      print('Please Select an Image');
      return;
    }
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('CoralreefImages')
          .child(DateTime.now().toString());
      //Store the picture
      await ref.putFile(imageFile!);
      //get the download Url of the picture
      imageUrl = await ref.getDownloadURL();
      print('Image Url:');
      print(imageUrl);
    } catch (e) {
      print(e);
    }
    storeEntry(imageUrl, temperature, depth, pH, salinity, treeStatus,
        locationMessage);
  }

//function to store data in firebase
  storeEntry(String imageUrl, String temperature, String depth, String pH,
    String salinity, String status, String location) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
      content: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            'Data Successfully Uploaded',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
  FirebaseFirestore.instance.collection('CoralReefDetails').add({
    'image': imageUrl,
    'water temperature': temperature,
    'water depth': depth,
    'pH value': pH,
    'salinity value': salinity,
    'status': status,
    'coordinates': location
  });
}

  //function to get current location of user
  void getLocation() async {
    LocationPermission permission; //ask phone for permission
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      locationMessage = '$position';
    });
  }
}
