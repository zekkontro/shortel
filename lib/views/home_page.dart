import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_shorter/core/services/shortel_service.dart';
import 'package:url_shorter/widgets/button.dart';
import 'package:url_shorter/widgets/description_field.dart';
import 'package:url_shorter/widgets/link_field.dart';
import 'package:url_shorter/widgets/logo.dart';
import 'package:url_shorter/core/extensions/context_extension.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController linkCont = TextEditingController();
  TextEditingController descCont = TextEditingController();

  Future<void> _showMyDialog(String url) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Linkiniz Kısaltıldı'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SelectableText(url),
                Text("Yukarıdaki URL'yi paylaşabilirsiniz"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('KAPAT'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.h(0.08),
              ),
              Logo(),
              SizedBox(
                height: context.h(0.04),
              ),
              LinkFormField(controller: linkCont),
              SizedBox(
                height: context.h(0.02),
              ),
              DescriptionFormField(controller: descCont),
              SizedBox(
                height: context.h(0.02),
              ),
              SubmitButton(onPressed: () async {
                bool launchable = await canLaunch(linkCont.text);
                if (launchable == true &&
                    linkCont.text.isNotEmpty &&
                    descCont.text.isNotEmpty) {
                  ShortelService service = ShortelService();
                  String url =
                      await service.shortURL(linkCont.text, descCont.text);
                  _showMyDialog(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Hatalı Giriş yaptınız. Lütfen bilgileri kontrol edip bir daha deneyin.")));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
