import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';
import 'package:teste_rispar/common/constants/text_constant.dart';
import 'package:teste_rispar/presentation/result/result_controller.dart';
import 'package:teste_rispar/presentation/result/widgets/item_list_result.dart';
import 'package:teste_rispar/presentation/result/widgets/processing.dart';
import 'package:teste_rispar/presentation/widgets/bottom_app_bar_custom.dart';

class ResultScreen extends GetView<ResultController> {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
        BottomAppBar(
            child: BottomAppBarCustom(
              text: TextConstant.newSimulation,
              validate: true,
              onPressed: controller.toHome,
            )
        ),
      appBar: AppBar(
        leading: const BackButton(
          color: ColorConstant.cyan,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.close,
              color: ColorConstant.cyan,
            ),
            onPressed: controller.toHome
          )
        ],
        title: Obx(()=>
        controller.visibilityDivider.value ? SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40),
                width: MediaQuery.of(context).size.width/2,
                height: 4,
                color: ColorConstant.gray,
              ),
              Container(
                margin: const EdgeInsets.only(left: 40),
                width: (MediaQuery.of(context).size.width/2)/1,
                height: 4,
                color: ColorConstant.cyan,
              ),
            ],
          ),
        ) : Container(),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
            Obx(()=>
              controller.loading.value || controller.noConnection.value || controller.error.value ?
              Processing(state: controller.error.value ? "error" : controller.loading.value ? "loading" : "connection") :
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15,bottom: 100),
                    child: const Text(
                      TextConstant.resultSimulation,
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ItemListResult(
                      text: TextConstant.amountChosen,
                      result: controller.amountChoseController.text),
                  ItemListResult(
                      text: TextConstant.warranty,
                      result: "${TextConstant.symbolBTC}${controller.simulationResponseModel.collateral}"),
                  ItemListResult(
                      text: TextConstant.interestRat,
                      result: "${controller.simulationResponseModel.interestRate}${TextConstant.symbolBTCinterestRat}"),
                  ItemListResult(
                      text: TextConstant.percentageWarrantyUpper,
                      result: "${controller.simulationResponseModel.ltv}${TextConstant.symbolPercentage}"),
                  ItemListResult(
                      text: TextConstant.firstDueDate,
                      result: DateFormat("dd/MM/yyyy").format(controller.simulationResponseModel.firstDueDate!)),
                  ItemListResult(
                      text: TextConstant.iof,
                      result: controller.amountIOFController.text),
                  ItemListResult(
                      text: TextConstant.platformFee,
                      result: controller.amountPlatformController.text),
                  ItemListResult(
                      text: TextConstant.totalFinanced,
                      result: controller.amountTotalController.text),
                  ItemListResult(
                      text: TextConstant.cetMonthly,
                      result: "${controller.simulationResponseModel.monthlyRate}${TextConstant.symbolPercentage}"),
                  ItemListResult(
                      text: TextConstant.cetAnnual,
                      result: "${controller.simulationResponseModel.annualRate}${TextConstant.symbolPercentage}"),
                  ItemListResult(
                      text: TextConstant.priceBTC,
                      result: controller.amountBTCController.text),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
