import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// widget that show Appbar

Widget padding(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  color: HexColor("#122231"),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Employees Activity",
                    style: TextStyle(color: Colors.white24, fontSize: 18),
                  )
                ],
              )),
        ],
      ),
    ),
  );
}

// widget that shows card that contain employee details

Widget card(String status, String image, String name, String years, Color c) {
  return Card(
    color: HexColor("#0d1927"),
    elevation: 5,
    shadowColor: Colors.white,
    child: ListTile(
      trailing: c == Colors.green
          ? Container(
              height: 30,
              child: Icon(
                Icons.flag,
                color: c,
                size: 27,
              ),
            )
          : Text(""),
      leading: CircleAvatar(
        backgroundImage: NetworkImage("${image}"),
        radius: 24,
      ),
      title: Text(
        "$name",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      subtitle: Text(
        "$years",
        style: TextStyle(color: Colors.white38, fontSize: 13),
      ),
    ),
  );
}
