import 'package:flutter/material.dart';
import 'package:forum/common/forum_card.dart';
import 'package:forum/common/tab_text.dart';
import 'package:forum/model/forum.dart';
import 'package:forum/styleguide/text_styles.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout> with SingleTickerProviderStateMixin {
  int selectedTabIndex = 2;

  AnimationController _controller;

  Animation<double> _animation;

  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  playAnimation(){
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -20,
            bottom: 0,
            top: 0,
            width: 110.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TabText(
                    text: "Media", 
                    isSelected: selectedTabIndex == 0,
                    onTabTap: () {
                      onTabTap(0);
                    }
                  ),
                  TabText(
                    text: "Streamers",
                    isSelected: selectedTabIndex == 1,
                    onTabTap: () {
                      onTabTap(1);
                    }
                  ),
                  TabText(
                    text:"Forum",
                    isSelected: selectedTabIndex == 2,
                    onTabTap: () {
                      onTabTap(2);
                    }
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:65.0),
            child: FutureBuilder(
              future: playAnimation(),
              builder: (context, snapshot){
                return FadeTransition(
                  opacity: _animation,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: getList(selectedTabIndex)
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getList(index){
    return [
      [
        ForumCard(forum: fortniteForum ),
        ForumCard(forum: pubgForum ),
        ForumCard(forum: fortniteForum ),
        ForumCard(forum: pubgForum ),
      ],
      [
        ForumCard(forum: pubgForum ),
        ForumCard(forum: fortniteForum ),
        ForumCard(forum: pubgForum ),
      ],
      [
        ForumCard(forum: fortniteForum ),
        ForumCard(forum: pubgForum ),
        ForumCard(forum: pubgForum ),
        ForumCard(forum: fortniteForum ),
        ForumCard(forum: fortniteForum ),
        ForumCard(forum: pubgForum ),
      ],
    ][index];
  }

  onTabTap(int index){
    setState((){
      selectedTabIndex = index;
    });
  }

}