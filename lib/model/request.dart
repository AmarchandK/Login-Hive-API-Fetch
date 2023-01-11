class RequestModel {
  RequestModel(
      {required this.category,
      required this.language,
      required this.genre,
      required this.sort});
  String category;
  String language;
  String genre;
  String sort;
  Map<String, dynamic> toJson() => {
        "category": category,
        "language": language,
        "genre": genre,
        "sort": sort,
      };
}
