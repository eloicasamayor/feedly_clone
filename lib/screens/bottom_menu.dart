import 'package:flutter/material.dart';

import './add_content_screen.dart';
import './main_feed_screen.dart';
import './lateral_menu.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPageIndex = 0;

  List _appScreens = [
    Text('nothing'),
    Text('saved items screen'),
    MainFeedScreen(),
    AddContentScreen(),
    Text('search screen'),
  ];

  void _onItemTapped(int index, BuildContext ctx) {
    if (index != 0) {
      setState(() {
        _selectedPageIndex = index;
      });
    } else {
      Scaffold.of(ctx).openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: LateralMenu(),
        appBar: AppBar(
          elevation: 1,
          title: Text(widget.title),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.circle_outlined),
            color: Colors.black38,
          ),
          bottom: _selectedPageIndex == 2
              ? TabBar(
                  tabs: [
                    Tab(
                      text: 'Me',
                      iconMargin: EdgeInsets.all(0),
                    ),
                    Tab(
                      text: 'Explore',
                      iconMargin: EdgeInsets.all(0),
                    ),
                  ],
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2,
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              : null,
          titleTextStyle: TextStyle(color: Colors.black38),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check),
              color: Colors.black38,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
              color: Colors.black38,
            ),
          ],
        ),
        bottomNavigationBar: Builder(
          builder: (context) => BottomNavigationBar(
            onTap: (tabIndex) => this._onItemTapped(tabIndex, context),
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black38,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedPageIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 1.5,
            iconSize: 26,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_outlined),
                label: 'menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline),
                label: 'saved',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.feed_outlined),
                label: 'feed',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_outlined),
                label: 'add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'search',
              ),
            ],
          ),
        ),
        body: _appScreens[_selectedPageIndex],
      ),
    );
  }
}
