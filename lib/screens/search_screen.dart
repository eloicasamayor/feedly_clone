import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  hintText: 'Find specific articles in your Feedly',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                ),
              ),
            ),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          'ALL FEEDS',
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          'LAST 30 DAYS',
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          'MATCHING EVERYTHING',
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          'SORT BY NEWEST',
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Search By Example'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('"Elon Musk"'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Put phrase inside quotes for an exact match'),
            ),
          ],
        ),
      ),
    );
  }
}
