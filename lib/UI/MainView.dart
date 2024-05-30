import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pukulenam/PartView/Profile.dart';
import 'package:pukulenam/UI/FormAdapter.dart';

import '../NavBar/BottomBar.dart';
import '../NavBar/TabIconData.dart';
import '../PartView/Cardview.dart';
import '../Themes/MainThemes.dart';
import 'ChatAdapter.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: MainAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = CardView(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF2F3F8),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormAdapter()),
            );
          },
          changeIndex: (int index) {
            if (index == 0 ) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return
                    setState(() {

                    });
                }
                setState(() {

                });
              });
            }
            else if (index ==1){
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return
                    setState(() {

                    });
                }
                setState(() {

                });
              });
            }
            else if(index == 2){
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatAdapter()),
                    );
                }
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatAdapter()),
                  );
                });
              });
            }
            else if (index == 3 ) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileSettings()),
                    );
                }
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileSettings()),
                  );
                });
              });
            }
          },
        ),
      ],
    );
  }
}

