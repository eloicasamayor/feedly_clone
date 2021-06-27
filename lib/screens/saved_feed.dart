import 'package:flutter/material.dart';
import '../widgets/news_item.dart';

class SavedFeedScreen extends StatefulWidget {
  const SavedFeedScreen({Key? key}) : super(key: key);

  @override
  _SavedFeedScreenState createState() => _SavedFeedScreenState();
}

class _SavedFeedScreenState extends State<SavedFeedScreen> {
  late Map<String, int> _modalValues;

  @override
  Widget build(BuildContext context) {
    _modalValues = {'view': 1, 'density': 0};

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'april 2020',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          NewsItem(3, 0, _modalValues),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'march 2019',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          NewsItem(3, 1, _modalValues),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'january 2018',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          NewsItem(3, 2, _modalValues),
        ],
      ),
    );
  }
}
