import 'package:flutter/material.dart';
import 'enum.dart';


class ColorsApp{
//0xFF123258
  static const primary = Colors.white;
  static const secondary = Color(0xFF6565FF);
  static const alert = Color(0xffFFB100);
  static const grey = Color(0x5f949292);
  static const green = Color(0xff18DF80);
  static const textColor = Color(0xFF68A2F4);
  static const black = Color(0xF0000023);
  static const red = Color(0xFFc1121f);
  static const lightGray = Color(0x5fffecec);
}

const Map<InfoContextType, Color> boxDecorationColor = {
  InfoContextType.error: Color.fromARGB(255, 191, 52, 61),
  InfoContextType.warning: Color.fromARGB(200, 210, 166, 51),
  InfoContextType.info: ColorsApp.lightGray,
  InfoContextType.success: Color.fromARGB(150, 0, 255, 0),
};
