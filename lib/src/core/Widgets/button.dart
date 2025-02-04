import 'package:flutter/material.dart';
import 'package:testing/src/core/values/colors.dart';


enum ButtonType {
  primary,
  secondary,
  outlined,
  transparent,
  destructive,
}

class GlobalButton extends StatelessWidget {
  final ButtonType type;
  final bool isEnabled;
  final String text;
  final VoidCallback? onPressed;
  final Icon? icon;

  const GlobalButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type=ButtonType.primary,
    this.isEnabled = true,
    this.icon,
  });

  Color _getBackgroundColor(ButtonType style, bool isEnabled) {
    if (!isEnabled) return ColorsApp.lightGray; // Disabled color
    switch (style) {
      case ButtonType.primary:
        return ColorsApp.primary; // Replace with actual color
      case ButtonType.secondary:
        return ColorsApp.grey; // Replace with actual color
      case ButtonType.outlined:
        return Colors.transparent; // Replace with actual color
      case ButtonType.transparent:
        return Colors.transparent; // Replace with actual color
      case ButtonType.destructive:
        return ColorsApp.red; // Replace with actual color
      default:
        return Colors.transparent;
    }
  }

  ButtonStyle _buttonStyle(ButtonType style, bool isEnabled) {
    var backgroundColor = _getBackgroundColor(style, isEnabled);
    var foregroundColor = isEnabled ? Colors.white : Colors.grey[500];

    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        side: BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    late Color textColor;
    if (type == ButtonType.primary) {
      textColor = ColorsApp.black;
    } else if (type == ButtonType.transparent) {
      textColor = ColorsApp.primary;
    } else {
      textColor = ColorsApp.primary;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: _buttonStyle(type, isEnabled),
              onPressed: isEnabled ? onPressed : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    // bold
                    fontFamily: 'DDin-Bold',
                    fontSize: 14,
                    color: isEnabled

                        ? textColor
                        : ColorsApp.lightGray, // Example colors
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: icon != null,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: icon ?? Container()
            ),
          ),
        ],
      ),
    );
  }
}
