class ShortestSiteModel {
  final String siteURL; // Yönlendireceğimiz site linki
  final String description; // Site açıklaması kullanıcıya göstermek için

  ShortestSiteModel({required this.siteURL, required this.description});

  static ShortestSiteModel fromMap(Map<String, dynamic> data) {
    return ShortestSiteModel(
        siteURL: data['siteURL'], description: data['description']);
  }
}
