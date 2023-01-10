import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:urban/widget.dart';

class Employee_details extends StatefulWidget {
  @override
  State<Employee_details> createState() => _Employee_detailsState();
}

class _Employee_detailsState extends State<Employee_details> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> datag;
  @override
  void initState() {
    super.initState();

    datag = my_data();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> my_data() {
    return FirebaseFirestore.instance.collection("pro").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: datag,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text(
                  "Loading....",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: Text("Loading...", style: TextStyle(fontSize: 25)),
              ),
            );
          }

          return Scaffold(
            backgroundColor: HexColor("#0d1927"),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  padding(context),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.all(3.0),
                          child: Column(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot snap1) {
                            Map<String, dynamic> data =
                                snap1.data() as Map<String, dynamic>;

                            return Column(
                              children: [
                                (data['status'] == "Active" &&
                                        int.parse(data['years']) > 5)
                                    ? card(
                                        "${data['status']}",
                                        "${data['image']}",
                                        "${data['name'].toString().toUpperCase()}",
                                        "Joined ${data['years']} years ago",
                                        Colors.green)
                                    : card(
                                        "${data['status']}",
                                        "${data['image']}",
                                        "${data['name'].toString().toUpperCase()}",
                                        "Joined ${data['years']} years ago",
                                        Colors.red)
                              ],
                            );
                          }).toList()),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
