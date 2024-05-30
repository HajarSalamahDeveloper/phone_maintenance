import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_maintenance/core/share/style_manager.dart';
import 'package:phone_maintenance/core/share/text_widget.dart';
import 'package:phone_maintenance/core/share/value_manager.dart';

import 'color_manger.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {Key? key,
      this.labelTextOutSide,
      this.placeHolder,
      this.keyboardType,
      this.readOnly = false,
      this.onTap,
      this.suffixIcon,
      this.suffixIconConstraints,
      this.prefixIcon,
      this.prefixIconConstraints,
      this.initialValue,
      this.maxLines,
      this.minLines = 1,
      this.inputFormatters,
      this.textAlign = TextAlign.start,
      this.textDirection,
      this.validator,
      this.onChanged,
      this.constraints,
      this.maxLength,
      this.controller,
      this.contentPadding,
      this.isOptional,
      this.isRequired,
      this.fillColor,
      this.textInputAction,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.focusNode,
      this.obscureText,
      this.counter,
      this.borderSide,
      this.textStyle,
      this.borderDecoration,
      this.labelStyle,
      this.labelTextInsideDecoration,
      this.onTapSuffixIcon,
      this.decoration,
      this.paddingOut})
      : super(key: key);
  final TextEditingController? controller;
  final String? labelTextOutSide;
  final String? labelTextInsideDecoration;
  final TextStyle? labelStyle;
  final String? placeHolder;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onTapSuffixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final String? initialValue;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLines;
  final int? minLines;
  final double? paddingOut;
  final InputDecoration? decoration;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final BoxConstraints? constraints;
  final int? maxLength;
  final InputBorder? borderDecoration;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isOptional;
  final bool? isRequired;
  final Color? fillColor;
  final BorderSide? borderSide;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final Widget? counter;
  final bool? obscureText;

  @override
  State<TextFieldWidget> createState() => _ListFieldWidgetState();
}

class _ListFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.paddingOut ?? AppPadding.p20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelTextOutSide != null) ...[
            TextWidget(
              widget.labelTextOutSide,
              style: getBoldStyle(color: AppColor.fontColorLogin),
            ),
            // SizedBox(height: 10.h)
          ],
          Flexible(
            child: Container(
              decoration: const BoxDecoration(border: Border()),
              child: TextFormField(
                focusNode: widget.focusNode,
                controller: widget.controller,
                obscureText: widget.obscureText ?? false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: widget.keyboardType == TextInputType.number
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ] // Allow only digits
                    : null,
                onTapOutside: (event) {
                  if (widget.focusNode != null) {
                    widget.focusNode?.unfocus();
                  } else {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                textDirection: widget.textDirection,
                initialValue: widget.initialValue,
                validator: widget.validator,
                readOnly: widget.readOnly!,
                maxLength: widget.maxLength,
                onTap: widget.onTap,
                onFieldSubmitted: widget.onFieldSubmitted,
                onEditingComplete: widget.onEditingComplete,
                maxLines: widget.maxLines ?? 1,
                minLines: widget.minLines,
                onChanged: widget.onChanged,
                textAlign: widget.textAlign!,
                keyboardType: widget.keyboardType,
                expands: false,
                style: widget.textStyle ?? const TextTheme().bodySmall,
                textInputAction: widget.textInputAction,
                decoration: widget.decoration ??
                    InputDecoration(
                      labelText: widget.labelTextInsideDecoration,
                      labelStyle: widget.labelStyle ??
                          getMediumStyle(color: AppColor.fontColorLogin),
                      counter: widget.counter,
                      fillColor: widget.fillColor ?? AppColor.background2,
                      border: widget.borderDecoration ??
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.h),
                            borderSide: const BorderSide(
                              color: AppColor.purpleColor,
                              width: 1,
                            ),
                          ),
                      enabledBorder: widget.borderDecoration ??
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.h),
                            borderSide: const BorderSide(
                              color: AppColor.purpleColor,
                              width: 1,
                            ),
                          ),
                      focusedBorder: widget.borderDecoration ??
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.h),
                            borderSide: const BorderSide(
                              color: AppColor.purpleColor,
                              width: 1,
                            ),
                          ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      hintText: widget.placeHolder,
                      suffixIcon: suffixIcon(
                        IconButton(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                AppMargin.m16.h,
                                AppMargin.m14.w,
                                AppMargin.m20.h,
                                AppMargin.m14.w),
                            onPressed: widget.onTapSuffixIcon,
                            icon: widget.suffixIcon ?? const SizedBox()),
                      ),
                      suffixIconConstraints: widget.suffixIconConstraints,
                      prefixIcon: widget.prefixIcon,
                      prefixIconConstraints: widget.prefixIconConstraints ??
                          BoxConstraints(
                            maxHeight: 48.h,
                          ),
                      constraints: widget.constraints,
                      contentPadding: widget.contentPadding ??
                          EdgeInsetsDirectional.only(
                              top: AppPadding.p12.h, start: AppPadding.p12.w),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget suffixIcon(Widget? customIcon) {
    return Focus(
      canRequestFocus: false,
      descendantsAreFocusable: false,
      child: customIcon!, //Any icon or a custom widget
    );
  }
}
