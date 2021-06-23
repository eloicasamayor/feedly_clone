import 'package:flutter/material.dart';

class ModalFeedCounter extends StatelessWidget {
  const ModalFeedCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 150,
      child: Center(child: Text('Readed posts data')),
    );
  }
}
