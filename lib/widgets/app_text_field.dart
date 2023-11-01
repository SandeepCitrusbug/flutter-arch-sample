import 'package:blockrx/utils/color_const.dart';
import 'package:blockrx/utils/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextFormFields extends StatefulWidget {
  AppTextFormFields({
    Key? key,
    required this.controller,
    required this.label,
    this.hint,
    this.textStyle,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.minLines,
    this.maxLines = 1,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.focusNode,
    this.readOnly = false,
    this.prefixIcon,
    this.showError = false,
    this.onChanged,
  }) : super(key: key);

  AppTextFormFields.prefix({
    Key? key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.hint,
    this.textStyle,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.minLines,
    this.maxLines = 1,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.focusNode,
    this.readOnly = false,
    this.showError = false,
    this.onChanged,
  }) : super(key: key);

  AppTextFormFields.multiline({
    Key? key,
    required this.controller,
    required this.label,
    this.hint,
    this.textStyle,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.minLines = 3,
    this.maxLines = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.focusNode,
    this.readOnly = false,
    this.showError = false,
    this.prefixIcon,
    this.onChanged,
  }) : super(key: key);

  AppTextFormFields.intOnly({
    Key? key,
    required this.controller,
    this.label,
    this.hint,
    this.textStyle,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.minLines,
    this.maxLines,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.focusNode,
    this.readOnly = false,
    this.showError = false,
    this.prefixIcon,
    this.onChanged,
  })  : textInputType = const TextInputType.numberWithOptions(
            decimal: false, signed: false),
        super(key: key);

  final TextEditingController controller;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  FormFieldValidator<String>? validator;
  TextStyle? textStyle;
  final String? label;
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? prefixIcon;
  int? minLines;
  int? maxLines;
  EdgeInsetsGeometry padding;
  FocusNode? focusNode;
  final bool readOnly;
  final bool showError;
  ValueChanged<String>? onChanged;

  @override
  State<AppTextFormFields> createState() => _AppTextFormFieldsState();
}

class _AppTextFormFieldsState extends State<AppTextFormFields> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: ColorConst.fontColorBlack,
        width: 1,
      ),
    );
    return TextFormField(
      controller: widget.controller,
      focusNode: focusNode,
      readOnly: widget.readOnly,
      style: widget.textStyle ?? AppTextStyles.regular(fontSize: 16),
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      obscureText: widget.obscureText,
      minLines: widget.minLines,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: ColorConst.primaryWhite,
        errorStyle: widget.showError
            ? (widget.textStyle ?? AppTextStyles.regular(fontSize: 16))
                .copyWith(color: Colors.redAccent)
            : const TextStyle(fontSize: 0),
        label: widget.label != null
            ? Text(
                widget.label!,
                style: AppTextStyles.regular(fontSize: 16),
              )
            : null,
        alignLabelWithHint: true,
        hintText: widget.hint,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        suffixIcon: widget.suffixIcon,
        prefixIcon: ((widget.prefixIcon) != null)
            ? Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: SizedBox(
                  height: 30,
                  width: 24,
                  child: Center(
                    child: ImageIcon(
                      AssetImage(widget.prefixIcon!),
                      color: ColorConst.primaryBlack,
                      size: 24,
                    ),
                  ),
                ),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          maxWidth: 48,
          minWidth: 48,
          minHeight: 24,
          maxHeight: 24,
        ),
        contentPadding: widget.padding,
      ),
    );
  }
}
