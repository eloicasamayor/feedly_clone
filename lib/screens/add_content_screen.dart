import 'package:flutter/material.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Featured',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 215,
              margin: EdgeInsets.only(
                bottom: 30,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage('images/technology.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 130,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Technology',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage('images/design.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 130,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Design',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage('images/marketing.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 130,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Marketing',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage('images/economy.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 130,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Economy',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 20,
              ),
              child: Text(
                'Explore the web',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: AssetImage('images/sports.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text('Sports'),
              subtitle: Text('sources'),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: AssetImage('images/photography.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text('Photography'),
              subtitle: Text('sources'),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: AssetImage('images/culture.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text('Culture'),
              subtitle: Text('sources'),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: AssetImage('images/fashion.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text('Fashion'),
              subtitle: Text('sources'),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: AssetImage('images/history.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text('History'),
              subtitle: Text('sources'),
            ),
          ],
        ),
      ),
    );
  }
}
