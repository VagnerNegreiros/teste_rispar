import 'package:flutter/material.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';

class CustomSliderTheme extends StatelessWidget {
  final Widget child;

  const CustomSliderTheme({ required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double thumbRadius = 14;
    const double tickMarkRadius = 8;

    const activeColor = ColorConstant.cyan;
    const inactiveColor = ColorConstant.gray;

    return SliderTheme(
      data: const SliderThemeData(
        trackHeight: 5,

        /// Thumb
        rangeThumbShape: RoundRangeSliderThumbShape(
          disabledThumbRadius: thumbRadius,
          enabledThumbRadius: thumbRadius,
        ),

        /// Tick Mark
        rangeTickMarkShape:
        RoundRangeSliderTickMarkShape(tickMarkRadius: tickMarkRadius),

        /// Inactive
        inactiveTickMarkColor: inactiveColor,
        inactiveTrackColor: inactiveColor,

        /// Active
        thumbColor: activeColor,
        activeTrackColor: activeColor,
        activeTickMarkColor: activeColor,
      ),
      child: child,
    );
  }
}
