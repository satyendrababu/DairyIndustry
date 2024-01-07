import 'package:dairy_industry_conference/res/AppContextExtension.dart';
import 'package:dairy_industry_conference/screens/widgets/MyTextView.dart';
import 'package:dairy_industry_conference/utils/size_config.dart';
import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {

  final String? text;
  final Function? press;

  MyButton(this.text, this.press);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(45),
      child: TextButton(
        onPressed: press as void Function()?,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          backgroundColor: context.resources.color.colorButton

        ),
        child: MyTextView(
          text!,
          context.resources.color.colorWhite,
          16
        ),
      ),
    );
  }

}