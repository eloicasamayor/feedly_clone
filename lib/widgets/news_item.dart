import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  String imageUrl;
  String source;
  String articleUrl;
  String title;
  DateTime date;
  String newsText;
  int howPopular;

  NewsItem(
    this.title,
    this.source,
    this.imageUrl,
    this.articleUrl,
    this.date,
    this.newsText,
    this.howPopular,
  );

  @override
  Widget build(BuildContext context) {
    Duration timeSincePublication = DateTime.now().difference(date);
    int daysSincePublication = timeSincePublication.inDays;
    String newsPieceAge = '$daysSincePublication d';
    if (daysSincePublication == 0) {
      int hoursSincePublication = timeSincePublication.inHours;
      newsPieceAge = '$hoursSincePublication h';

      if (hoursSincePublication == 0) {
        int minutesSincePublication = timeSincePublication.inMinutes;
        newsPieceAge = '$minutesSincePublication min';
      }
    }

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
                    '$howPopular  $source / $newsPieceAge',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                imageUrl,
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
