import 'package:flutter/material.dart';
import 'package:url_shorter/widgets/logo.dart';
import 'package:url_shorter/core/extensions/context_extension.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.w(1),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Logo(),
              SizedBox(
                height: context.h(0.2),
              ),
              Text(
                "Böyle bir sayfa bulunamadı. Hata Kodu 404",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
