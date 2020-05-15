import 'package:animated_background/animated_background.dart';
import 'package:covid/Screens/world.dart';
import 'package:covid/Screens/por_estado.dart';
import 'package:covid/Screens/info.dart';
import 'package:covid/Screens/countdown.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'mexico.dart';
import 'package:covid/my_widgts.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> with TickerProviderStateMixin {
  int _selectedIndex = 3;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
    Future.delayed(Duration.zero, () {
      double width = MediaQuery.of(context).size.width;
      showAlert(context, width);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //State class
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff071e3d),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 400),
        backgroundColor: Color(0xff071e3d),
        color: Color(0xff21e6c1),
        key: _bottomNavigationKey,
        index: _selectedIndex,
        items: <Widget>[
          Icon(FontAwesome.info_circle, size: 30),
          Icon(Feather.clock, size: 30),
          Icon(Entypo.list, size: 30),
          Icon(Entypo.location_pin, size: 30),
          Icon(MaterialCommunityIcons.earth, size: 30)
        ],
        onTap: _onItemTapped,
      ),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
                baseColor: Colors.white,
                spawnMaxRadius: 6,
                spawnMinRadius: 3,
                particleCount: 46,
                spawnMinSpeed: 15,
                spawnMaxSpeed: 25)),
        vsync: this,
        child: SafeArea(
          child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _selectedIndex = index);
              },
              children: <Widget>[
                Info(),
                Countdown(),
                States(),
                Mexico(),
                World()
              ]),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //
      //
      //using this page controller you can make beautiful animation effects
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    });
  }
}
