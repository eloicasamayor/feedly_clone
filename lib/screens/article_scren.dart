import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/news_data.dart';

class ArticleScreen extends StatelessWidget {
  final int id;
  ArticleScreen(this.id);
  static const String routeName = '/article-screen';

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
    String _title = NewsData().newsList[id]['title'].toString();
    String _source = NewsData().newsList[id]['source'].toString();
    String _articleBody = NewsData().newsList[id]['news_text'].toString();
    String _imageUrl = NewsData().newsList[id]['image_url'].toString();
    String _articleUrl = NewsData().newsList[id]['article_url'].toString();

    return Scaffold(
      appBar: AppBar(
        title: null,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.format_size_outlined,
              color: Colors.black38,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.black38,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.star_border_outlined,
              color: Colors.black38,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share_outlined,
              color: Colors.black38,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz_outlined,
              color: Colors.black38,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: () => _launchInBrowser(_articleUrl),
              child: Text(
                _title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              _source,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 25),
            Image.network(_imageUrl),
            SizedBox(height: 20),
            Text(
              _articleBody,
              style: TextStyle(
                fontSize: 16,
                height: 1.8,
              ),
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
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 55,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Center(
                        child: Text(
                          'SHARE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
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
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 55,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Center(
                        child: Text(
                          'VISIT WEBSITE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
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
    );
  }
}
