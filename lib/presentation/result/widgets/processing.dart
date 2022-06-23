import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';
import 'package:teste_rispar/common/constants/text_constant.dart';

class Processing extends StatelessWidget {
  final String state;

  const Processing({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return state == "error"
        ? buildError()
        : state == "loading"
            ? buildLoad()
            : buildNoConnection();
  }

  Widget buildError() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 120),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 45,
              color: Colors.red,
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                TextConstant.errorHasOccurred,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: const Text(
                TextConstant.messageError,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoad() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 120),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(
              animating: true,
              radius: 18,
              color: ColorConstant.cyan,
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                TextConstant.waitMoment,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: const Text(
                TextConstant.simulatingOrder,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNoConnection() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 120),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 45,
              color: Colors.orange,
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                TextConstant.noConnection,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: const Text(
                TextConstant.messageConnection,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
