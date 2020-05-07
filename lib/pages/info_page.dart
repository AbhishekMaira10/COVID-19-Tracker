import 'package:covid_19_tracker/models/custom_header2.dart';
import 'package:covid_19_tracker/models/global.dart';
import 'package:covid_19_tracker/panels/info_panel.dart';
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
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
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
                  text: "Now is the time to understand more,",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black87,
                  ),
                  children: [
                    TextSpan(
                      text: "so that we may fear less. ",
                      style: TextStyle(
                        color: Color(0xFF36C12C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
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
            Container(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  _buildSymptomItem("assets/images/fever2.png", "Fever"),
                  _buildSymptomItem("assets/images/drycough.png", "Dry Cough"),
                  _buildSymptomItem("assets/images/headache2.png", "Headache"),
                  _buildSymptomItem(
                      "assets/images/breathless.png", "Breathless"),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Prevention",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  _buildPrevention(
                      "assets/images/wash.png", "WASH", "hands often"),
                  _buildPrevention(
                      "assets/images/cover.png", "COVER", "your cough"),
                  _buildPrevention(
                      "assets/images/clean.png", "ALWAYS", "clean"),
                  _buildPrevention("assets/images/mask.png", "USE", "mask"),
                ],
              ),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          InfoPanel(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

Widget _buildSymptomItem(String path, String text) {
  return Column(
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          gradient: LinearGradient(
            colors: [
              AppColors.backgroundColor,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 3,
            )
          ],
        ),
        padding: EdgeInsets.only(top: 15),
        child: Image.asset(path),
        margin: EdgeInsets.only(right: 20),
      ),
      SizedBox(height: 7),
      Text(
        text,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget _buildPrevention(String path, String text1, String text2) {
  return Column(
    children: <Widget>[
      Container(
        width: 170,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            Image.asset(path),
            SizedBox(width: 10),
            RichText(
              text: TextSpan(
                  text: "$text1\n",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: text2,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ]),
            )
          ],
        ),
        margin: EdgeInsets.only(right: 20),
      ),
      SizedBox(height: 7),
    ],
  );
}
