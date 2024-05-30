import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as flutter_services show TextDirection;

class TextWidget extends StatelessWidget {
  final String? text;

  final TextStyle? style;
  final TextAlign? textAlign;
  final flutter_services.TextDirection? textDirection;
  final int? maxLines;
  final TextOverflow? overflow;

  const TextWidget(this.text,
      {super.key,
      this.style,
      this.textAlign,
      this.textDirection,
      this.maxLines,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
