import 'package:firebase_auth/firebase_auth.dart';
import 'rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';



//code for designing the UI of our text field where the user writes his email id or password



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email="";
  String password="";
  bool showSpinner = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
            inAsyncCall: showSpinner,
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
    TextField(
    keyboardType: TextInputType.emailAddress,
    textAlign: TextAlign.center,
    onChanged: (value) {
    email = value;
    //Do something with the user input.
    },
      decoration: InputDecoration(
        labelText: 'Enter Email ',
        labelStyle: TextStyle(fontSize: 20.0),
        border: OutlineInputBorder(),
        errorStyle:
        TextStyle(color: Colors.redAccent, fontSize: 15),
      ),
    ),
    SizedBox(
    height: 8.0,
    ),
    TextField(
    obscureText: true,
    textAlign: TextAlign.center,
    onChanged: (value) {
    password = value;
    //Do something with the user input.
    },
      decoration: InputDecoration(
        labelText: 'Enter Password ',
        labelStyle: TextStyle(fontSize: 20.0),
        border: OutlineInputBorder(),
        errorStyle:
        TextStyle(color: Colors.redAccent, fontSize: 15),
      ),
    ),
    SizedBox(
    height: 24.0,
    ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () async {

                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, '/slist');
                      }
                    } catch (e) {
                      print(e);
                    }

                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cregister');//signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )
    )
        )
    );
  }
}