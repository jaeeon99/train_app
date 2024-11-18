import 'package:flutter/material.dart';

class SelectSeatBox extends StatefulWidget {
  final int? selectedRow;
  final String? selectedCol;
  final void Function(int row, String col) onStationSelected;

  SelectSeatBox(this.selectedRow, this.selectedCol, this.onStationSelected);

  @override
  SeatBoxState createState() => SeatBoxState();
}

class SeatBoxState extends State<SelectSeatBox> {
  String? selectedSeat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLabelRow(), // 좌석 lable[A,B,C,D] 영역
        for (int rowNum = 1; rowNum <= 20; rowNum++) _buildSeatRow(rowNum),
      ],
    );
  }

  // 좌석 1줄 레이블 및 번호 넣기
  Row _buildSeatRow(int rowNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var col in ['A', 'B']) _buildSeat(rowNum, col),
        _buildNumberBox(rowNum),
        for (var col in ['C', 'D']) _buildSeat(rowNum, col),
      ],
    );
  }

  // 좌석 lable[A,B,C,D] 영역
  Widget _buildLabelRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var col in ['A', 'B', '', 'C', 'D'])
          Container(
            width: 50,
            height: 50,
            child: Center(
              child: Text(
                col,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
      ],
    );
  }

  // 중앙 행 번호 상자
  Widget _buildNumberBox(int rowNum) {
    return Container(
      width: 50,
      height: 50,
      child: Center(
        child: Text(
          '$rowNum',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  // 좌석 선택
  Widget _buildSeat(int rowNum, String col) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedSeat = '$col-$rowNum';
            widget.onStationSelected(rowNum, col);
          });
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: selectedSeat == '$col-$rowNum'
                ? Theme.of(context).highlightColor
                : Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
