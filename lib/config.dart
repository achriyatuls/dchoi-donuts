class AppConfig {
  //# CONFIG
  static String yourName = "AchriyatulS";
  static String phoneNumber = "081271044444";
  //# ---------------------------------------
  //# ---------------------------------------

  static String get baseUrl {
    var storage = yourName.replaceAll(" ", "-").toLowerCase();
    storage = "$storage-$phoneNumber";
    return "http://capekngoding.com:8080/$storage/api";
  }
}
