import 'package:flutter/material.dart';
import 'package:music_player/src/widgets/background.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';
import 'package:music_player/src/widgets/disk_duration_image.dart';
import 'package:music_player/src/widgets/lyrics.dart';
import 'package:music_player/src/widgets/play_title.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            CustomAppBar(),
            DiskDurationImage(),
            PlayTitle(),
            Expanded(child: Lyrics()),
          ],
        ),
      ),
    );
  }
}
