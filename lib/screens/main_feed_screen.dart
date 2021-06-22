import 'package:flutter/material.dart';
import '../models/news_data.dart';
import '../widgets/news_item.dart';

class MainFeedScreen extends StatelessWidget {
  MainFeedScreen({Key? key}) : super(key: key);

  Future<void> _pullRefresh() async {}
  final List<Map<String, Object>> _newsList = NewsData().newsList;

  @override
  Widget build(BuildContext context) {
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
        ),
      ),
    ]);
  }
}
