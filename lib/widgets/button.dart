import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_shorter/core/extensions/context_extension.dart';

class SubmitButton extends StatelessWidget {
  final Function onPressed;
  const SubmitButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1000) {
          return CupertinoButton(
            child: Container(
              width: context.w(0.15),
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.purple,
              ),
              child: Center(
                child: Text(
                  "Siteyi Kısalt",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onPressed: () {
              onPressed();
            },
            borderRadius: BorderRadius.circular(25),
          );
        } else {
          return CupertinoButton(
            child: Container(
              width: context.w(0.8),
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.purple,
              ),
              child: Center(
                child: Text(
                  "Siteyi Kısalt",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onPressed: () {
              onPressed();
            },
            borderRadius: BorderRadius.circular(25),
          );
        }
      },
    );
  }
}
