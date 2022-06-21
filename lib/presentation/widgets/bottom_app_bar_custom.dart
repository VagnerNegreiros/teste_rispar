import 'package:flutter/material.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';

class BottomAppBarCustom extends StatelessWidget {
  final String text;
  final bool validate;
  final VoidCallback onPressed;
  const BottomAppBarCustom({Key? key, required this.text, this.validate = true, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      color: validate == false ? ColorConstant.lightCyan : ColorConstant.cyan,
      child:
      MaterialButton(
        onPressed: validate == false ? null : onPressed,
        child: Text(text,
          style: const TextStyle(fontSize: 22,
              fontWeight: FontWeight.bold,
              color: ColorConstant.white),),
      ),
    );
  }
}
