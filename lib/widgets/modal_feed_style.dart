import 'package:flutter/material.dart';

enum FeedViewStyle { textOnly, Magazine, Cards }
enum FeedDensityStyle { Compact, Comfortable }

class ModalFeedStyle extends StatefulWidget {
  ModalFeedStyle({Key? key}) : super(key: key);

  @override
  _ModalFeedStyleState createState() => _ModalFeedStyleState();
}

class _ModalFeedStyleState extends State<ModalFeedStyle> {
  FeedViewStyle? _viewStyle = FeedViewStyle.Magazine;
  FeedDensityStyle? _densityStyle = FeedDensityStyle.Compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('View'),
          RadioListTile<FeedViewStyle>(
            title: const Text(
              'Text-Only',
              style: TextStyle(fontSize: 18),
            ),
            value: FeedViewStyle.textOnly,
            groupValue: _viewStyle,
            onChanged: (FeedViewStyle? value) {
              setState(() {
                _viewStyle = value;
              });
              //Navigator.of(context).pop();
            },
          ),
          RadioListTile<FeedViewStyle>(
            title: const Text(
              'Magazine',
              style: TextStyle(fontSize: 18),
            ),
            value: FeedViewStyle.Magazine,
            groupValue: _viewStyle,
            onChanged: (FeedViewStyle? value) {
              setState(() {
                _viewStyle = value;
              });
            },
          ),
          RadioListTile<FeedViewStyle>(
            title: const Text(
              'Cards',
              style: TextStyle(fontSize: 18),
            ),
            value: FeedViewStyle.Cards,
            groupValue: _viewStyle,
            onChanged: (FeedViewStyle? value) {
              setState(() {
                _viewStyle = value;
              });
            },
          ),
          Text('Density'),
          RadioListTile<FeedDensityStyle>(
            title: const Text(
              'Compact',
              style: TextStyle(fontSize: 18),
            ),
            value: FeedDensityStyle.Compact,
            groupValue: _densityStyle,
            onChanged: (FeedDensityStyle? value) {
              setState(() {
                _densityStyle = value;
              });
            },
          ),
          RadioListTile<FeedDensityStyle>(
            title: const Text(
              'Comfortable',
              style: TextStyle(fontSize: 18),
            ),
            value: FeedDensityStyle.Comfortable,
            groupValue: _densityStyle,
            onChanged: (FeedDensityStyle? value) {
              setState(() {
                _densityStyle = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
