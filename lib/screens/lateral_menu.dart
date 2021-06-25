import 'package:flutter/material.dart';

class LateralMenu extends StatelessWidget {
  const LateralMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 50,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              'EDIT',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColorLight),
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
        ]),
      ),
    );
  }
}
