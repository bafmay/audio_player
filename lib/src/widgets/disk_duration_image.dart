import 'package:flutter/material.dart';

import 'disk_image.dart';
import 'progressbar.dart';

class DiskDurationImage extends StatelessWidget {
  const DiskDurationImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DiskImage(),
          SizedBox(width: 20),
          ProgressBar(),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
