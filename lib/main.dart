import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_shorter/views/404.dart';
import 'package:url_shorter/views/home_page.dart';
import 'package:url_shorter/views/redirection_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return MaterialPageRoute(
            builder: (context) {
              return Homepage();
            },
          );
        }
        String str = settings.name!;
        var uri = Uri.parse(str);
        if (uri.pathSegments.length == 2 && uri.pathSegments.first == "site") {
          String directionID = uri.pathSegments[1];
          return MaterialPageRoute(
            builder: (context) => RedirectionPage(directoryId: directionID),
          );
        }

        return MaterialPageRoute(
          builder: (context) => NotFound(),
        );
      },
      title: 'Shortel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
