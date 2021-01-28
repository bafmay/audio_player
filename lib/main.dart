import 'package:flutter/material.dart';
import 'package:music_player/src/model/audio_player_model.dart';
import 'package:provider/provider.dart';

import 'src/page/music_player_page.dart';
import 'src/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioPlayerModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        home: MusicPlayerPage(),
      ),
    );
  }
}
