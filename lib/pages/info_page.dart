import 'package:covid_19_tracker/models/custom_header2.dart';
import 'package:covid_19_tracker/models/global.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyHeader2(
                  image: "assets/icons/coronadr.svg",
                  textTop: "Get to know",
                  textBottom: "About Covid-19.",
                  offset: offset,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: RichText(
                    text: TextSpan(
                      text: "Symptoms of ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(
                          text: "COVID 19",
                          style: TextStyle(
                            color: AppColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
              ]),
        ],
      ),
    );
  }
}
