import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/model/audio_player_model.dart';
import 'package:provider/provider.dart';

class PlayTitle extends StatefulWidget {
  const PlayTitle({
    Key key,
  }) : super(key: key);

  @override
  _PlayTitleState createState() => _PlayTitleState();
}

class _PlayTitleState extends State<PlayTitle>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  AnimationController controller;
  bool firstTime = true;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void open() {
    final model = Provider.of<AudioPlayerModel>(context, listen: false);
    assetsAudioPlayer.open(Audio("assets/Breaking-Benjamin-Far-Away.mp3"));
    assetsAudioPlayer.currentPosition.listen((duration) {
      model.current = duration;
    });

    assetsAudioPlayer.current.listen((playAudio) {
      model.songDuration = playAudio.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      margin: EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "Far away",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                "-Breaking Benjamin-",
                style: TextStyle(
                    fontSize: 15, color: Colors.white.withOpacity(0.5)),
              ),
            ],
          ),
          Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: Color(0xFFF8CB51),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: controller,
            ),
            onPressed: () {
              final audioModel =
                  Provider.of<AudioPlayerModel>(context, listen: false);
              if (isPlaying) {
                controller.reverse();
                isPlaying = false;
                audioModel.controller.stop();
              } else {
                controller.forward();
                isPlaying = true;
                audioModel.controller.repeat();
              }

              if (firstTime) {
                open();
                firstTime = false;
              } else {
                assetsAudioPlayer.playOrPause();
              }
            },
          )
        ],
      ),
    );
  }
}
