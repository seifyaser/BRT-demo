import 'package:flutter/material.dart';

class BackgroundImages extends StatelessWidget {
  const BackgroundImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
     Image.asset("assets/Asset1.jpg", fit: BoxFit.cover),
        Image.asset("assets/image.png", fit: BoxFit.cover),
    Image.asset("assets/OverlayBackground.png", fit: BoxFit.cover),
      ],
    );
  }
}
