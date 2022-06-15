import 'package:flutter_dotenv/flutter_dotenv.dart';

class Credential {
  static Map<String, dynamic> credential = {};

  static Future init() async {
    try {
      final String _type = dotenv.get('TYPE');
      final String _projectId = dotenv.get('PROJECT_ID');
      final String _privateKeyId = dotenv.get('PRIVATE_KEY_ID');
      final String _privateKey = dotenv.get('PRIVATE_KEY');
      final String _clientEmail = dotenv.get('CLIENT_EMAIL');
      final String _clientId = dotenv.get('CLIENT_ID');
      final String _authUri = dotenv.get('AUTH_URI');
      final String _tokenUri = dotenv.get('TOKEN_URI');
      final String _authProvider = dotenv.get('AUTH_PROVIDER_X509_CERT_URL');
      final String _clientUrl = dotenv.get('CLIENT_X509_CERT_URL');

      if (_type.isEmpty ||
          _projectId.isEmpty ||
          _privateKeyId.isEmpty ||
          _privateKey.isEmpty ||
          _clientEmail.isEmpty ||
          _clientId.isEmpty ||
          _authUri.isEmpty ||
          _tokenUri.isEmpty ||
          _authProvider.isEmpty ||
          _clientUrl.isEmpty) {
        throw Exception('Missing credentials');
      }

      credential = {
        '"type"': '"' + _type + '"',
        '"project_id"': '"' + _projectId + '"',
        '"private_key_id"': '"' + _privateKeyId + '"',
        '"private_key"': '"' + _privateKey + '"',
        '"client_email"': '"' + _clientEmail + '"',
        '"client_id"': '"' + _clientId + '"',
        '"auth_uri"': '"' + _authUri + '"',
        '"token_uri"': '"' + _tokenUri + '"',
        '"auth_provider_x509_cert_url"': '"' + _authProvider + '"',
        '"client_x509_cert_url"': '"' + _clientUrl + '"',
      };

      // ignore: avoid_print
      print("Google Sheet credential Successfuly Load");
    } catch (e) {
      // ignore: avoid_print
      print('Init Error: $e');
    }
  }

  static Map<String, dynamic> toJSON() {
    return credential;
  }
}
