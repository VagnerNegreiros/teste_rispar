import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';
import 'package:teste_rispar/common/constants/text_constant.dart';
import 'package:teste_rispar/presentation/result/result_controller.dart';
import 'package:teste_rispar/presentation/result/widgets/item_list_result.dart';
import 'package:teste_rispar/presentation/result/widgets/processing.dart';
import 'package:teste_rispar/presentation/widgets/application_toolbar.dart';
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
              controller.loading.value ?
              const Processing() :
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15,bottom: 120),
                    child: const Text(
                      TextConstant.resultSimulation,
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ItemListResult(text: "Valor escolhido",result: "teste"),
                  ItemListResult(text: "Garantia",result: "teste"),
                  ItemListResult(text: "Taxa de juros",result: "teste"),
                  ItemListResult(text: "Percentual de garantia",result: "teste"),
                  ItemListResult(text: "Primeiro vencimento",result: "teste"),
                  ItemListResult(text: "IOF",result: "teste"),
                  ItemListResult(text: "Tarifa de plataforma",result: "teste"),
                  ItemListResult(text: "Total financiado",result: "teste"),
                  ItemListResult(text: "CET mensal",result: "teste"),
                  ItemListResult(text: "CET anual",result: "teste"),
                  ItemListResult(text: "Cotação do BTC anual",result: "teste"),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
