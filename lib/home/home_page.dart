import 'package:flutter/material.dart';
import 'package:flutter_train_app_/home/widget/select_station_box.dart';
import 'package:flutter_train_app_/home/widget/seleect_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String departureStation = '선택';
  String arrivalStation = '선택';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차 예매'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //좌석 선택 박스
            SelectStationBox(
              departureStation: departureStation, //출발역
              arrivalStation: arrivalStation, // 도착역
              onStationSelected: (String stationType, String selectedStation) {
                setState(() {
                  if (stationType == '출발역') {
                    departureStation = selectedStation;
                  } else if (stationType == '도착역') {
                    arrivalStation = selectedStation;
                  }
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            SelectButton(
              departureStation: departureStation,
              arrivalStation: arrivalStation,
            ),
          ],
        ),
      ),
    );
  }
}
