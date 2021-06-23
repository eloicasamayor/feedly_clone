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
            NewsItem(0),
            NewsItem(1),
            NewsItem(2),
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
