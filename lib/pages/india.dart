import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  Future onRefresh() async {
    getData();
  }

  Future showcard(String loc, ind, inter, recover, death) async {
    await showDialog(
        context: context,
        builder: (BuildContext contect) {
          return AlertDialog(
            backgroundColor: Color(0xFF152238),
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    "State: $loc",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.cyan,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    "Indian Cases: $ind",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.orange,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    "Foreigner Cases: $inter",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.teal,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    "Total Recoveries: $recover",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    "Total Deaths: $death",
                    style: TextStyle(
                        fontSize: 25, color: Colors.red, fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  final String url = "https://api.rootnet.in/covid19-in/stats/latest";
  Future<List> datas;

  Future<List> getData() async {
    var response = await Dio().get(url);
    return response.data['data']['regional'];
  }

  @override
  void initState() {
    super.initState();
    datas = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Statewise Statistics'),
            backgroundColor: Color(0xFF152238)),
        backgroundColor: Colors.grey[100],
        body: RefreshIndicator(
          child: buildGrid(),
          onRefresh: () => onRefresh(),
        ));
  }

  Container buildGrid() {
    return Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
            future: datas,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0),
                    itemCount: 27,
                    itemBuilder: (BuildContext context, index) =>
                        GestureDetector(
                          onTap: () => showcard(
                              snapshot.data[index]['loc'],
                              snapshot.data[index]['confirmedCasesIndian']
                                  .toString(),
                              snapshot.data[index]['confirmedCasesForeign']
                                  .toString(),
                              snapshot.data[index]['discharged'].toString(),
                              snapshot.data[index]['deaths'].toString()),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                              child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(top: 5.0)),
                                      Text(
                                        'Indian Cases:${snapshot.data[index]['confirmedCasesIndian'].toString()}',
                                        style: TextStyle(
                                            color: Color(0xFF45b6fe),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 5.0)),
                                      Image(
                                        image: AssetImage(
                                            "assets/images/cases.png"),
                                        height: 100,
                                        width: 100,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 5.0)),
                                      Text(
                                        snapshot.data[index]['loc'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Circular',
                                            color: Colors.teal),
                                      ),
                                    ]),
                              )),
                        ));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
