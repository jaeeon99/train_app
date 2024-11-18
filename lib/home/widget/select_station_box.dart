import 'package:flutter/material.dart';
import 'package:flutter_train_app_/station/station_list_page.dart';

typedef OnStationSelected = void Function(
    String stationType, String selectedStation);

class SelectStationBox extends StatelessWidget {
  final String departureStation;
  final String arrivalStation;
  final OnStationSelected onStationSelected;

  SelectStationBox({
    required this.departureStation,
    required this.arrivalStation,
    required this.onStationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStationBox(context, '출발역', departureStation, '출발역'),
          Container(
            //중앙 구분선
            height: 50,
            width: 2,
            color: Colors.grey,
          ),
          _buildStationBox(context, '도착역', arrivalStation, '도착역'),
        ],
      ),
    );
  }

  Widget _buildStationBox(BuildContext context, String title, String buttonText,
      String stationType) {
    return Container(
      height: 200,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () async {
              String? selectedStation = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StationListPage(
                    //좌석 선택 페이지로 넘어감
                    title: stationType,
                    excludeStation: stationType == '도착역'
                        ? departureStation // 도착역에서 출발역과 같은 역 선택
                        : (stationType == '출발역' ? arrivalStation : null),
                  ),
                ),
              );
              if (selectedStation != null) {
                onStationSelected(stationType, selectedStation);
              }
            },
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
