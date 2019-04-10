import 'package:flutter/material.dart';
import 'package:forum/common/app_background.dart';
import 'package:forum/common/horizontal_tab_layout.dart';
import 'package:forum/styleguide/colors.dart';
import 'package:forum/styleguide/text_styles.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstCircleColor,
            secondColor: secondCircleColor,
            thirdColor: thirdCircleColor
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    elevation: 10.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.apps, color: primaryColor),
                    ),
                    color: Colors.white,
                    shape: CircleBorder()
                  ),
                ),
              ),
              HeadingWidget(),
              HorizontalTabLayout(),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
                  child: Text( 'New Topic', style: buttonStyle,),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0)),
                  ),
                ),
              )
            ],
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: HorizontalTabLayout()
          // )
        ],
      ),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Forum',
            style: headingStyle,
          ),
          Text(
            'Kick off the conversation',
            style: subHeadingStyle,
          )
        ],
      ),
    );
  }
}

