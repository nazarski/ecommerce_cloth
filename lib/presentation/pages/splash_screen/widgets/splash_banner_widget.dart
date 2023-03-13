import 'dart:math' as math;
import 'package:ecommerce_cloth/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class SplashBannerWidget extends StatelessWidget {
  const SplashBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColorsLight.primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Transform.rotate(
                angle: -math.pi / 6,
                child: const Text(
                  'E-commerce',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Transform.rotate(
                angle: -math.pi / 6, // угол поворота в радианах
                child: const Text(
                  'lamBda',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
