import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double h(double rate) => MediaQuery.of(this).size.height * rate;
  double w(double rate) => MediaQuery.of(this).size.width * rate;
}
