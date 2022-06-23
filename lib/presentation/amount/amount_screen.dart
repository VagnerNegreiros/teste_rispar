import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';
import 'package:teste_rispar/common/constants/text_constant.dart';
import 'package:teste_rispar/presentation/amount/amount_controller.dart';
import 'package:teste_rispar/presentation/widgets/application_toolbar.dart';
import 'package:teste_rispar/presentation/widgets/bottom_app_bar_custom.dart';

class AmountScreen extends GetView<AmountController> {
  const AmountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ApplicationToolbar(dividerContent:3),
        bottomNavigationBar:
        Obx(() =>
            BottomAppBar(
                child: BottomAppBarCustom(
                  text: TextConstant.proceed,
                  validate: controller.validate.value,
                  onPressed: controller.sendData,
                )
            ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20,bottom: 10),
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.black
                          ),
                          children: [
                            TextSpan(
                                text: TextConstant.howMuch,
                                style: TextStyle(color: ColorConstant.cyan)
                            ),
                            TextSpan(text: TextConstant.youNeedQuestion)
                          ]
                      )
                  ),
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorConstant.black
                        ),
                        children: [
                          TextSpan(text: TextConstant.insertValue),
                          TextSpan(
                              text: TextConstant.value1000,
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(text: TextConstant.a),
                          TextSpan(
                              text: TextConstant.value300000,
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ]
                    )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.5,
                  child: Center(
                    child: Form(
                      key: controller.formAmountKey,
                      child: TextFormField(
                        controller: controller.amountController,
                        onChanged: controller.onChanged,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return controller.validateAmount(value!);
                        },
                        style: const TextStyle(
                            color: ColorConstant.cyan,
                            fontSize: 32,
                            fontWeight: FontWeight.bold
                        ),

                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),

                        inputFormatters: [
                          LengthLimitingTextInputFormatter(13),
                        ],

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
