import 'widgets/news_item.dart';
import 'models/news_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<int, Color> colorPrincipal = {
    50: Color.fromRGBO(43, 178, 76, .1),
    100: Color.fromRGBO(43, 178, 76, .2),
    200: Color.fromRGBO(43, 178, 76, .3),
    300: Color.fromRGBO(43, 178, 76, .4),
    400: Color.fromRGBO(43, 178, 76, .5),
    500: Color.fromRGBO(43, 178, 76, .6),
    600: Color.fromRGBO(43, 178, 76, .7),
    700: Color.fromRGBO(43, 178, 76, .8),
    800: Color.fromRGBO(43, 178, 76, .9),
    900: Color.fromRGBO(43, 178, 76, .1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feedly Clone',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF2bb24c, colorPrincipal),
        textTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
        primaryColorBrightness: Brightness.light,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Colors.black),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: MyHomePage(title: 'Today'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPageIndex = 0;
  _selectPage(tabNum) {
    _selectedPageIndex = tabNum;
  }

  Future<void> _pullRefresh() async {}
  final List<Map<String, Object>> _newsList = NewsData().newsList;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(widget.title),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.circle_outlined),
            color: Colors.black38,
          ),
          bottom: TabBar(
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
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
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
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
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
        body: TabBarView(children: [
          RefreshIndicator(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  child: Text(
                    'Most popular',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 100, 220),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
                NewsItem(
                  _newsList[0]['title'].toString(),
                  _newsList[0]['source'].toString(),
                  _newsList[0]['image_url'].toString(),
                  _newsList[0]['article_url'].toString(),
                  DateTime.fromMillisecondsSinceEpoch(
                      (_newsList[0]['date'] as int) * 1000),
                  _newsList[0]['news_text'].toString(),
                  _newsList[0]['how_popular'] as int,
                ),
                NewsItem(
                  _newsList[1]['title'].toString(),
                  _newsList[1]['source'].toString(),
                  _newsList[1]['image_url'].toString(),
                  _newsList[1]['article_url'].toString(),
                  DateTime.fromMillisecondsSinceEpoch(
                      (_newsList[1]['date'] as int) * 1000),
                  _newsList[1]['news_text'].toString(),
                  _newsList[1]['how_popular'] as int,
                ),
                NewsItem(
                  _newsList[2]['title'].toString(),
                  _newsList[2]['source'].toString(),
                  _newsList[2]['image_url'].toString(),
                  _newsList[2]['article_url'].toString(),
                  DateTime.fromMillisecondsSinceEpoch(
                      (_newsList[2]['date'] as int) * 1000),
                  _newsList[2]['news_text'].toString(),
                  _newsList[2]['how_popular'] as int,
                ),
              ],
            ),
            onRefresh: _pullRefresh,
          ),
          SingleChildScrollView(
              child: Column(
            children: [
              Text('2'),
            ],
          )),
        ]),
      ),
    );
  }
}
