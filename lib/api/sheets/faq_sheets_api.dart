import 'package:chatboxlab/models/faq.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gsheets/gsheets.dart';
import 'package:chatboxlab/api/sheets/gsheets_credentials.dart';

class FAQSheetsApi {
  static final _credentials = Credential.toJSON();
  static final _spreadsheetId = dotenv.get('SPREADSHEET_ID');
  static Worksheet? _faqSheet;

  static Future init() async {
    try {
      final _gsheets = GSheets(_credentials.toString());
      final _spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _faqSheet = _spreadsheet.worksheetByTitle(dotenv.get('TITLE_FAQ'));

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
