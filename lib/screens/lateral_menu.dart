import './main_menu.dart';
import 'package:flutter/material.dart';

class LateralMenu extends StatelessWidget {
  final Function onItemTaped;
  const LateralMenu(this.onItemTaped);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 50,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                'EDIT',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(
                Icons.crop_square_outlined,
              ),
              title: Text(
                'Today',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(
                Icons.bookmark_outline,
              ),
              title: Text(
                'Read Later',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(
                Icons.upgrade_outlined,
              ),
              title: Text(
                'Updgrade',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Feeds',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(
                Icons.menu,
              ),
              title: Text(
                'All',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              title: Text(
                'Internet and Software',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              title: Text(
                'Flutter news',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              title: Text(
                'Frontend development',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            InkWell(
              onTap: () {
                onItemTaped(index: 3);
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).primaryColorLight),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                height: 50,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Center(
                  child: Text(
                    'ADD CONTENT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(Icons.access_time),
              title: Text(
                'Recently Read',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(Icons.wb_sunny_outlined),
              title: Text(
                'Choose Theme',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(Icons.electrical_services),
              title: Text(
                'Integrations',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(Icons.card_giftcard),
              title: Text(
                'New Features',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(Icons.settings_outlined),
              title: Text(
                'Settings',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ListTile(
              dense: true,
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              leading: Icon(Icons.power_settings_new),
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
