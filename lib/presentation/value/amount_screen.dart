import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';
import 'package:teste_rispar/common/constants/text_constant.dart';
import 'package:teste_rispar/presentation/value/amount_controller.dart';

class AmountScreen extends GetView<AmountController> {
  const AmountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
            child: Obx(() =>
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  color: controller.validate.value == false ? ColorConstant.lightCyan : ColorConstant.cyan,
                  child:
                  MaterialButton(
                    onPressed: controller.validate.value == false ? null : controller.sendForm,
                    child: const Text(TextConstant.proceed,
                      style: TextStyle(fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.white),),
                  ),
                ),)
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              ],
            ),
          ),
        )
    );
  }
}
