import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReservationButton extends StatelessWidget {
  final int? selectedRow;
  final String? selectedCol;

  ReservationButton(this.selectedRow, this.selectedCol);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: selectedRow != null &&
                selectedCol != null //행과 열의 값이 비어있지 않은 경우 누를 수 있게
            ? () {
                showCupertinoDialog(
                  //팝업 창
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text('예매 하시겠습니까?'),
                    content: Text('좌석: $selectedCol-$selectedRow'),
                    actions: [
                      CupertinoDialogAction(
                        child: Text(
                          '취소',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      CupertinoDialogAction(
                        child: Text(
                          '확인',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                      ),
                    ],
                  ),
                );
              }
            : null,
        child: Text(
          '예매 하기',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
