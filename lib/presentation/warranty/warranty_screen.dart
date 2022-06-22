import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';
import 'package:teste_rispar/common/constants/text_constant.dart';
import 'package:teste_rispar/presentation/Warranty/warranty_controller.dart';
import 'package:teste_rispar/presentation/warranty/widgets/range_slider_shape.dart';
import 'package:teste_rispar/presentation/widgets/application_toolbar.dart';
import 'package:teste_rispar/presentation/widgets/bottom_app_bar_custom.dart';

class WarrantyScreen extends GetView<WarrantyController> {
  const WarrantyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationToolbar(dividerContent:1.5),
      bottomNavigationBar: BottomAppBar(
          child: BottomAppBarCustom(
            text: TextConstant.addGuarantee,
            onPressed: (){
              controller.sendData(true);
            }
          )
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15,left: 30),
                    child: const Text(
                      TextConstant.amountChosen,
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15,left: 30),
                    child: Text(
                      controller.amountValueString,
                      style: const TextStyle(fontSize: 46, fontWeight: FontWeight.bold,
                      color: ColorConstant.cyan),
                    ),
                  ),
                  // Obx(
                  //   () => SliderTheme(
                  //     data: const SliderThemeData(
                  //       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                  //   ), child:Slider(
                  //     value: controller.rating.value,
                  //     divisions: 4,
                  //     label: controller.rating.value.toString(),
                  //     activeColor: ColorConstant.cyan,
                  //     inactiveColor: ColorConstant.gray,
                  //     min: 3,
                  //     max: 12,
                  //     onChanged: (newRating){
                  //       controller.onChangedSlider(newRating);
                  //     },
                  //   ),)
                  // ),
                  Container(
                    margin: const EdgeInsets.only(top: 15,left: 30),
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                fontSize: 22,
                                color: ColorConstant.black
                            ),
                            children: [
                              TextSpan(text: TextConstant.choiceTheF),
                              TextSpan(text: TextConstant.quantityInstallments,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),

                            ]
                        )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15,left: 30),
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                fontSize: 22,
                                color: ColorConstant.black
                            ),
                            children: [
                              TextSpan(text: TextConstant.choiceTheM),
                              TextSpan(text: TextConstant.percentageWarranty,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),

                            ]
                        )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15,left: 25),
                    child: const Text(
                      TextConstant.protectedWarranty,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                      color: ColorConstant.cyan),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15,left: 25),
                    child: const Text(
                      TextConstant.textWarranty,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child:SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: MaterialButton(
                  onPressed: (){
                    controller.sendData(false);
                  },
                  child: const Text( TextConstant.continueWithoutWarranty,
                    style: TextStyle(fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.cyan),),
                ),
              )
          )
        ],
      ),
    );
  }
}
