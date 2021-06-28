import 'package:flutter/material.dart';

import './saved_feed.dart';
import '../widgets/modal_feed_style.dart';
import '../widgets/modal_content_language.dart';
import '../widgets/modal_feed_counter.dart';
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
    _modalValues = {'view': 1, 'density': 0};
    setState(() {
      _selectedPageIndex = 2;
      _bodyWidget = MainFeedScreen(_modalValues);
    });
  }

  int _selectedPageIndex = 2;
  String appBarTitle = "Feed";
  Widget? _bodyWidget;
  List _appScreens = [
    Text('nothing'),
    SavedFeedScreen(),
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

  void _onItemTapped({required int index, BuildContext? ctx}) {
    print('hola');
    print(_modalValues);
    if (index == 0) {
      Scaffold.of(ctx!).openDrawer();
    } else if (index == 2) {
      setState(() {
        _selectedPageIndex = index;
        _bodyWidget = MainFeedScreen(_modalValues);
      });
    } else {
      setState(() {
        _selectedPageIndex = index;
        _bodyWidget = _appScreens[index];
      });
    }
  }

  void _markAsRead() {
    final snackBar = SnackBar(
      content: Text(
        'Articles marked as read',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
      ),
      backgroundColor: Colors.green[100],
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: LateralMenu(_onItemTapped),
        appBar: AppBar(
          elevation: 1,
          title: Text(
            _screenTitles[_selectedPageIndex],
            style: Theme.of(context).appBarTheme.textTheme != null
                ? Theme.of(context).appBarTheme.textTheme!.headline1
                : TextStyle(color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          leading: _selectedPageIndex == 2 || _selectedPageIndex == 1
              ? IconButton(
                  onPressed: () => showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColorLight,
                      builder: (context) {
                        return ModalFeedCounter();
                      }),
                  icon: Icon(Icons.circle_outlined),
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
                onPressed: _markAsRead,
                icon: Icon(Icons.check),
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
                    backgroundColor: Theme.of(context).primaryColorLight,
                    builder: (context) {
                      return ModalFeedStyle(_modalValues);
                    }).then(
                  (valor) {
                    if (valor != null) {
                      _modalValues = valor;
                      _onItemTapped(index: _selectedPageIndex, ctx: context);
                    }
                  },
                ),
                icon: Icon(Icons.more_horiz),
              ),
            if (_selectedPageIndex == 3)
              IconButton(
                onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    backgroundColor: Colors.white,
                    builder: (context) {
                      return ModalContentLanguage();
                    }),
                icon: Icon(Icons.translate),
              ),
          ],
        ),
        bottomNavigationBar: Builder(
          builder: (context) => BottomNavigationBar(
            onTap: (tabIndex) =>
                this._onItemTapped(index: tabIndex, ctx: context),
            //backgroundColor: Colors.white,
            unselectedItemColor: Theme.of(context).primaryColorLight,
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
                icon: Icon(Icons.rss_feed_outlined),
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
