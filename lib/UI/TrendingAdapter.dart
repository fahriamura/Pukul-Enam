import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../NavBar/BottomBar.dart';
import '../NavBar/TabIconData.dart';
import '../PartView/Cardview.dart';
import '../PartView/TrendingView.dart';
import '../Themes/MainThemes.dart';


class TrendingAdapter extends StatefulWidget {
  @override
  _TrendingAdapterState createState() => _TrendingAdapterState();
}

class _TrendingAdapterState extends State<TrendingAdapter>
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
    tabBody = TrendingView(animationController: animationController);
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
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                Navigator.of(context).pop();
              });
            }else if (index == 1 || index == 3) {
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
          },
        ),
      ],
    );
  }
}

