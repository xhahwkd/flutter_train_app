import 'package:flutter/material.dart';

class AlphabetBox extends StatelessWidget {
  final String alphabet;
  const AlphabetBox({Key? key, required this.alphabet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Center(child: Text(alphabet, style: TextStyle(fontSize: 18))),
    );
  }
}
