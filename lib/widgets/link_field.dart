import 'package:flutter/material.dart';
import 'package:url_shorter/core/extensions/context_extension.dart';

class LinkFormField extends StatelessWidget {
  final TextEditingController controller;
  const LinkFormField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.w(0.1)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Site Linki",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}
