import 'package:dt_money/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.isMobileSize = false,
  });

  final bool isMobileSize;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    if (brightness == Brightness.light) {
      return Assets.images.logoDarkText.image(
        key: ValueKey(Assets.images.logoDarkText.path),
        height: isMobileSize ? 25 : 50,
        fit: BoxFit.cover,
      );
    }

    return Assets.images.logo.image(
      key: ValueKey(Assets.images.logo.path),
      height: isMobileSize ? 25 : 50,
      fit: BoxFit.cover,
    );
  }
}
