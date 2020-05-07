import 'package:covid_19_tracker/pages/india.dart';
import 'package:flutter/material.dart';

class IndiaPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Image(
            image: AssetImage("assets/images/india.png"),
            height: 90,
            width: 90,
          ),
          Padding(padding: EdgeInsets.all(10)),
          OutlineButton(
            borderSide: BorderSide(color: Color(0xFFfe9900)),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => India())),
            child: Text(
              "          Indian \n Statewise Statistics",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFfe9900),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]))));
  }
}
