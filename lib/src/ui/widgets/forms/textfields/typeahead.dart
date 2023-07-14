import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../utils/config/uidata.dart';


class TypeAheadField extends StatelessWidget {
  final String title;
  final controller;
  final String? placeholder;
  final Future<List<dynamic>> Function(String, [String, String, String])? suggestionsCallback;
  final Map<String, dynamic>?
      suggestionParametersExtraParams; // only for departments load users section not made it dynamic
  final String? suggestionsMapLabel;
  final String? suggestionsMapLabelConcat;
  final String? suggestionsMapid;
  final String? validatorMessage;
  final valController;
  final onselectduration;
  final Function()? onselectaction;
  final bool dontExpand;
  final bool readOnly;

  TypeAheadField({
    required this.title,
    required this.controller,
    this.placeholder,
    this.suggestionsCallback,
    this.suggestionParametersExtraParams, // only for departments load users section not made it dynamic
    this.valController,
    this.suggestionsMapLabel,
    this.suggestionsMapLabelConcat,
    this.suggestionsMapid,
    this.validatorMessage,
    this.onselectduration,
    this.onselectaction,
    this.dontExpand = false,
    this.readOnly = false,
  });

  @override
  Widget build(context) {
    Widget w = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
            fontSize: 16.0,
            color: UIDataColors.commonColor,
          ),
          textScaleFactor: 0.85,
        ),
        TypeAheadFormField(
          enabled: !readOnly,
          hideKeyboard: readOnly,
          textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              textInputAction: TextInputAction.next,
              autofocus: false,
              // focusNode: Get.find<BookingController>().focus,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: UIDataTextStyles.kReminderHintStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: UIDataColors.commonColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: UIDataColors.commonColor),
                ),
              )),
          // ignore: non_constant_identifier_names
          suggestionsCallback: (document_app) async {
            // print('document_app $document_app');
            // print('suggestionParametersExtraParams $suggestionParametersExtraParams');
            if (suggestionParametersExtraParams != null) {
              return await suggestionsCallback!(
                document_app,
                suggestionParametersExtraParams!['department'],
                suggestionParametersExtraParams!['group']?.toString() ?? '',
                suggestionParametersExtraParams!['offset']?.toString() ?? '',
              );
            }
            return suggestionsCallback!(document_app);
          },
          itemBuilder: (context, suggestion) {
            suggestion as Map<String, dynamic>;
            // print('item builder');
            return ListTile(
              title: suggestionsMapLabelConcat != null
                  ? Text(
                      '${suggestion[suggestionsMapLabel]}'
                              ' '
                              '${suggestion[suggestionsMapLabelConcat]}' +
                          (suggestion['email'] != null
                              ? ' - ${suggestion['email']}'
                              : ''),
                      textScaleFactor: 0.85,
                    )
                  : Text(
                      '${suggestion[suggestionsMapLabel]}',
                      textScaleFactor: 0.85,
                    ),
            );
          },
          transitionBuilder: (context, suggestionsBox, controller) {
            return suggestionsBox;
          },
          onSuggestionSelected: (suggestion) {
            suggestion as Map<String, dynamic>;
            // print('onsuggestion $suggestion');
            // print('onsuggestion $suggestionsMapid');
            // print('onsuggestion ${suggestion[suggestionsMapid]}');
            controller.text = suggestionsMapLabelConcat != null
                ? suggestion[suggestionsMapLabel] +
                    ' ' +
                    suggestion[suggestionsMapLabelConcat]
                : suggestion[suggestionsMapLabel];
            valController.text = suggestion[suggestionsMapid];
            if (onselectduration != null) {
              onselectduration.text = suggestion['duration'].toString();
            }
            if (onselectaction != null) onselectaction!();
            // print(suggestion);
          },
          // ignore: missing_return
          validator: (value) {
            // print('validator: $value');
            if (value == null) {
              return validatorMessage;
            }
            if (value.isEmpty) {
              return validatorMessage;
            }
            return null;
          },
        ),
      ],
    );
    if (dontExpand) return w;
    return Expanded(child: w);
  }
}

class TypeAheadFieldMulti extends StatelessWidget {
  final String title;
  final controller;
  final String? placeholder;
  final Future<List<dynamic>> Function(String) suggestionsCallback;
  final String? suggestionsMapLabel;
  final String? suggestionsMapLabelConcat;
  final String? suggestionsMapid;
  final String? validatorMessage;
  final valController;

  TypeAheadFieldMulti(
      {required this.title,
      this.controller,
      this.placeholder,
      required this.suggestionsCallback,
      this.valController,
      this.suggestionsMapLabel,
      this.suggestionsMapLabelConcat,
      this.suggestionsMapid,
      this.validatorMessage});

  @override
  Widget build(context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
              fontSize: 16.0,
              color: UIDataColors.commonColor,
            ),
            textScaleFactor: 0.85,
          ),
          TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
                controller: controller,
                textInputAction: TextInputAction.next,
                autofocus: false,
                // focusNode: Get.find<BookingController>().focus,
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: UIDataTextStyles.kReminderHintStyle,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: UIDataColors.commonColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: UIDataColors.commonColor),
                  ),
                )),
            // ignore: non_constant_identifier_names
            suggestionsCallback: (document_app) async {
              return suggestionsCallback(document_app);
            },
            itemBuilder: (context, suggestion) {
              suggestion as Map<String, dynamic>;
              return ListTile(
                title: suggestionsMapLabelConcat != null
                    ? Text(
                        suggestion[suggestionsMapLabel] +
                            ' ' +
                            suggestion[suggestionsMapLabelConcat],
                        textScaleFactor: 0.85,
                      )
                    : Text(
                        suggestion[suggestionsMapLabel],
                        textScaleFactor: 0.85,
                      ),
              );
            },
            transitionBuilder: (context, suggestionsBox, controller) {
              return suggestionsBox;
            },
            onSuggestionSelected: (suggestion) {
              suggestion as Map<String, dynamic>;
              // print('onsuggestion $suggestion');
              controller.text = suggestionsMapLabelConcat != null
                  ? suggestion[suggestionsMapLabel] +
                      ' ' +
                      suggestion[suggestionsMapLabelConcat]
                  : suggestion[suggestionsMapLabel];
              valController.text = suggestion[suggestionsMapid];
            },
            // ignore: missing_return
            validator: (String? value) {
              // print('validator: $value');
              if (value == null) {
                return validatorMessage;
              }
              if (value.isEmpty) {
                return validatorMessage;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
