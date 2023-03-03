import 'package:flutter/material.dart';

import '../../common/constant/app_color_constant.dart';

class CustomTextformFormField extends StatelessWidget {
  const CustomTextformFormField({
    Key? key,
    this.istextCapitilization = false,
    this.hintText,
    this.suffixWidget,
    this.validator,
    this.enabledTextformField = true,
    this.isLableIconrequire = false,
    this.isFieldrequired = false,
    this.isLablerequire = false,
    this.ismaxLength = false,
    this.obscureText = false,
    this.issuffixIconrequired,
    this.iconData,
    required this.label,
    required this.keyboardType,
    required this.controller,
    required this.textInputAction,
  }) : super(key: key);
  final String label;
  final String? hintText;
  final bool? enabledTextformField;
  final bool? isFieldrequired;
  final Widget? issuffixIconrequired;
  final bool ismaxLength;
  final IconData? iconData;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool isLableIconrequire;
  final bool isLablerequire;
  final bool istextCapitilization;
  final bool obscureText;
  final Widget? suffixWidget;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    var enabledBorder = OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Color(0xffD5DAE1)),
      borderRadius: BorderRadius.circular(4.0),
    );
    var errorBoder = OutlineInputBorder(
      borderSide: BorderSide(
          width: 0.5,
          // color: Color(0xff575757),
          color: AppColorResources.textRed),
      borderRadius: BorderRadius.circular(4.0),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w100),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: obscureText,
              textCapitalization: istextCapitilization
                  ? TextCapitalization.words
                  : TextCapitalization.none,
              validator: validator,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              enabled: enabledTextformField,
              textInputAction: textInputAction,
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                counterText: "",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                suffix: suffixWidget,
                hintText: hintText,
                suffixIcon: issuffixIconrequired,
                fillColor: const Color(0x00ffffff),
                filled: true,
                border: enabledBorder,
                enabledBorder: enabledBorder,
                errorBorder: errorBoder,
                focusedErrorBorder: errorBoder,
                focusedBorder: enabledBorder,
                disabledBorder: enabledBorder,
              )),
        ],
      ),
    );
  }
}
