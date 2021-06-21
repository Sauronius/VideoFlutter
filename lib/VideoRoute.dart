import 'package:dc_video_player/FilePickRoute.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoRoute extends StatefulWidget {
  static const routeName = '/VideoRoute';

  @override
  _VideoRouteState createState() => _VideoRouteState();
}

class _VideoRouteState extends State<VideoRoute> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as FNArgument;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(args.fName),
        ]),
      ),
    );
  }
}
