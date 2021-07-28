import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_shorter/core/models/shortest_site_model.dart';
import 'package:url_shorter/core/services/shortel_service.dart';
import 'package:url_shorter/core/extensions/context_extension.dart';
import 'package:url_shorter/widgets/logo.dart';

class RedirectionPage extends StatefulWidget {
  final String directoryId;
  const RedirectionPage({Key? key, required this.directoryId})
      : super(key: key);

  @override
  _RedirectionPageState createState() => _RedirectionPageState();
}

class _RedirectionPageState extends State<RedirectionPage> {
  late ShortestSiteModel site;
  redirect() async {
    ShortelService service = ShortelService();
    ShortestSiteModel data =
        await service.getSiteInformations(widget.directoryId);
    setState(() {
      site = data;
    });

    Future.delayed(Duration(seconds: 5)).then((value) => launch(data.siteURL));
  }

  @override
  void initState() {
    redirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.w(1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(),
            SizedBox(
              height: 30,
            ),
            Text(site.description,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            SizedBox(
              height: 30,
            ),
            Text(
              "5 Saniye içinde siteye yönlendirileceksiniz.",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
