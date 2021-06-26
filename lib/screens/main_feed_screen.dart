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
            NewsItem(0, this.widget._modalValues),
            NewsItem(1, this.widget._modalValues),
            NewsItem(2, this.widget._modalValues),
          ],
        ),
        onRefresh: _pullRefresh,
      ),
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending in Tech',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
