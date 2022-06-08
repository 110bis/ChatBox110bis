class FAQFields {
  static const String ask = 'Questions';
  static const String answer = 'Réponses';

  static List<String> getFields() => [ask, answer];
}

class FAQ {
  final String ask;
  final String anwser;

  const FAQ({
    required this.ask,
    required this.anwser,
  });

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(ask: json[FAQFields.ask], anwser: json[FAQFields.answer]);
  }
}
