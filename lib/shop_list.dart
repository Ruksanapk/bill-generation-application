import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';

class shopList extends StatefulWidget {
  @override
  _shopListState createState() => _shopListState();
}

class _shopListState extends State<shopList> {
  final db = FirebaseFirestore.instance;
  var sname;
  var docid=null;
  var cid;
  var date;

  void inputData() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
     cid = user.uid;
     date=DateTime.now();
  }

  Future<String?> addData() async {
    CollectionReference customer =
    FirebaseFirestore.instance.collection('Bill');
    return customer
        .add({'sid': sname, 'cid': cid, 'date': date, })
        .then((value) => ( docid=value.id))
        .catchError((error) => print('Failed to add data: $error'));
    setState((){scan(docid:docid);});
    //doc.id
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('shop').snapshots(),

        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(
                    title: Text(doc['ShopName']),

                    onTap: ()=>{inputData(),sname=doc['ShopName'],addData(),{Navigator.of(context).push(MaterialPageRoute(builder: (context) => scan(docid:docid),
                    )
                    )}
                }

              ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}