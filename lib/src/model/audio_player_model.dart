import 'package:flutter/material.dart';

class AudioPlayerModel extends ChangeNotifier {
  bool _playing = false;
  AnimationController _controller;
  Duration _songDuration = Duration(milliseconds: 0);
  Duration _current = Duration(milliseconds: 0);
  String get songTotalDuration => printDuration(_songDuration);
  String get currentSecond => printDuration(_current);

  double get percentage => (_songDuration.inSeconds > 0)
      ? this._current.inSeconds / this._songDuration.inSeconds
      : 0;

  bool get playing => this._playing;
  set playing(bool playing) {
    this._playing = playing;

    notifyListeners();
  }

  Duration get songDuration => this._songDuration;
  set songDuration(Duration duration) {
    this._songDuration = duration;
    notifyListeners();
  }

  Duration get current => this._current;
  set current(Duration duration) {
    this._current = duration;
    notifyListeners();
  }

  AnimationController get controller => this._controller;
  set controller(AnimationController controller) {
    this._controller = controller;
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitsMinutes:$twoDigitsSeconds";
  }
}
