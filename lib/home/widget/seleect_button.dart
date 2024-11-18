import 'package:flutter/material.dart';
import 'package:flutter_train_app_/seat/seat_page.dart';


class SelectButton extends StatelessWidget {
  final String departureStation;
  final String arrivalStation;

  SelectButton({required this.departureStation, required this.arrivalStation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        // 출발역과 도착역 모두 선택된 이후 클릭 가능
        onPressed: (departureStation != '선택' && arrivalStation != '선택')
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SeatPage(
                          //좌석 선택 페이지 이동
                          departureStation: departureStation,
                          arrivalStation: arrivalStation)),
                );
              }
            : null,
        style:
            // 버튼 스타일
            ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          //택스트 스타일
          '좌석 선택',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
