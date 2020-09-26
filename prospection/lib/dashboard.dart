import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:prospection/company/companyCards.dart';
import 'package:prospection/name/nameCards.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: Center(
                    child: Text(
                      "Prospection",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-76,
                  child: Center(
                    child: new Padding(
                      padding: const EdgeInsets.only(top: 0.1),
                      child: new StaggeredGridView.count(
                        crossAxisCount: 4,
                        staggeredTiles: _staggeredTiles,
                        children: _tiles,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        padding: const EdgeInsets.all(4.0),
                      )
                    ),
                  ),
                ),
              ],
            ),

            Positioned(
              top: 46.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.0),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1.0),
                      color: Colors.white),
                  child: Row(
                    children: [
                      PopupMenuButton<int>(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Text("Company"),

                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text("Name"),
                          ),
                        ],
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.red,
                        ),
                        onSelected: (value) {
                          if (value == 1) {
                            Navigator.push( 
                              context,
                              MaterialPageRoute(builder: (context) => CompanyCards()),
                            );
                          }
                          else if (value == 2) {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => NameCards()),
                            );
                          }
                        },
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          print("Search...");
                        },
                      ),
                      PopupMenuButton<int>(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Text("First"),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text("Second"),
                          ),
                        ],
                        icon: Icon(
                          Icons.menu,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(4, 1),
];

List<Widget> _tiles = const <Widget>[
  const _StaggeredGrid(Colors.green, Icons.widgets),
  const _StaggeredGrid(Colors.lightBlue, Icons.wifi),
  const _StaggeredGrid(Colors.amber, Icons.panorama_wide_angle),
  const _StaggeredGrid(Colors.brown, Icons.map),
  const _StaggeredGrid(Colors.deepOrange, Icons.send),
  const _StaggeredGrid(Colors.indigo, Icons.airline_seat_flat),
  const _StaggeredGrid(Colors.red, Icons.bluetooth),
  const _StaggeredGrid(Colors.pink, Icons.battery_alert),
  const _StaggeredGrid(Colors.purple, Icons.desktop_windows),
  const _StaggeredGrid(Colors.blue, Icons.radio),
];

class _StaggeredGrid extends StatelessWidget {
  const _StaggeredGrid(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}