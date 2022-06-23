import 'package:flutter/material.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';

class BottomAppBarCustom extends StatelessWidget {
  final String text;
  final bool validate;
  final VoidCallback onPressed;

  const BottomAppBarCustom(
      {Key? key,
      required this.text,
      this.validate = true,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: validate == false ? ColorConstant.lightCyan : ColorConstant.cyan,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        onPressed: validate == false ? null : onPressed,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConstant.white),
        ),
      ),
    );
  }
}
