import 'package:flutter/material.dart';

import '../widgets/modal_feed_style.dart';
import './search_screen.dart';
import './add_content_screen.dart';
import './main_feed_screen.dart';
import './lateral_menu.dart';

class MainMenu extends StatefulWidget {
  MainMenu(
    this.title,
  );

  final String title;
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late Map<String, int> _modalValues;
  @override
  void initState() {
    super.initState();
    _modalValues = {'view': 0, 'density': 0};
  }

  int _selectedPageIndex = 2;
  String appBarTitle = "Feed";
  Widget? _bodyWidget;
  List _appScreens = [
    Text('nothing'),
    Text('saved items screen'),
    Text('nothing'),
    AddContentScreen(),
    SearchScreen(),
  ];
  List _screenTitles = [
    '..',
    'Read Later',
    'Feed',
    'Add Content',
    'Power Search',
  ];

  void _onItemTapped(int index, BuildContext ctx) {
    setState(() {
      _selectedPageIndex = index;
    });
    if (index == 0) {
      Scaffold.of(ctx).openDrawer();
    } else if (index == 2) {
      setState(() {
        _bodyWidget = MainFeedScreen(_modalValues);
      });
    } else {
      setState(() {
        _bodyWidget = _appScreens[index];
      });
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
          title: Text(_screenTitles[_selectedPageIndex]),
          automaticallyImplyLeading: false,
          leading: _selectedPageIndex == 2
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.circle_outlined),
                  color: Colors.black38,
                )
              : null,
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
            if (_selectedPageIndex == 2 || _selectedPageIndex == 1)
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.check),
                color: Colors.black38,
              ),
            if (_selectedPageIndex == 2 || _selectedPageIndex == 1)
              IconButton(
                onPressed: () => showModalBottomSheet<Map<String, int>>(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    backgroundColor: Colors.white,
                    builder: (context) {
                      return ModalFeedStyle(_modalValues);
                    }).then(
                  (valor) {
                    if (valor != null) {
                      _modalValues = valor;
                      _onItemTapped(_selectedPageIndex, context);
                    }
                  },
                ),
                icon: Icon(Icons.more_horiz),
                color: Colors.black38,
              ),
            if (_selectedPageIndex == 3)
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.translate),
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
        body: _bodyWidget,
      ),
    );
  }
}
