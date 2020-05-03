import 'package:prospection/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
//class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Company'),
            ),
            ListTile(
              leading: Icon(Icons.group_work),
              title: Text('Sector'),
            ),
            ListTile(
              leading: Icon(Icons.face),
              title: Text('Name'),
            ),
            ListTile(
              title: Text('Sign out'),
              onTap: () {
              AuthService().signOut();
             },
            ),
          ],
        ),
      ),
    );
  }
}