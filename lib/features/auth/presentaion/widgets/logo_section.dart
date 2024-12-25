import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/core/utils/app_assets.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: SvgPicture.asset(
            AppAssets.orangeTopShape,
            semanticsLabel: 'top Shape',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: -100,
          child: SvgPicture.asset(
            AppAssets.logo,
            semanticsLabel: 'app logo',
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
