import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/config/uidata.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final bool isTextHidden;
  final String? hintText;
  final IconData? buttonIcon;
  final bool togglePassword;
  final Function()? toggleFunction;
  final IconData? toggleIcon;
  final TextInputType? keyboardType;
  final bool readOnly;
  final Function()? onTap;
  final Function()? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focus;
  CommonTextField(
      {required this.controller,
      this.validator,
      this.labelText,
      this.hintText,
      this.isTextHidden = false,
      this.buttonIcon,
      this.onChanged,
      this.togglePassword = false,
      this.toggleFunction,
      this.toggleIcon,
      this.keyboardType,
      this.readOnly = false,
      this.onTap,
      this.inputFormatters,
      this.focus,
      Icon? prefix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      obscureText: isTextHidden,
      readOnly: readOnly,
      onTap: onTap,
      focusNode: focus,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          suffixIcon: togglePassword
              ? GestureDetector(onTap: toggleFunction, child: Icon(toggleIcon))
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          hintText: '',
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          filled: true,
          hintStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : UIDataColors.commonColor.withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
            letterSpacing: 0.0,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 11.0, horizontal: 18.0),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : UIDataColors.commonColor.withOpacity(0.7),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
            borderSide: BorderSide(
              color: UIDataColors.commonColor,
            ),
          )),
      controller: controller,
      validator: validator,
    );
  }
}
