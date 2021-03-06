import 'package:flutter/material.dart';
import 'package:teste_rispar/common/constants/color_constant.dart';

class ApplicationToolbar extends StatelessWidget with PreferredSizeWidget {
  final double dividerContent;
  final bool visibilityDivider;
  final bool closeIcon;
  final VoidCallback? closeFunction;

  const ApplicationToolbar(
      {Key? key,
      required this.dividerContent,
      this.visibilityDivider = true,
      this.closeIcon = false,
      this.closeFunction})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(
        color: ColorConstant.cyan,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        closeIcon
            ? IconButton(
                icon: const Icon(
                  Icons.close,
                  color: ColorConstant.cyan,
                ),
                onPressed: closeFunction)
            : Container()
      ],
      title: visibilityDivider
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 40),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 4,
                    color: ColorConstant.gray,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40),
                    width: (MediaQuery.of(context).size.width / 2) /
                        dividerContent,
                    height: 4,
                    color: ColorConstant.cyan,
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
