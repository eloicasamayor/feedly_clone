import 'package:flutter/material.dart';

enum FeedViewStyle { textOnly, Magazine, Cards }
enum FeedDensityStyle { Compact, Comfortable }

class ModalFeedStyle extends StatefulWidget {
  final _modalValues;
  ModalFeedStyle(this._modalValues);

  @override
  _ModalFeedStyleState createState() => _ModalFeedStyleState();
}

class _ModalFeedStyleState extends State<ModalFeedStyle> {
  FeedViewStyle? _viewStyle;
  FeedDensityStyle? _densityStyle = FeedDensityStyle.Compact;

  @override
  void initState() {
    _viewStyle = FeedViewStyle.values[widget._modalValues['view']];
    _densityStyle = FeedDensityStyle.values[widget._modalValues['density']];
    super.initState();
  }

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
              Navigator.of(context).pop({
                'view': _viewStyle!.index,
                'density': _densityStyle!.index,
              });
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
              Navigator.of(context).pop({
                'view': _viewStyle!.index,
                'density': _densityStyle!.index,
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
              Navigator.of(context).pop({
                'view': _viewStyle!.index,
                'density': _densityStyle!.index,
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
              Navigator.of(context).pop({
                'view': _viewStyle!.index,
                'density': _densityStyle!.index,
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
              Navigator.of(context).pop({
                'view': _viewStyle!.index,
                'density': _densityStyle!.index,
              });
            },
          ),
        ],
      ),
    );
  }
}
