// To parse this JSON data, do
//
//     final movielist = movielistFromJson(jsonString);

import 'dart:convert';

Movielist movielistFromJson(String str) => Movielist.fromJson(json.decode(str));

String movielistToJson(Movielist data) => json.encode(data.toJson());

class Movielist {
  Movielist({
    this.search,
    this.totalResults,
    this.response,
  });

  List<Search>? search;
  String? totalResults;
  String? response;


  factory Movielist.fromJson(Map<String, dynamic> json) => Movielist(
    search: List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
    totalResults: json["totalResults"],
    response: json["Response"],
  );

  Map<String, dynamic> toJson() => {
    "Search": List<dynamic>.from(search!.map((x) => x.toJson())),
    "totalResults": totalResults,
    "Response": response,
  };
}

class Search {
  Search({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  String? title;
  String? year;
  String? imdbId;
  String? type;
  String? poster;

  Search copyWith({
    String? title,
    String? year,
    String? imdbId,
    String? type,
    String? poster,
  }) =>
      Search(
        title: title ?? this.title,
        year: year ?? this.year,
        imdbId: imdbId ?? this.imdbId,
        type: type ?? this.type,
        poster: poster ?? this.poster,
      );

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    title: json["Title"],
    year: json["Year"],
    imdbId: json["imdbID"],
    type: json["Type"],
    poster: json["Poster"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "imdbID": imdbId,
    "Type": type,
    "Poster": poster,
  };
}
