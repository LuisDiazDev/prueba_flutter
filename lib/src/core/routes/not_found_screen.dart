import 'package:flutter/material.dart';
import 'package:testing/src/core/animations/entrance_fader.dart';
import 'package:testing/src/core/localization/app_localization.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: EntranceFader(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '404 - Page not found!'.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
