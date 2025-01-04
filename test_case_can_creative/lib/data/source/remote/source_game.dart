import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:test_case_can_creative/data/config/api.dart';
import 'package:test_case_can_creative/data/model/model_games.dart';
import 'package:http/http.dart' as http;

abstract class SourceGame {
  Future<Either<String, List<GamesModel>>> getGames(int page, int pageSize);
  Future<Either<String, List<GamesModel>>> searchGames(String name);
  Future<Either<String, GamesModel>> getDetailGames(int id);
}

class SourceGameImpl implements SourceGame {
  final http.Client client;

  SourceGameImpl({required this.client});

  @override
  Future<Either<String, GamesModel>> getDetailGames(int id) async {
    final url = Uri.parse("${Api.baseUrl}games/$id?key=${Api.apiKey}");
    final response = await client.get(url);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return right(GamesModel.fromJson(responseBody));
    } else {
      return left(responseBody['error']);
    }
  }

  @override
  Future<Either<String, List<GamesModel>>> getGames(
      int page, int pageSize) async {
    final url = Uri.parse(
        "${Api.baseUrl}games?page=$page&page_size=$pageSize&key=${Api.apiKey}");
    final response = await client.get(url);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List listGames = responseBody['results'];
      return right(listGames.map((e) => GamesModel.fromJson(e)).toList());
    } else {
      return left(responseBody['error']);
    }
  }

  @override
  Future<Either<String, List<GamesModel>>> searchGames(String name) async {
    final url = Uri.parse("${Api.baseUrl}games?search=$name&key=${Api.apiKey}");
    final response = await client.get(url);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List listGames = responseBody['results'];
      return right(listGames.map((e) => GamesModel.fromJson(e)).toList());
    } else {
      return left(responseBody['error']);
    }
  }
}
