import 'package:json_annotation/json_annotation.dart';

import '../../../../models/movies/trending_movie_model.dart';

@JsonSerializable()
class TrendingMovieResponse {
  int? page;
  List<TrendingMovieModel>? results;
  int? totalPages;
  int? totalResults;

  TrendingMovieResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  TrendingMovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <TrendingMovieModel>[];
      json['results'].forEach((v) {
        results!.add(new TrendingMovieModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}