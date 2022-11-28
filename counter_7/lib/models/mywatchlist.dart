// To parse this JSON data, do
//
//     final myWatchlist = myWatchlistFromJson(jsonString);

import 'dart:convert';

List<MyWatchlist> myWatchlistFromJson(String str) => List<MyWatchlist>.from(json.decode(str).map((x) => MyWatchlist.fromJson(x)));

String myWatchlistToJson(List<MyWatchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchlist {
    MyWatchlist({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model model;
    int pk;
    Fields fields;

    factory MyWatchlist.fromJson(Map<String, dynamic> json) => MyWatchlist(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.watched,
        required this.title,
        required this.rating,
        required this.releaseDate,
        required this.review,
    });

    Watched watched;
    String title;
    int rating;
    DateTime releaseDate;
    Review review;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        watched: watchedValues.map[json["watched"]]!,
        title: json["title"],
        rating: json["rating"],
        releaseDate: DateTime.parse(json["release_date"]),
        review: reviewValues.map[json["review"]]!,
    );

    Map<String, dynamic> toJson() => {
        "watched": watchedValues.reverse[watched],
        "title": title,
        "rating": rating,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "review": reviewValues.reverse[review],
    };
}

enum Review { BAGUS, SANGAT_BAGUS_DAN_COCOK_DITONTON_UNTUK_SEMUA_USIA, SANGAT_BAGUS }

final reviewValues = EnumValues({
    "bagus": Review.BAGUS,
    "sangat bagus": Review.SANGAT_BAGUS,
    "sangat bagus dan cocok ditonton untuk semua usia": Review.SANGAT_BAGUS_DAN_COCOK_DITONTON_UNTUK_SEMUA_USIA
});

enum Watched { SUDAH }

final watchedValues = EnumValues({
    "Sudah": Watched.SUDAH
});

enum Model { MYWATCHLIST_MODELMYWATCHLIST }

final modelValues = EnumValues({
    "mywatchlist.modelmywatchlist": Model.MYWATCHLIST_MODELMYWATCHLIST
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}