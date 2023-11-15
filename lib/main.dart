import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import'firebase_options.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'slogin.dart';
import 'sregister.dart';
import 'cdataentry.dart';
import 'sdataentry.dart';
import 'shop_list.dart';
import 'scanner.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}




class MyApp extends StatelessWidget {

  // This widget is the root of your application.

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      routes: {

        '/clogin': (context) => LoginScreen(),

        '/cregister': (context) => RegistrationScreen(),

        '/slogin': (context) => sLoginScreen(),

        '/sregister': (context) => sRegistrationScreen(),

        '/home': (context) => HomeScreen(),

        '/cdataentry': (context) => AddCustPage(),

        '/sdataentry': (context) => AddShopPage(),

        '/slist': (context) => shopList(),


      },

      title: 'BillingNow',

      theme: ThemeData(

        primarySwatch: Colors.indigo,

        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),

      home: MyHomePage(),

    );

  }

}



class MyHomePage extends StatefulWidget {

  @override

  _MyHomePageState createState() => _MyHomePageState();

}



class _MyHomePageState extends State<MyHomePage> {



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text("BillingNow"),

      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Text(

              'Experience Easy Billing!!',

              textAlign: TextAlign.center,

              style: TextStyle(

                fontSize: 50.0,

                fontFamily: "Verdana",

                fontWeight: FontWeight.w600,

              ),

            ),

            Padding(

              padding: EdgeInsets.all(10.0),

              child: FlatButton(

                onPressed: (){

                  Navigator.pushNamed(context,'/clogin');

                },

                padding: EdgeInsets.symmetric(

                  horizontal: 25.0,

                  vertical: 10.0,

                ),

                color: Color(0xFF1A237E),

                textColor: Colors.white,

                child: Text(

                  "Customer",

                  style: TextStyle(

                    fontSize: 30.0,

                    fontFamily: "Verdana",

                    fontWeight: FontWeight.w400,

                  ),

                ),

              ),

            ),

            Padding(

              padding: EdgeInsets.all(20.0),

              child: FlatButton(

                onPressed: (){

                  Navigator.pushNamed(context,'/slogin');

                },

                padding: EdgeInsets.symmetric(

                  horizontal: 25.0,

                  vertical: 10.0,

                ),

                color: Color(0xFF1A237E),

                textColor: Colors.white,

                child: Text(

                  "Shop",

                  style: TextStyle(

                    fontSize: 30.0,

                    fontFamily: "Verdana",

                    fontWeight: FontWeight.w400,

                  ),

                ),

              ),

            )

          ],

        ),

      ),

    ); // This trailing comma makes auto-formatting nicer for build methods.

  }

}
