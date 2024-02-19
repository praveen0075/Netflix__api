import 'dart:convert';

import 'package:netflix/api/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:http/http.dart' as http;

class Api{
  static const _trendingUri = "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apikey}";

  Future <List<Movies>> getTrendingMovies()async{
  
    final response = await http.get(Uri.parse(_trendingUri));
    // print(response.statusCode);
    if(response.statusCode == 200){
      final decodedData =  jsonDecode(response.body)['results'] as List;
      // print(decodedData);
      return decodedData.map((movie) => Movies.fromJson(movie)).toList();
    }else{
      throw Exception("something went wrong");
    }
  }

 static const _topRatedUri = "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apikey}";

 Future <List<Movies>> getTopRatedMovies()async{

  final response = await  http.get(Uri.parse(_topRatedUri));
  if(response.statusCode == 200){
    final decoDedData = jsonDecode(response.body)['results'] as List;
    return decoDedData.map((movie) => Movies.fromJson(movie)).toList();
  }else{
    throw Exception("Something went wrong");
  }
 }

 static const _top10RatedUri = "https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apikey}";

 Future <List<Movies>> get10TopRatedMovies()async{

  final response = await  http.get(Uri.parse(_top10RatedUri));
  if(response.statusCode == 200){
    final decoDedData = jsonDecode(response.body)['results'] as List;
    return decoDedData.map((movie) => Movies.fromJson(movie)).toList();
  }else{
    throw Exception("Something went wrong");
  }
 }

 static const _upcomingMovies = "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apikey}";

 Future <List<Movies>> getupComingMovies()async{

  final response = await  http.get(Uri.parse(_upcomingMovies));
  if(response.statusCode == 200){
    final decoDedData = jsonDecode(response.body)['results'] as List;
    return decoDedData.map((movie) => Movies.fromJson(movie)).toList();
  }else{
    throw Exception("Something went wrong");
  }
 }

  static const _nowPlaying = "https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apikey}";

 Future <List<Movies>> getNowPlaying()async{
  final response = await  http.get(Uri.parse(_nowPlaying));
  if(response.statusCode == 200){
    final decoDedData = jsonDecode(response.body)['results'] as List;
    return decoDedData.map((movie) => Movies.fromJson(movie)).toList();
  }else{
    throw Exception("Something went wrong");
  }
 }

   static const _forSearch =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apikey}";
  Future<List<Movies>> topSearchses() async {
    final response = await http.get(Uri.parse(_forSearch));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

   Future<List<Movies>> searchResult(String movie) async {
    String resultApi =
        "https://api.themoviedb.org/3/movie/343611?api_key=${Constants.apikey}";
    final response = await http.get(Uri.parse(resultApi));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception('something went wrong');
    }
  }

    Future<List<String?>> getDownloadImageUrls() async {
    final response = await http.get(Uri.parse(_trendingUri));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["results"] as List;
      return responseData.map((movie) => Movies.fromJson(movie).posterPath).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }
} 


