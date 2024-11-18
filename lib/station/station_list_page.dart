import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final String title;
  final String? excludeStation; //제외 역
  final List<String> stations = [
    '수서',
    '동탄',
    '평택 지제',
    '천안 아산',
    '오송',
    '대전',
    '김천 구미',
    '동대구',
    '경주',
    '울산',
    '부산'
  ];

  StationListPage({required this.title, this.excludeStation});

  @override
  Widget build(BuildContext context) {
    final filteredStations = excludeStation != null
        ? stations.where((station) => station != excludeStation).toList()
        : stations;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: filteredStations.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: ListTile(
              title: Text(filteredStations[index]),
              onTap: () {
                Navigator.pop(context, filteredStations[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
