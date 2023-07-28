import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/animatedBuilder_transform.dart';
import 'package:flutter_animations/animations/curves_clipper_animations.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50, left: 30, right: 30),
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(
                AnimatedBuilderTransform(),
              );
            },
            child: Text("AnimatedBuilder and Transform"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(
                ChaineCurvesClipperAnimation(),
              );
            },
            child: Text("Chained Animations Curves and Clipper"),
          )
        ],
      ),
    );
  }
}
