
import 'package:flutter/material.dart';
import 'package:testing/src/core/Widgets/text_style.dart';
import 'package:testing/src/core/values/colors.dart';
import 'package:testing/src/core/values/enum.dart';


class GlobalDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required final String title,
    required final String message,
    required final List<Widget>? actions,
    required final Function? onTap,
    required final AlertType type,
    Exception? error,
    Map<String, dynamic>? metadata,
  }) async {
    // Cierra el diálogo actual si está abierto
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    return showDialog<T>(
      context: context,
      barrierDismissible: actions == null || actions.isEmpty || actions.length == 1,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            if (actions == null || actions.isEmpty || actions.length == 1) {
              Navigator.pop(context);
            }
          },
          child: _buildCustomDialog(
              title: title,
              message: message,
              actions: actions,
              onTap: onTap,
              context: context,
              type: type),
        );
      },
    );
  }

  static Widget _buildCustomDialog(
      {required String title,
      required String message,
      required List<Widget>? actions,
      required Function? onTap,
      required BuildContext context,
      required AlertType type}) {
    late Color boxDecColor;
    if (type == AlertType.error) {
      boxDecColor = boxDecorationColor[InfoContextType.error]!;
    } else if (type == AlertType.success) {
      boxDecColor = boxDecorationColor[InfoContextType.success]!;
    } else if (type == AlertType.info) {
      boxDecColor = boxDecorationColor[InfoContextType.info]!;
    } else if (type == AlertType.warning) {
      boxDecColor = boxDecorationColor[InfoContextType.warning]!;
    } else {
      boxDecColor = boxDecorationColor[InfoContextType.info]!;
    }

    if (actions == null || actions.isEmpty) {
      actions = [
        GlobalDialogAction(
          text: "OK",
          onPressed: () {
            Navigator.pop(context);
          },
          type: ActionType.info,
        )
      ];
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      backgroundColor: ColorsApp.primary,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: ColorsApp.primary,
          shape: BoxShape.rectangle,
          border: Border(
            left: BorderSide(
              color: boxDecColor,
              // Replace with the actual color you want
              width: 5, // Width of the side border
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Container(
              alignment: Alignment.topLeft,
              child: GlobalText(title, size: 18, isBold: true,color: ColorsApp.black,),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              child: GlobalText(message, size: 16, isBold: false,color: ColorsApp.black,),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions,
            ),
          ],
        ),
      ),
    );
  }
}

enum ActionType { info, destructive }

class GlobalDialogAction extends StatelessWidget {
  final String text;
  final ActionType type;
  final VoidCallback? onPressed;

  const GlobalDialogAction(
      {super.key, required this.text, required this.type, this.onPressed});

  @override
  Widget build(BuildContext context) {
    late Color textColor;
    if (type == ActionType.destructive) {
      textColor = ColorsApp.red;
    } else {
      textColor = ColorsApp.black;
    }
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 40.0,
          top: 10,
          bottom: 0,
        ),
        child: GlobalText(
          text.toUpperCase(),
          color: textColor,
          size: 16,
          isBold: false,
        ),
      ),
    );
  }
}
