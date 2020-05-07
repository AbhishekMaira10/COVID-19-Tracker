import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorldwidePanel extends StatelessWidget {
  const WorldwidePanel({
    Key key,
    @required this.worldData,
  }) : super(key: key);
  final Map worldData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          BuildChild(
            title: 'CONFIRMED',
            assetName: 'assets/images/count.png',
            color: Colors.orange,
            count: NumberFormat('#,###,###,###').format(worldData['cases']),
          ),
          BuildChild(
            title: 'ACTIVE',
            assetName: 'assets/images/fever.png',
            color: Colors.teal,
            count: NumberFormat('#,###,###,###').format(worldData['active']),
          ),
          BuildChild(
            title: 'RECOVERED',
            assetName: 'assets/images/patient.png',
            color: Colors.green,
            count: NumberFormat('#,###,###,###').format(worldData['recovered']),
          ),
          BuildChild(
            title: 'DEATHS',
            assetName: 'assets/images/death.png',
            color: Colors.red,
            count: NumberFormat('#,###,###,###').format(worldData['deaths']),
          ),
        ],
      ),
    );
  }
}

class BuildChild extends StatelessWidget {
  const BuildChild({
    Key key,
    @required this.title,
    @required this.assetName,
    @required this.color,
    @required this.count,
  }) : super(key: key);

  final String title;
  final String assetName;
  final Color color;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        height: 90,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.blueGrey[50],
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style:
                  Theme.of(context).textTheme.headline.copyWith(color: color),
            ),
            SizedBox(height: 4),
            SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      assetName,
                      color: color,
                    ),
                    Text(
                      count.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: color, fontWeight: FontWeight.w500),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
