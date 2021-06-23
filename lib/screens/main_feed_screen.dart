import 'package:flutter/material.dart';
import '../models/news_data.dart';
import '../widgets/news_item.dart';

class MainFeedScreen extends StatelessWidget {
  Map<String, int> _modalValues;
  MainFeedScreen(this._modalValues);

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
            NewsItem(0, this._modalValues),
            NewsItem(1, this._modalValues),
            NewsItem(2, this._modalValues),
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
