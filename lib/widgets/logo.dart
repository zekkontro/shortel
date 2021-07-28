import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_shorter/core/extensions/context_extension.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1000) {
            return Container(
                child: SvgPicture.asset(
              "assets/logo.svg",
              color: Color(0xff3660AA),
              width: context.w(0.5),
            ));
          } else if (1000 > constraints.maxWidth &&
              constraints.maxWidth >= 600) {
            return Container(
              width: context.w(0.7),
              child: SvgPicture.asset("assets/logo.svg"),
              color: Color(0xff3660AA),
            );
          } else {
            return Container(
                width: context.w(0.2),
                height: context.h(0.2),
                child: SvgPicture.asset(
                  "assets/logo_mobile.svg",
                  color: Color(0xff3660AA),
                ));
          }
        },
      ),
    );
  }
}
