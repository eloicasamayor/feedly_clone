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
            leading: Icon(
              Icons.crop_square_outlined,
              color: Colors.black26,
            ),
            title: Text(
              'Today',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark_outline,
              color: Colors.black26,
            ),
            title: Text('Read Later'),
          ),
          ListTile(
            leading: Icon(
              Icons.upgrade_outlined,
              color: Colors.black26,
            ),
            title: Text('Updgrade'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Feeds',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black26),
          )
        ]),
      ),
    );
  }
}
