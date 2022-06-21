import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';
import 'package:teste_rispar/common/constants/image_constant.dart';
import 'package:teste_rispar/common/constants/text_constant.dart';
import 'package:teste_rispar/presentation/home/home_controller.dart';
import 'package:teste_rispar/presentation/widgets/bottom_app_bar_custom.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(ImageConstant.creditSimulation,),
              Container(
                margin: const EdgeInsets.only(top: 25,left: 30),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.black
                    ),
                    children: [
                    TextSpan(text: TextConstant.simulate),
                    TextSpan(
                      text: TextConstant.now,
                      style: TextStyle(color: ColorConstant.cyan)
                    )
                    ]
                  )
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15,left: 30),
                child: const Text(
                  TextConstant.creditBenefits,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              Form(
                key: controller.formKey,
                child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 70,left: 30, ),
                        child: RichText(
                            text: const TextSpan(
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorConstant.black
                                ),
                                children: [
                                  TextSpan(text: TextConstant.whatsYour),
                                  TextSpan(
                                      text: TextConstant.fullNameQuestion,
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  )
                                ]
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: controller.nameController,
                          onChanged: controller.onChanged,
                          validator: (value) {
                            return controller.validateName(value!);
                          },
                          decoration: const InputDecoration(hintText: TextConstant.fullName,
                              hintStyle: TextStyle(fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25,left: 30),
                        child: RichText(
                            text: const TextSpan(
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorConstant.black
                                ),
                                children: [
                                  TextSpan(text: TextConstant.itsYour),
                                  TextSpan(
                                      text: TextConstant.emailQuestion,
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  )
                                ]
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, right:30, bottom:70),
                        child: TextFormField(
                          controller: controller.emailController,
                          onChanged: controller.onChanged,
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                          decoration: const InputDecoration(hintText: TextConstant.emailExample,
                              hintStyle: TextStyle(fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
