import 'dart:io';

import 'package:dc_video_player/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoRoute extends StatefulWidget {
  static const routeName = '/VideoRoute';

  @override
  _VideoRouteState createState() => _VideoRouteState();
}

class _VideoRouteState extends State<VideoRoute> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  void setVideo(path) {
    if (playerController == null) {
      playerController = VideoPlayerController.file(path)
        ..addListener(listener)
        ..setVolume(1.0)
        ..setLooping(true)
        ..initialize().then((_) {
          playerController.play();
        });
    }
  }

  File args;

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments as File;
    setVideo(args);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("$args"),
      ),
      body: Column(
        children: [
          VideoPlayerWidget(controller: playerController),
          Row(
            children: [
              Slider(
                  value: playerController.value.volume,
                  max: 1,
                  min: 0,
                  onChanged: (value) {
                    playerController.setVolume(value);
                  }),
              Icon(playerController.value.volume != 0
                  ? Icons.volume_up
                  : Icons.volume_off)
            ],
          ),
          Row(
            children: [
              TextButton(
                child: Text("2x"),
                onPressed: () {
                  playerController.setPlaybackSpeed(2.0);
                },
              ),
              TextButton(
                child: Text("1.5x"),
                onPressed: () {
                  playerController.setPlaybackSpeed(1.5);
                },
              ),
              TextButton(
                child: Text("1.25x"),
                onPressed: () {
                  playerController.setPlaybackSpeed(1.25);
                },
              ),
              TextButton(
                child: Text("1x"),
                onPressed: () {
                  playerController.setPlaybackSpeed(1.0);
                },
              ),
              TextButton(
                child: Text("0.5x"),
                onPressed: () {
                  playerController.setPlaybackSpeed(0.5);
                },
              ),
              TextButton(
                child: Text("0.25x"),
                onPressed: () {
                  playerController.setPlaybackSpeed(0.25);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
