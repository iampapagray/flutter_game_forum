import 'package:flutter/material.dart';
import 'package:forum/common/app_background.dart';
import 'package:forum/model/forum.dart';
import 'package:forum/styleguide/colors.dart';

class DetailsPage extends StatelessWidget {
  final Forum forum;

  DetailsPage({this.forum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstOrangeCircleColor,
            secondColor: secondOrangeCircleColor,
            thirdColor: thirdOrangeCircleColor
          )
        ],
      ),
    );
  }
}