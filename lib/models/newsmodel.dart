class newsmodel {
  final String? image;
  final String decs;
  final String text;
  final String date;

  newsmodel(
      {required this.image,
      required this.decs,
      required this.text,
      required this.date}); 

  factory newsmodel.fromjson(json) {
    return newsmodel(
        image: json['image'],
        decs: json ['description'],
        text: json['content'],
        date: json['publishedAt']);
  }
}
