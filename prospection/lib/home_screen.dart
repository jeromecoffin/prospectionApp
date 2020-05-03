import 'package:prospection/login/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:prospection/company/companyCards.dart';
import 'package:prospection/name/nameCards.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Welcome';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: Container (
          child: ListView (
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Company'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CompanyCards()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.face),
                title: Text('Name'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NameCards()),
                  );
                },
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
      ),
    );
  }
}