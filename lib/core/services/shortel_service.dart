import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_shorter/core/models/shortest_site_model.dart';

const _chars =
    'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890'; // Üreteceğimiz random key'de kullanılacak charlar
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length,
    (_) => _chars.codeUnitAt(_rnd.nextInt(
        _chars.length)))); // Random key üretmek için minik bir fonksiyon

class ShortelService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> shortURL(String url, String description) async {
    // Verilen Url ve Açıklamaya göre veri tabanına kaydetme.
    String directoryID = getRandomString(
        8); // linkin sonuna ekleyeceğimiz 8 karakterli random key

    _firestore.doc("shortestSites/$directoryID").set({
      "siteURL": url,
      "description": description
    }); // verileri firebase e kaydediyoruz

    return "https://www.site.com/site/" + directoryID;
  }

  Future<ShortestSiteModel> getSiteInformations(
      // Site bilgilerini çeken ve model olarak döndüren bir Future
      final String directoryID) async {
    Map<String, dynamic> data =
        (await _firestore.doc("shortestSites/$directoryID").get()).data()!;

    return ShortestSiteModel.fromMap(data);
  }
}
