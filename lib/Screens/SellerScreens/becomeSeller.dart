import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class BecomeASeller extends StatefulWidget {
  const BecomeASeller({super.key});

  @override
  State<BecomeASeller> createState() => _BecomeASellerState();
}

class _BecomeASellerState extends State<BecomeASeller> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? _category;
  final List<String> _categories = [
    'Category 1',
    'Category 2',
    'Category 3'
  ]; // Add your categories here

  Future<void> _pickImage() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    if (await Permission.storage.isGranted) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    } else {
      // Handle the fact that the user did not grant permission
    }
  }

  var pickedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Become a Seller', style: GoogleFonts.poppins()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              textfield("Enter Your Address", TextInputType.text),
              SizedBox(height: 10),
              textfield("Enter Your City", TextInputType.text),
              SizedBox(height: 10),
              textfield("Enter Your State", TextInputType.text),
              SizedBox(height: 10),
              textfield("Enter Your Pincode", TextInputType.number),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Color.fromARGB(255, 72, 50, 244),
                  ),
                  onPressed: () async {
                    PermissionStatus status = await Permission.photos.status;
                    if (!status.isGranted) {
                      status = await Permission.photos.request();
                    }
                    if (status.isGranted) {
                      pickedFile = await ImagePicker()
                          .getImage(source: ImageSource.gallery);
                      // Use the pickedFile
                      setState(() {});
                    } else {
                      print('Permission not granted');
                    }
                  },
                  child: pickedFile == null
                      ? Text(
                          'Upload Aadhaar Image',
                          style: GoogleFonts.poppins(color: Colors.white),
                        )
                      : Text(
                          "Image Uploaded",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(100, 50),
                  primary: Colors.black,
                  backgroundColor: Color.fromARGB(255, 72, 50, 244),
                ),
                onPressed: () {
                  // Handle submit action here
                },
                child: Text('Submit',
                    style: GoogleFonts.poppins(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textfield(String hintText, TextInputType keyboardType) {
  return TextField(
    keyboardType: keyboardType,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.black,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.blue),
      ),
    ),
  );
}
