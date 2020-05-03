import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CompanyCards extends StatelessWidget {
  const CompanyCards({Key key, this.title}) : super(key: key);

  final String title;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Card(
      child: ListTile(
        leading: Text(
          document['name'],
          style: Theme.of(context).textTheme.headline6,
        ),
        title: Text(
          document['phone'],
          style: Theme.of(context).textTheme.headline6,
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Cards"),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('company').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) => 
                _buildListItem(context, snapshot.data.documents[index]),

          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAlertDialog(context);
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {

    String companyName = '';
    String companyPhone = '';

    // set up the button
    Widget okButton = FlatButton(
     child: Text("OK"),
     onPressed: () { 
       print(companyName);
       print(companyPhone);
       Navigator.of(context).pop();
     },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      title: Text("My title"),

      content: new Wrap(

        children: <Widget>[
          new Flexible(
            child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Company Name',
                  contentPadding: const EdgeInsets.all(20.0)
                ),
              onChanged: (value) {
                companyName = value;
              },
            ),
          ),

          new Flexible(
            child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Company Phone',
                  contentPadding: const EdgeInsets.all(20.0)
                ),
              onChanged: (value) {
                companyPhone = value;
              },
            )
          )

        ],

      ),
      
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}