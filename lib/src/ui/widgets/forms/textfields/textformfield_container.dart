import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/config/uidata.dart';

class TextFormFieldContainer extends StatelessWidget {
  TextFormFieldContainer({
    required this.hintText,
    required this.controllerText,
    this.readOnly = false,
    this.onTap,
    this.suffixicon = false,
    this.clearSuffixicon = false,
    this.clearAction,
    this.icon,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator,
    this.keyboard = TextInputType.text,
    this.formatter,
    this.showBorder = true,
  });

  final TextEditingController controllerText;
  final String hintText;
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
          suffixIcon: clearSuffixicon && suffixicon && clearAction != null
              ? (controllerText.text != ''
                  ? InkWell(
                      onTap: clearAction,
                      child: Container(
                        child: Icon(
                          Icons.cancel_outlined,
                          color: UIDataColors.commonColor,
                        ),
                      ),
                    )
                  : SvgPicture.asset(
                      UIDataVector.vectorDropDown,
                      fit: BoxFit.scaleDown,
                      color: UIDataColors.commonColor,
                    ))
              : (suffixicon
                  ? SvgPicture.asset(
                      UIDataVector.vectorDropDown,
                      fit: BoxFit.scaleDown,
                      color: UIDataColors.commonColor,
                    )
                  : null),
          hintStyle: UIDataTextStyles.kReminderHintStyle,
          enabledBorder: showBorder ? UnderlineInputBorder(
            borderSide: BorderSide(color: UIDataColors.commonColor),
          ) : null,
          focusedBorder: showBorder ? UnderlineInputBorder(
            borderSide: BorderSide(color: UIDataColors.commonColor),
          ) : null,
        ),
        controller: controllerText,
      ),
    );
  }
}
