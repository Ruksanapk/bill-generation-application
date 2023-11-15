import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddShopPage extends StatefulWidget {
  AddShopPage({Key? key}) : super(key: key);

  @override
  _AddShopPageState createState() => _AddShopPageState();
}

class _AddShopPageState extends State<AddShopPage> {
  final _formKey = GlobalKey<FormState>();

  var shopname = "";
  var owner = "";
  var email = "";
  var phno = "";
  var city = "";
  var district = "";
  var pincode = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final shopnameController = TextEditingController();
  final emailController = TextEditingController();
  final phnoController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final pincodeController = TextEditingController();
  final ownerController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    shopnameController.dispose();
    emailController.dispose();
    phnoController.dispose();
    cityController.dispose();
    districtController.dispose();
    pincodeController.dispose();
    ownerController.dispose();
    super.dispose();
  }

  clearText() {
    shopnameController.clear();
    emailController.clear();
    phnoController.clear();
    cityController.clear();
    districtController.clear();
    pincodeController.clear();
    ownerController.clear();
  }

  // Adding customer
  CollectionReference shop =
  FirebaseFirestore.instance.collection('shop');

  Future<void> addUser() {
    return shop
        .add({'ShopName': shopname, 'Email': email, 'PhoneNo': phno,'Owner':owner, 'City':city,'District':district,'Pincode':pincode, })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Details"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Name: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: shopnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
                    } else if (!value.contains('@')) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Phone number: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: phnoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter phone number';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'House Name ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: ownerController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter house name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'City ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter city';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'District: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: districtController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter district';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Pincode: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: pincodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Pincode';
                    }
                    return null;
                  },
                ),
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            shopname = shopnameController.text;
                            email = emailController.text;
                            phno = phnoController.text;
                            owner = ownerController.text;
                            city = cityController.text;
                            district = districtController.text;
                            pincode = pincodeController.text;
                            addUser();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
