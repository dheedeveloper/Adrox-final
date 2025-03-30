class StringValues {
  static String landingTitle = "Discover ADROX\nin your way";
  static String landingCont =
      "Sign in to access your Wallet and manage your preferences with ease. If you're new here, create an Wallet to unlock a seamless experience. With a quick and secure sign-in process, you can stay connected, track your activity, and enjoy a hassle-free experience. Whether you're returning or joining for the first time, getting started is simple and convenient.";
  static String loginTitle = "Login your  Adrox Wallet";
  static String loginCont =
      "Sign in to access your Wallet and manage your details with ease.";
  static String walletCont =
      "Create an Wallet to unlock more features and a seamless experience.";
  static String backupCont =
      "Secure your digital assets with our robust 12-phrase backup system, and optimize  seamless user experience";
  static String verify2fa =
      "Please  enter two factor token from Google Authenticator to verify correct setup!";
  static String lending =
      "The lending pool will be returned to your wallet upon maturity, until then you will receive lending  profits daily";
  static String home =
      "Please download our new app to\nget more Features and Safety";
}


class DynamicStrings {
  static final DynamicStrings _instance = DynamicStrings._internal();

  factory DynamicStrings() {
    return _instance;
  }

  DynamicStrings._internal();

  String mnemonicPhrase = ""; // This will now persist
  String referralId = ""; // This will now persist
  String sponser_id = ""; // This will now persist
  String qrImg = ""; // This will now persist
  String secretCode = ""; // This will now persist
  String token = ""; // This will now persist
}

