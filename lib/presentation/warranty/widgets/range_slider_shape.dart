import 'package:flutter/material.dart';
import 'package:teste_rispar/presentation/warranty/widgets/custom_slider_theme.dart';

class RangeSliderShape extends StatefulWidget {
  const RangeSliderShape({Key? key}) : super(key: key);

  @override
  _RangeSliderShapeState createState() => _RangeSliderShapeState();
}

class _RangeSliderShapeState extends State<RangeSliderShape> {
  static final labels = ['3', '6', '9', '12'];
  static const double min = 0.0;
  static final double max = labels.length - 1.0;

  RangeValues values = const RangeValues(0, 2);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CustomSliderTheme(
        child: Slider(
          value: 1,
          min: 3,
          max: 12,
          divisions: 4,
          onChanged: (values) => {},
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 22,right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: modelBuilder(
            labels,
                (index, label) {
              const selectedColor = Colors.black;
              final unselectedColor = Colors.black.withOpacity(0.3);
              final isSelected =
                  index >= values.start && index <= values.end;
              final color = isSelected ? selectedColor : unselectedColor;

              return buildLabel(label: label.toString(), color: color);
            },
          ),
        ),
      ),
    ],
  );

  Widget buildLabel({
    required String label,
    required Color color,
  }) =>
      Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ).copyWith(color: color),
      );

  static List<Widget> modelBuilder<M>(
      List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}

