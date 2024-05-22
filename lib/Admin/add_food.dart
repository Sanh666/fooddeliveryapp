import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/database.dart';
import 'package:fooddelivery/wiget_support.dart';
import 'package:image_picker/image_picker.dart';
import 'home_admin.dart';
import 'package:random_string/random_string.dart'; // Make sure to add this dependency in your pubspec.yaml

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final List<String> items = ['Ice-cream', 'Burger', 'Salad', 'Pizza'];
  String? value;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future<void> getImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> uploadItem() async {
    if (selectedImage != null &&
        nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        detailsController.text.isNotEmpty &&
        value != null) {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("blogImages")
          .child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadUrl = await (await task).ref.getDownloadURL();
      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "name": nameController.text,
        "Price": priceController.text,
        "Details": detailsController.text,
        "Category": value,
      };
      await DatabaseMethods().addFoodItem(addItem, addId).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Food Item Added",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Failed to Add Food Item",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeAdmin()),
            );
          },
          child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.grey),
        ),
        centerTitle: true,
        title: Text("Add Item", style: AppWidget.headlineTextFieldStyle()),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload the Item Picture", style: AppWidget.semiBoldTextFieldStyle()),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: getImage,
                child: Center(
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: selectedImage == null
                          ? Icon(Icons.camera_alt_outlined, color: Colors.black)
                          : Image.file(selectedImage!, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text("Item Name", style: AppWidget.semiBoldTextFieldStyle()),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter item name",
                    hintStyle: AppWidget.lightTextFieldStyle(),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text("Item Price", style: AppWidget.semiBoldTextFieldStyle()),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter item price",
                    hintStyle: AppWidget.lightTextFieldStyle(),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text("Item Detail", style: AppWidget.semiBoldTextFieldStyle()),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  maxLines: 6,
                  controller: detailsController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter item detail",
                    hintStyle: AppWidget.lightTextFieldStyle(),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text("Select Category", style: AppWidget.semiBoldTextFieldStyle()),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: items.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item, style: TextStyle(fontSize: 18, color: Colors.black)),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() {
                      this.value = value;
                    }),
                    dropdownColor: Colors.white,
                    hint: Text("Select Category"),
                    iconSize: 36,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    value: value,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: uploadItem,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
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
    );
  }
}
