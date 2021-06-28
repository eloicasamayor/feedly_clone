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
                        image: NetworkImage(
                            'https://co-well.vn/wp-content/uploads/2018/06/service-ar-overview.png'),
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
                        image: NetworkImage(
                            'https://www.betterteam.com/images/fashion-designer-interview-questions-4634x3580-2020129.jpeg?crop=21:16,smart&width=420&dpr=2'),
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
                        image: NetworkImage(
                            'https://www.finedininglovers.com/sites/g/files/xknfdk626/files/2021-06/Tea_1920_0.jpg'),
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
                        image: NetworkImage(
                            'https://images.adsttc.com/media/images/6081/a356/f91c/81f7/f500/006d/newsletter/Flooded_Modernity_1.jpg?1619108688'),
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
                    image: NetworkImage(
                        'https://www.promotionalwears.com/image/cache/catalog/data/medals/new-img/phim16-multi-sports-medal-gold-600x534.jpg'),
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
                    image: NetworkImage(
                        'http://i1.adis.ws/i/canon/eos-r6-rf24-105mm-f4_7.1_is_stm_front-on_square_6412568cc0e7484b96bd55e43069a56c'),
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
                    image: NetworkImage(
                        'https://www.latercera.com/resizer/LdkAW1t-EkRqUK_UAU3zyIXKA2s=/380x570/smart/arc-anglerfish-arc2-prod-copesa.s3.amazonaws.com/public/426NOOQY7FDDNEICFKJNVGJSKU.jpg'),
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
                    image: NetworkImage(
                        'https://www.foromarketing.com/wp-content/uploads/2018/03/La-moda-l%C3%ADquida.png'),
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
                    image: NetworkImage(
                        'https://www.euston96.com/wp-content/uploads/2018/11/Escultura-romana.jpg'),
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
