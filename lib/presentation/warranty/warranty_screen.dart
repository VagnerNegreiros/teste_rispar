import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';
import 'package:teste_rispar/common/constants/text_constant.dart';
import 'package:teste_rispar/presentation/Warranty/warranty_controller.dart';
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
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15,left: 30),
                    child: Text(
                      controller.amountValueString,
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold,
                      color: ColorConstant.cyan),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30,left: 30,bottom: 15),
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                fontSize: 20,
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
                  Obx(
                          () => SfSliderTheme(
                        data: SfSliderThemeData(
                            activeDividerRadius: 5,
                            activeTrackHeight: 5,
                            activeDividerColor: ColorConstant.cyan,
                            activeDividerStrokeColor: ColorConstant.cyan,
                            activeTrackColor: ColorConstant.cyan,
                            inactiveDividerRadius: 5,
                            inactiveTrackHeight: 5,
                            inactiveDividerColor: ColorConstant.gray,
                            inactiveTrackColor: ColorConstant.gray,
                            thumbColor: ColorConstant.cyan,
                        ),
                        child: SfSlider(
                          min: 3.0,
                          max: 12.0,
                          value: controller.ratingTerm.value,
                          interval: 3,
                          stepSize: 3,
                          showDividers: true,
                          showLabels: true,
                          onChanged: (dynamic value){
                            controller.onChangedPortionSlider(value);
                          },
                        ),
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30,left: 30, bottom: 15),
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                fontSize: 20,
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
                  Obx(
                          () => SfSliderTheme(
                        data: SfSliderThemeData(
                            activeDividerRadius: 5,
                            activeTrackHeight: 5,
                            activeDividerColor: ColorConstant.cyan,
                            activeDividerStrokeColor: ColorConstant.cyan,
                            activeTrackColor: ColorConstant.cyan,
                            inactiveDividerRadius: 5,
                            inactiveTrackHeight: 5,
                            inactiveDividerColor: ColorConstant.gray,
                            inactiveTrackColor: ColorConstant.gray,
                            thumbColor: ColorConstant.cyan,
                        ),
                        child: SfSlider(
                          min: 20.0,
                          max: 50.0,
                          value: controller.ratingLTV.value,
                          interval: 15,
                          stepSize: 15,
                          showDividers: true,
                          showLabels: true,
                          onChanged: (dynamic value){
                            controller.onChangedWarrantySlider(value);
                          },
                        ),
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50,left: 25),
                    child: const Text(
                      TextConstant.protectedWarranty,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                      color: ColorConstant.cyan),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20,left: 25),
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
                    style: TextStyle(fontSize: 18,
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
