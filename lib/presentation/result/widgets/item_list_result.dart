import 'package:flutter/material.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';
class ItemListResult extends StatelessWidget {
  final String text;
  final String result;
  const ItemListResult({Key? key, required this.text, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(result,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.darkGray
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 2,
          color: ColorConstant.gray,
          margin: const EdgeInsets.all(15),
        )
      ],
    );
  }
}
