class Urls{

  static const String _baseUrl = "https://craftybay.teamrabbil.com/api";
  static String sendEmailOtp (email) => "$_baseUrl/UserLogin/$email";
}