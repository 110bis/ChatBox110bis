import 'package:chatboxlab/models/faq.dart';
import 'package:gsheets/gsheets.dart';

class FAQSheetsApi {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "faq-project-352013",
  "private_key_id": "82b8c7e206124987587296075a008f3e25a75689",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCbQz/l1P7kg9Kq\n3HpUxkK2NEBf3zpnf8q11CicRSIkXuHdT40HmoTL5n7IyJZvIyPHnIgOXxH4rlV0\nI94LbvC4Thrip5l4pYA1GJo3Ics+YC5gY04SLdziFL411k+IBgBlGDpIT6G1hTwF\nQuJ2geqdQiolliB2QpzG0okn3H8fitbOk5ohe5r5Mihi7eS6afFnWZUctmoNzv5N\n43qqGbqjOE6Olq+9sZ0hPsNDXPJTU/O342MBDMw7pYaMFoq6lwDMuR7O/5p6caLi\nj/4J0ljdrvMAgsei6ULzK9qJ48dK/KSO0LsqTeARt0OcR9xia38s4TTAb5I+Mlm4\njPgPK0CPAgMBAAECggEACfKiGnCuMCf+DHJ56AqX5aKtaTcdP9phO4svWuvXByuJ\nHyvkplMRJRtMjkLD2LUQqs5trTYMKbnJwdo2dNcT10sxz8nbPG6mK0C7SMMCiamR\n7x0NuH51w4p+sWZczCNOTSvjOBTaEI5LzS5+4gbq6E5/8s6On+UetGJy5TnsbzHV\nirtyyIp1Htuh5A9vv7D7lns5P+q6Km/YRw4mztlGj5t+xMC9oKpSoaHJ1WzUBDOr\nU8VY0ZGSNzfyOk/2GvosN5NeXntMIDjD9Nf98ZH9pLd5dsk8Qoxi2gdVvss1CRWX\nRXeUS2myUU/nH7+EmvUw1aX1dBiDpjC7eCmNeSW0oQKBgQDKEvCNpFaHg39Y62Ee\nXX+biY/wQQAUM9SuzhsgPJ+El8NY2vTZXG/VJp/47ZqUcyqRPZ5nwQ4t/WKXbeQY\nJ+1GeHItIkaEoYlvt/Dpw0/Kpj5/VmKroQy61mD6BMJpojWS/3QDWZwO9KQ8pnqy\ndcXmcZPrDrQQkPWVNANXCIbIXwKBgQDEsk8/s6Jx0TmQBOmEY5O+0rQEYoLvasYE\nsuhegy0vWHRjXbLijGyvC9krE5HfAG6r+hNwvQOR0ZvL7J6TzbkUZIUC/5jrMyUI\nskahEx5vUv02nu0ELrGWK6gzXb+ldeSdqIz1FmFbYs6Ygmm0iLwLisjsKu/FTpfv\nFDw5KBo10QKBgDijYFtDAaHQAKSqrLj3Geo9f2OmxF/lOyqXyFCbzVY7t1wzWseF\nui6zOclqx5XuRbMZ40lPeir3x2eMPI9suXu0DMSLw9ou8LeohdTvknDJceD9FIDo\njgncRqgtJ1S2S2/dO+Yoeq5ScaoyO1fD3Ok/Umdi4qN2De94+aquUCDfAoGAc2Zx\n3FvV6JTqArb/Ei8h1YjlGNV7IGAygTs93YV0kxyAXHPyqbvdX+3BoeY/ZOhqBfgY\nQ8KBP6IMl93hQ7Ik7fPznci7vPIqvilqCsKezo2QBeXEBPooMoS2kDxmXfsHAACN\ngpV41RbpQszwm3zFZrgsHXMrbUUpGplyo84FYqECgYA55Dw8Ox32LJ1nBIenouAr\nA09grOLthPp+rhpquTuzc5XT489nw5G3x75wwMBnH+yF4hQLESBXuzGRB5AJU0P5\nvlDmq61DF4zwnNxY9PnXPr7JHzHYnyYSnnYrVJTwa7PPimDw67ZSTQgYN6kXYkEq\nLYqdV2JF5C7b790lm7MJZA==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@faq-project-352013.iam.gserviceaccount.com",
  "client_id": "101949556654496953826",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40faq-project-352013.iam.gserviceaccount.com"
}
  ''';
  static const _spreadsheetId = '1m7P11RqQU-yrJaS_0q1A6yoqACW_HzrVq02tnEIf3Zk';
  static Worksheet? _faqSheet;

  static Future init() async {
    try {
      final _gsheets = GSheets(_credentials);
      final _spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _faqSheet = _spreadsheet.worksheetByTitle('faq');

      final firstRow = FAQFields.getFields();
      _faqSheet!.values.insertRow(1, firstRow);
      // ignore: avoid_print
      print("Google Sheet Successfuly Load");
    } catch (e) {
      // ignore: avoid_print
      print('Init Error: $e');
    }
  }

  static Future<List<FAQ>> getAll() async {
    if (_faqSheet == null) return <FAQ>[];

    final faq = await _faqSheet!.values.map.allRows();
    return faq!.map(FAQ.fromJson).toList();
  }
}
