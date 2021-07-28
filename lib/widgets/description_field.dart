import 'package:flutter/material.dart';
import 'package:url_shorter/core/extensions/context_extension.dart';

class DescriptionFormField extends StatelessWidget {
  final TextEditingController controller;
  const DescriptionFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.w(0.1)),
      child: TextFormField(
        controller: controller,
        maxLines: 15,
        maxLength: 1000,
        decoration: InputDecoration(
          hintText: "Açıklama",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}
