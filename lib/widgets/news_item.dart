import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  String image_url;
  String source;
  String article_url;
  String title;
  DateTime date;
  String news_text;
  int how_popular;

  NewsItem(
    this.title,
    this.source,
    this.image_url,
    this.article_url,
    this.date,
    this.news_text,
    this.how_popular,
  );

  @override
  Widget build(BuildContext context) {
    //Duration hoursSincePublication = DateTime.now();
    return Dismissible(
      key: Key('key'),
      secondaryBackground: Container(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'MARK AS READ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.check,
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
      background: Container(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.bookmark_outline,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'MARK AS READ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '$how_popular  $source / $date',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                image_url,
                fit: BoxFit.cover,
                height: 84,
                width: MediaQuery.of(context).size.width * 0.35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
