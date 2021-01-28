import 'package:flutter/material.dart';
import 'package:music_player/src/model/audio_player_model.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myTextStyle = TextStyle(color: Colors.white.withOpacity(0.4));
    final model = Provider.of<AudioPlayerModel>(context);
    final percentage = model.percentage;
    return Container(
      child: Column(
        children: [
          Text("${model.songTotalDuration}", style: myTextStyle),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                width: 3,
                height: 210,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 210 * percentage,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text("${model.currentSecond}", style: myTextStyle),
        ],
      ),
    );
  }
}
