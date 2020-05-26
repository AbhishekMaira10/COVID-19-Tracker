import 'dart:convert';

import 'package:covid_19_tracker/models/Ticases.dart';
import 'package:covid_19_tracker/models/custom_header.dart';
import 'package:covid_19_tracker/pages/country_page.dart';
import 'package:covid_19_tracker/panels/india_panel.dart';
import 'package:covid_19_tracker/panels/most_affected_countries.dart';
import 'package:covid_19_tracker/panels/worldwide_panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wiredash/wiredash.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  double offset = 0;

  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=deaths');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  final String url = "https://api.rootnet.in/covid19-in/stats/latest";

  Future<Ticases> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    if (response.statusCode == 200) {
      final convertDataJson = jsonDecode(response.body)['data']['summary'];

      return Ticases.fromJson(convertDataJson);
    } else {
      throw Exception('Try to  Reload Page');
    }
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
    getJsonData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
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
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyHeader(
                image: "assets/icons/Drcorona.svg",
                textTop: "All you need to do",
                textBottom: "is stay at home!!!",
                offset: offset,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Worldwide',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF152238)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        launch('https://covid19responsefund.org/');
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Donate',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CountryPage()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff202c3b),
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Regional Stats',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
              worldData == null
                  ? CircularProgressIndicator()
                  : WorldwidePanel(
                      worldData: worldData,
                    ),
              SizedBox(height: 20),
              worldData == null
                  ? Container()
                  : PieChart(
                      dataMap: {
                        'confirmed': worldData['cases'].toDouble(),
                        'active': worldData['active'].toDouble(),
                        'recovered': worldData['recovered'].toDouble(),
                        'deaths': worldData['deaths'].toDouble()
                      },
                      animationDuration: Duration(milliseconds: 1000),
                      showChartValuesInPercentage: true,
                      colorList: [
                        Colors.orange,
                        Colors.teal,
                        Colors.green,
                        Colors.red
                      ],
                    ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Most Affected Countries',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF152238)),
                ),
              ),
              countryData == null
                  ? Container()
                  : MostAffectedPanel(
                      countryData: countryData,
                    ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Indian Statistics',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF152238)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<Ticases>(
                  future: getJsonData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      final covid = snapshot.data;
                      return IndiaPanel(
                          tCases: covid.total,
                          deaths: covid.deaths,
                          discharged: covid.discharged);
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Text(
                'WE ARE TOGETHER IN THIS FIGHT.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF152238)),
              )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Please give us your valuable',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF152238)),
                    )),
                  ),
                  GestureDetector(
                    onTap: Wiredash.of(context).show,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'feedback',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
