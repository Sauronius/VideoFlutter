import 'package:flutter/material.dart';

class FavouritesRoute extends StatefulWidget {
  @override
  _FavouritesRouteState createState() => _FavouritesRouteState();
}
class _FavouritesRouteState extends State<FavouritesRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("widget.title"),
      ),
      body: Center
        ( child: Text("T3"),
      ),
    );
  }
}