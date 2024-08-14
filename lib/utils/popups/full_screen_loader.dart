import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';

class TFullScreenLoader {
  static bool _isDialogOpen = false;

  static Future<void> openLoadingDialog(String text, String animation) async {
    if (!_isDialogOpen) {
      _isDialogOpen = true;
      await showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: TAnimationLoaderWidget(
              text: text,
              animation: animation,
              showAction: false,
            ),
          ),
        ),
      );
    }
  }

  static Future<void> stopLoading() async {
    if (_isDialogOpen) {
      _isDialogOpen = false;
      Navigator.of(Get.overlayContext!).pop();
    }
  }
}
