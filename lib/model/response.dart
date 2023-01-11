// ignore_for_file: constant_identifier_names

class ResponseModel {
  ResponseModel({
    required this.result,
  });

  List<Result?> result;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        result: json["result"] == null
            ? []
            : List<Result?>.from(
                json["result"]!.map((x) => Result.fromJson(x)),
              ),
      );
}

class Result {
  Result({
    this.id,
    this.director,
    this.stars,
    this.releasedDate,
    this.title,
    this.language,
    this.runTime,
    this.genre,
    this.poster,
    this.pageViews,
    this.totalVoted,
    this.voting,
  });

  String? id;
  List<String?>? director;
  List<String?>? stars;
  int? releasedDate;
  String? title;
  Language? language;
  int? runTime;
  String? genre;
  String? poster;
  int? pageViews;
  int? totalVoted;
  int? voting;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        director: json["director"] == null
            ? []
            : List<String?>.from(json["director"]!.map((x) => x)),
        stars: json["stars"] == null
            ? []
            : List<String?>.from(json["stars"]!.map((x) => x)),
        releasedDate: json["releasedDate"],
        title: json["title"],
        language: languageValues.map[json["language"]],
        runTime: json["runTime"],
        genre: json["genre"],
        poster: json["poster"],
        pageViews: json["pageViews"],
        totalVoted: json["totalVoted"],
        voting: json["voting"],
      );
}

enum Language { KANNADA }

final languageValues = EnumValues({"Kannada": Language.KANNADA});

class EnumValues<T> {
  Map<String, T> map;
  EnumValues(this.map);

 
}
