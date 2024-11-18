import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple, brightness: Brightness.light),
  dividerColor: Colors.white, //좌석 선택 영역 (흰색)
  dialogBackgroundColor: Colors.grey[200], // 백그라운드 컬러
  highlightColor: Colors.purple, // 하이라이트 컬러 (퍼플)
  secondaryHeaderColor: Colors.grey[300], // 박스 컬러들 연회색
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle( // 버튼 컬러
      backgroundColor: WidgetStatePropertyAll(Colors.purple),
      foregroundColor: WidgetStatePropertyAll(Colors.grey[200]),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.black),// 역 이름 선택 텍스트 컬러
    ),
  ),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple, brightness: Brightness.dark),
  dividerColor: Colors.grey[800], //좌석 선택 영역 (회색)
  secondaryHeaderColor: Colors.grey[700], // 박스 컬러들 찐회색
  highlightColor: Colors.purple, // 하이라이트 컬러 (퍼플)
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(  // 버튼 컬러
      backgroundColor: WidgetStatePropertyAll(Colors.purple),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.white),// 역 이름 선택 텍스트 컬러
    ),
  ),
);
