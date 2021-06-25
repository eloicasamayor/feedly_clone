import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ModalThemeConfig extends StatefulWidget {
  const ModalThemeConfig({Key? key}) : super(key: key);

  @override
  _ModalThemeConfigState createState() => _ModalThemeConfigState();
}

class _ModalThemeConfigState extends State<ModalThemeConfig> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return Container(
      padding: EdgeInsets.all(20),
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dark Theme',
                style: Theme.of(context).textTheme.headline3,
              ),
              Switch(
                value: themeProvider.getDarkMode(),
                onChanged: (value) {
                  setState(() {
                    themeProvider.changeDarkMode(value);
                  });
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Text Size',
                style: Theme.of(context).textTheme.headline3,
              ),
              Row(
                children: [
                  Text('A'),
                  Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 20,
                      divisions: 2,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      }),
                  Text(
                    'A',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
