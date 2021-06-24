import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ModalThemeConfig extends StatefulWidget {
  const ModalThemeConfig({Key? key}) : super(key: key);

  @override
  _ModalThemeConfigState createState() => _ModalThemeConfigState();
}

class _ModalThemeConfigState extends State<ModalThemeConfig> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Container(
      padding: EdgeInsets.all(20),
      height: 150,
      child: Column(children: [
        Text(
          'Dark Theme',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Switch(
          value: themeProvider.getDarkMode(),
          onChanged: (value) {
            setState(() {
              themeProvider.changeDarkMode(value);
            });
          },
        ),
      ]),
    );
  }
}
