import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      bottomNavigationBar:
      Obx(() =>
          BottomAppBar(
              child: BottomAppBarCustom(
                validate: controller.validate.value,
                onPressed: controller.sendForm,
              )
          ),
      ),
      body: SizedBox(
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
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Form(
                key: controller.formKey,
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
