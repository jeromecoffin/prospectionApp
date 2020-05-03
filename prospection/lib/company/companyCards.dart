import 'package:flutter/material.dart';

class CompanyCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Cards"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10,10,10,0),
        height: 220,
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Hello World'),
                      new Text('How are you?')
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}