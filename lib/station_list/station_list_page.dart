import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final List<String> stations = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ];
  final String title;
  StationListPage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: ListView.separated(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stations[index], style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context, stations[index]);
              return; // 선택 시 결과 반환
            },
          );
        },
        separatorBuilder: (context, index) =>
            Divider(color: Colors.grey[300], height: 1, thickness: 1),
      ),
    );
  }
}
