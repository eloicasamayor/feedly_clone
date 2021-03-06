import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/custom_route.dart';
import '../widgets/modal_theme_config.dart';
import '../models/news_data.dart';

class ArticleScreen extends StatelessWidget {
  final int id;
  final int _newsType;
  ArticleScreen(this.id, this._newsType);
  static const String routeName = '/article-screen';
  var _newsList;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_newsType == 1) {
      _newsList = NewsData().newsList[id];
    } else if (_newsType == 2) {
      _newsList = NewsData().newsExploreList[id];
    } else if (_newsType == 3) {
      _newsList = NewsData().newsSavedList[id];
    }
    String _title = _newsList['title'].toString();
    String _source = _newsList['source'].toString();
    String _articleBody = _newsList['news_text'].toString();
    String _imageUrl = _newsList['image_url'].toString();
    String _articleUrl = _newsList['article_url'].toString();

    String swipeDirection = '';
    return Scaffold(
      appBar: AppBar(
        title: null,
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColorLight,
                builder: (context) {
                  return ModalThemeConfig();
                }),
            icon: Icon(
              Icons.format_size_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_border,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.star_border_outlined,
            ),
          ),
          IconButton(
            onPressed: () => Share.share(
                'check out my website https://github.com/eloicasamayor'),
            icon: Icon(
              Icons.share_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz_outlined,
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          swipeDirection = details.delta.dx < 0 ? 'left' : 'right';
        },
        onHorizontalDragEnd: (details) {
          print('id=$id');
          if (swipeDirection == 'left') {
            if (id == 2) {
              Navigator.pop(context);
              return;
            }

            Navigator.of(context).pushReplacement(
              CustomRoute(
                settings: RouteSettings(arguments: {'forward': true}),
                builder: (_) {
                  return ArticleScreen(id + 1, _newsType);
                },
              ),
            );
          }
          if (swipeDirection == 'right') {
            if (id == 0) {
              Navigator.pop(context);
              return;
            }
            Navigator.of(context).pushReplacement(
              CustomRoute(
                settings: RouteSettings(arguments: {'forward': false}),
                builder: (_) {
                  return ArticleScreen(id - 1, _newsType);
                },
              ),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                onTap: () => _launchInBrowser(_articleUrl),
                child:
                    Text(_title, style: Theme.of(context).textTheme.headline1),
              ),
              SizedBox(height: 10),
              Text(
                _source,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(height: 25),
              Image.network(_imageUrl),
              SizedBox(height: 20),
              Text(
                _articleBody,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorLight),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 55,
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Center(
                          child: Text(
                            'SHARE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => _launchInBrowser(_articleUrl),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorLight),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 55,
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Center(
                          child: Text(
                            'VISIT WEBSITE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
