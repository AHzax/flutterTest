import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/config/uidata.dart';

class TextFormFieldContainer extends StatelessWidget {
  TextFormFieldContainer({
    required this.hintText,
    this.labelText,
    required this.controllerText,
    this.readOnly = false,
    this.onTap,
    this.suffixicon = false,
    this.clearSuffixicon = false,
    this.clearAction,
    this.icon,
    required this.commonColor,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator,
    this.keyboard = TextInputType.text,
    this.formatter,
    this.showBorder = true,
    this.hintStyle,
  });

  final TextEditingController controllerText;
  final String hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final Color commonColor;
  final bool readOnly;
  final Function()? onTap;
  final bool suffixicon;
  final bool clearSuffixicon;
  final int minLines;
  final int maxLines;
  final IconData? icon;
  final String? Function(String?)? validator;
  final Function()? clearAction;
  final formatter;
  final bool showBorder;
  final keyboard;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        onTap: onTap,
        minLines: minLines,
        maxLines: maxLines,
        readOnly: readOnly,
        validator: validator,
        keyboardType: keyboard,
        inputFormatters: formatter,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.only(bottom: -14),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            fontSize: 20,
            fontFamily: "inter",
            color: UIDataColors.commonColor,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: clearSuffixicon && suffixicon && clearAction != null
              ? (controllerText.text != ''
                  ? InkWell(
                      onTap: clearAction,
                      child: Container(
                        child: Icon(
                          Icons.cancel_outlined,
                          color: commonColor,
                        ),
                      ),
                    )
                  : SvgPicture.asset(
                      UIDataVector.vectorDropDown,
                      fit: BoxFit.scaleDown,
                      color: commonColor,
                    ))
              : (suffixicon
                  ? SvgPicture.asset(
                      UIDataVector.vectorDropDown,
                      fit: BoxFit.scaleDown,
                      color: commonColor,
                    )
                  : null),
          hintStyle: hintStyle,
          enabledBorder: showBorder
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: commonColor),
                )
              : null,
          focusedBorder: showBorder
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: commonColor),
                )
              : null,
        ),
        controller: controllerText,
      ),
    );
  }
}
