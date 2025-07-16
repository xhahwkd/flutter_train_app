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
  final String? excludeStation;

  StationListPage({required this.title, this.excludeStation, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredStations = excludeStation == null
        ? stations
        : stations.where((station) => station != excludeStation).toList();
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: ListView.separated(
        itemCount: filteredStations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredStations[index]),
            onTap: () => Navigator.pop(context, filteredStations[index]),
          );
        },
        separatorBuilder: (context, index) =>
            Divider(color: Colors.grey[300], height: 1, thickness: 1),
      ),
    );
  }
}
