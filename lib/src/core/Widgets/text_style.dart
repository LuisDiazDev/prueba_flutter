import 'package:flutter/material.dart';
import 'package:testing/src/core/values/colors.dart';

class GlobalTextStyle  extends TextStyle{
  const GlobalTextStyle({double size=16, Color color=ColorsApp.secondary, bool isBold=true, required bool extraSeparation}) : super(
    fontFamily: isBold ? 'DDIN-Bold' : 'DDIN',
    fontSize: size,
    color: color,
    overflow: TextOverflow.ellipsis,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    letterSpacing: extraSeparation ? 3 : null,
  );
}

class GlobalText extends Text{
  GlobalText(super.text, {super.key, double size=16, Color color=ColorsApp.secondary, bool isBold=true, bool extraSeparation=false}) : super(
    overflow: TextOverflow.clip,
    style: GlobalTextStyle(size: size, color: color, isBold: isBold, extraSeparation: extraSeparation),
  );
}