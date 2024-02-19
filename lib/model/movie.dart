

// // import 'package:json_annotation/json_annotation.dart';

// class Movie{
//   bool? adult;

//   // @JsonKey(name: 'ackdrop_path')
//   String? backdropPath;

//   int? id ;
//   // @JsonKey(name: 'title')
//   String? title;

//   // @JsonKey(name: 'original_language')
//   String? originalLanguage;

//   // @JsonKey(name: 'original_title')
//   String? originalTitle;

//   // @JsonKey(name: 'overview')
//   String? overview;

//   // @JsonKey(name: 'poster_path')
//   String? posterPath;

//   String? mediaType;

//   // @JsonKey(name: 'genre_ids')
//   List<int>? genreIds;

  
//   double? popularity;

//   // @JsonKey(name: 'release_date')
//   String?  releaseDate;
//   bool? video;

//   // @JsonKey(name: 'vote_average')
//   double? voteAvarage;

//   //  @JsonKey(name: 'vote_count')
//   int? voteCound;


//   Movie({
//     this.adult,
//     this.backdropPath,
//     this.genreIds,
//     this.id,
//     this.mediaType,
//     this.originalLanguage,
//     this.originalTitle,
//     this.overview,
//     this.popularity,
//     this.posterPath,
//     this.releaseDate,
//     this.title,
//     this.video,
//     this.voteAvarage,
//     this.voteCound
//   });

//   factory Movie.fromJson(Map<String,dynamic>json){
//     return Movie(
//       title: json["title"] as  String,
//       backdropPath: json["backdrop_path"],
//       originalTitle: json["original_title"],
//       overview: json["overview"],
//       posterPath: json["poster_path"],
//       releaseDate: json["release_date"],
//       voteAvarage: json["vote_average"]
//     );
//   }
// }

// "adult": false,
// "backdrop_path": "/oBIQDKcqNxKckjugtmzpIIOgoc4.jpg",
// "id": 969492,
// "title": "Land of Bad",
// "original_language": "en",
// "original_title": "Land of Bad",
// "overview": "When a Delta Force special ops mission goes terribly wrong, Air Force drone pilot Reaper has 48 hours to remedy what has devolved into a wild rescue operation. With no weapons and no communication other than the drone above, the ground mission suddenly becomes a full-scale battle when the team is discovered by the enemy.",
// "poster_path": "/h3jYanWMEJq6JJsCopy1h7cT2Hs.jpg",
// "media_type": "movie",
// "genre_ids": [
// 28,
// 53,
// 10752
// ],
// "popularity": 172.221,
// "release_date": "2024-01-25",
// "video": false,
// "vote_average": 6.2,
// "vote_count": 21


// import 'dart:convert';

// Movies temperaturesFromJson(String str) => Movies.fromJson(json.decode(str));

// String temperaturesToJson(Movies data) => json.encode(data.toJson());

class Movies {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  DateTime releaseDate;
  double voteAverage;

  Movies({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
        title: json['title'],
        backDropPath: json['backdrop_path'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate:DateTime.tryParse(json['release_date'])! ,
        voteAverage: json['vote_average']);
}

    // Map<String, dynamic> toJson() => {
    //     "adult": adult,
    //     "backdrop_path": backdropPath,
    //     "id": id,
    //     "title": title,
    //     "original_language": originalLanguage,
    //     "original_title": originalTitle,
    //     "overview": overview,
    //     "poster_path": posterPath,
    //     "media_type": mediaType,
    //     "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    //     "popularity": popularity,
    //     "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    //     "video": video,
    //     "vote_average": voteAverage,
    //     "vote_count": voteCount,
    // };
}