import 'package:flutter/material.dart';

class ModalContentLanguage extends StatelessWidget {
  const ModalContentLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      child: Text('list of languages'),
    );
  }
}
