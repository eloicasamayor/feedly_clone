import 'package:flutter/material.dart';
import '../models/news_data.dart';
import '../widgets/news_item.dart';

class MainFeedScreen extends StatefulWidget {
  Map<String, int> _modalValues;
  MainFeedScreen(this._modalValues);

  @override
  _MainFeedScreenState createState() => _MainFeedScreenState();
}

class _MainFeedScreenState extends State<MainFeedScreen> {
  Future<void> _pullRefresh() async {
    setState(() {});
  }

  final List<Map<String, Object>> _newsList = NewsData().newsList;

  @override
  Widget build(BuildContext context) {
    print(this.widget._modalValues);
    return TabBarView(children: [
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
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            NewsItem(1, 0, this.widget._modalValues),
            NewsItem(1, 1, this.widget._modalValues),
            NewsItem(1, 2, this.widget._modalValues),
          ],
        ),
        onRefresh: _pullRefresh,
      ),
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Text(
                'Trending in Tech',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            NewsItem(2, 0, this.widget._modalValues),
            NewsItem(2, 1, this.widget._modalValues),
            NewsItem(2, 2, this.widget._modalValues),
          ],
        ),
      ),
    ]);
  }
}
