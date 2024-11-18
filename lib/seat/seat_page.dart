import 'package:flutter/material.dart';
import 'package:flutter_train_app_/seat/widget/reservation_button.dart';
import 'package:flutter_train_app_/seat/widget/select_seat_box.dart';

class SeatPage extends StatefulWidget {
  final String departureStation;
  final String arrivalStation;

  SeatPage({required this.departureStation, required this.arrivalStation});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  String? selectedCol;

  // 좌석이 선택된 경우 선택된 행과 열 업데이트
  void onStationSelected(int row, String col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildStationInfoRow(), // 출발역 및 도착역 정보
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegend(Theme.of(context).highlightColor, '선택됨'),
                  SizedBox(width: 20),
                  _buildLegend(Theme.of(context).secondaryHeaderColor, '선택 안됨'),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child:
                    SelectSeatBox(selectedRow, selectedCol, onStationSelected),
              ),
            ),
            ReservationButton(selectedRow, selectedCol),
          ],
        ),
      ),
    );
  }

  // 출발역 및 도착역 정보
  Widget _buildStationInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStationText(widget.departureStation),
        Icon(Icons.arrow_circle_right_outlined, size: 30),
        _buildStationText(widget.arrivalStation),
      ],
    );
  }

  // 역이름 택스트 스타일
  Widget _buildStationText(String station) {
    return Text(
      station,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.purple,
        fontSize: 30,
      ),
    );
  }

  // 선택 됨, 선택 안됨 박스 (색상, 텍스트)
  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), //박스 모서리 라운드 8
            color: color,
          ),
        ),
        SizedBox(width: 4), //박스랑 글자 사이간격 4
        Text(label), // 선택됨, 선택 안됨
      ],
    );
  }
}
