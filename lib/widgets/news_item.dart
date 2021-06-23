import 'package:flutter/material.dart';

import '../screens/article_scren.dart';
import '../models/news_data.dart';

class NewsItem extends StatelessWidget {
  int id;
  Map<String, int> _modalValues;
  NewsItem(this.id, this._modalValues);

  @override
  Widget build(BuildContext context) {
    final _newsListItem = NewsData().newsList[id];
    final title = _newsListItem['title'].toString();
    final source = _newsListItem['source'].toString();
    final imageUrl = _newsListItem['image_url'].toString();
    //final articleUrl = _newsListItem['article_url'].toString();
    final date = DateTime.fromMillisecondsSinceEpoch(
        (_newsListItem['date'] as int) * 1000);
    final newsText = _newsListItem['news_text']
        .toString()
        .substring(0, 140); // maximo 150 caracteres
    final howPopular = _newsListItem['how_popular'] as int;

    print(_modalValues);
    int? _viewStyle = _modalValues['view'];
    int? _density = _modalValues['density'];

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

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return ArticleScreen(id);
            },
          ),
        );
      },
      child: Dismissible(
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
                'READ LATER',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: _viewStyle == 1
                    ? MediaQuery.of(context).size.width * 0.55
                    : MediaQuery.of(context).size.width * 0.92,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_viewStyle == 2)
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            height: 170,
                            width: MediaQuery.of(context).size.width * 92,
                          ),
                        ),
                      ),
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
                    if (_density == 1)
                      Text(
                        '$newsText...',
                        key: Key('newsText'),
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 17,
                        ),
                      ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '$howPopular  $source / $newsPieceAge',
                      key: Key('newsInfo'),
                      //'$howPopular  ${_viewStyle.toString()} / $newsPieceAge',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              if (_viewStyle == 1)
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
      ),
    );
  }
}
