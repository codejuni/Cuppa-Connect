import 'package:cuppa_connect/assets/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

IconButton iconButtonCart({
  required Color color,
  required int count,
  required bool state,
}) =>
    IconButton(
      onPressed: () {
        Get.to(
          const Scaffold(),
        );
      },
      icon: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/bag.png',
              height: 24,
              color: color,
              fit: BoxFit.fitHeight,
            ),
            state
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 9.5,
                      child: Text(
                        count > 9 ? '9+' : count.toString(),
                        style: Get.textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFonts.lato,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
