import 'package:flutter/material.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({Key? key}) : super(key: key);

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
                  hintText: 'Type a name, topic, or paste a URL',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Featured'),
            SizedBox(height: 20),
            Container(
              height: 215,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 130,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.amber),
                    width: 130,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.amber),
                    width: 130,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.amber),
                    width: 130,
                  ),
                ],
              ),
            ),
            Text('Explore the web'),
          ],
        ),
      ),
    );
  }
}
