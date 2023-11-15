import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'shop_list.dart';

var sid ;
var date;
var cid;
var items;
var price;

class scan extends StatefulWidget{

  final String docid;
  const scan({Key? key,required this.docid}): super(key:key);
  @override
  _scanState createState()=>_scanState();
}



class _scanState extends State<scan> {

  @override


  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
      setState((){
        var spl=barcodeScanRes.split(":");
      items=spl[0];
      price=spl[1];});

    }
    on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
//barcode scanner flutter ant


  }





  Future<void> addPurchases() async{
    String _docid=widget.docid;
    CollectionReference customer =
    FirebaseFirestore.instance.collection('Bill');

    customer.doc(_docid).collection('Purchases').add({'items': items, 'price': price,});
  }


//barcode scanner flutter ant
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(

            appBar: AppBar(title: const Text('Barcode Scanner')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[

                       Text(
                          "${widget.docid}",

                       ),
                        ElevatedButton(
                            onPressed: () => { scanQR(), addPurchases(),},
                            child: const Text('Scan')),


                      ]));
            })));
  }
}
