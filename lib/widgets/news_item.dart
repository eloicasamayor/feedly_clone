import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/article_screen.dart';
import '../models/news_data.dart';

class NewsItem extends StatelessWidget {
  int _newsType;
  int id;
  Map<String, int> _modalValues;
  NewsItem(this._newsType, this.id, this._modalValues);

  @override
  Widget build(BuildContext context) {
    var _newsListItem;
    if (_newsType == 1) {
      _newsListItem = NewsData().newsList[id];
    } else if (_newsType == 2) {
      _newsListItem = NewsData().newsExploreList[id];
    } else if (_newsType == 3) {
      _newsListItem = NewsData().newsSavedList[id];
    }

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
    final Map<DismissDirection, double> _dismissThresholds = {
      DismissDirection.startToEnd: 1,
      DismissDirection.endToStart: 1
    };

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return ArticleScreen(id, _newsType);
            },
          ),
        );
      },
      child: Dismissible(
        dismissThresholds: _dismissThresholds,
        onDismissed: (direction) {
          print('dismissed on $direction');
          HapticFeedback.mediumImpact();
        },
        key: Key('key'),
        secondaryBackground: Container(
          color: Theme.of(context).accentColor,
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
          color: Theme.of(context).accentColor,
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
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    if (_density == 1)
                      Text(
                        '$newsText...',
                        key: Key('newsText'),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    Text(
                      '$howPopular  $source / $newsPieceAge',
                      key: Key('newsInfo'),
                      //'$howPopular  ${_viewStyle.toString()} / $newsPieceAge',
                      style: Theme.of(context).textTheme.subtitle2,
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
