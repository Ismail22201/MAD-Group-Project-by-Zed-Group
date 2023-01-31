import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_golang_yt/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double? borderRadius;
  final int? maxLines;
  final bool readOnly;
  const TextFieldWidget(
      {Key? key,
      required this.textController,
      required this.hintText,
      this.borderRadius = 30,
      this.maxLines = 1,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(color: Colors.white, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(color: Colors.white, width: 1)),
      ),
    );
  }
}
