import 'package:covid_19_tracker/pages/india.dart';
import 'package:flutter/material.dart';

class IndiaPanel extends StatelessWidget {
  const IndiaPanel(
      {Key key,
      @required this.tCases,
      @required this.deaths,
      @required this.discharged})
      : super(key: key);
  final int tCases;
  final int deaths;
  final int discharged;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.blueGrey[50],
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 2,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => India())),
                      child: Text(
                        "          Indian \n Statewise Statistics",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFfe9900),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Total Cases: $tCases",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    "Discharged: $discharged",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    "Deaths: $deaths",
                    style: TextStyle(
                        fontSize: 20, color: Colors.red, fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
