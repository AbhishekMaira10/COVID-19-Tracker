import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
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
            count: '123',
          ),
          BuildChild(
            title: 'ACTIVE',
            assetName: 'assets/images/fever.png',
            color: Colors.teal,
            count: '123',
          ),
          BuildChild(
            title: 'RECOVERED',
            assetName: 'assets/images/patient.png',
            color: Colors.green,
            count: '123',
          ),
          BuildChild(
            title: 'DEATHS',
            assetName: 'assets/images/death.png',
            color: Colors.red,
            count: '123',
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.all(10),
        height: 90,
        width: 190,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blueGrey[50]),
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
                      count,
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
