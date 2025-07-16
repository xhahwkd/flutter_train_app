import 'package:flutter/material.dart';

class SelectStationBox extends StatelessWidget {
  final String title; // "출발역" 또는 "도착역"
  final String? selectedStation; // 선택된 역 (없으면 null)
  final VoidCallback onTap;

  const SelectStationBox({
    required this.title,
    required this.selectedStation,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          child: Text(selectedStation ?? "선택", style: TextStyle(fontSize: 40)),
          onTap: onTap,
        ),
      ],
    );
  }
}
