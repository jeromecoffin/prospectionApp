import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CompanyCards extends StatelessWidget {
  const CompanyCards({Key key, this.title}) : super(key: key);

  final String title;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              document['name'],
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffddddff),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['phone'],
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
      onTap: () {
        print("Should");
      },
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
    );
  }
}