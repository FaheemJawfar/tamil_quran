class Thafseer {
  final String index;
  final String header;
  final String content;

  Thafseer({
    required this.index,
    required this.header,
    required this.content
  });


  factory Thafseer.fromJson(Map<String, dynamic> json) {
    return Thafseer(
      index: json['index'] as String,
      header: json['header'] as String,
      content: json['content'] as String,
    );
  }

  static Thafseer getSelectedExplanation(int number, List thafseerList) {
    return Thafseer.fromJson(thafseerList[number - 1]);
  }

  static List<Thafseer> getAllThafseer(List thafseerList) {
    return thafseerList.map((json) => Thafseer.fromJson(json)).toList();
  }
}