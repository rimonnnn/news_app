import 'dart:developer';

import 'package:news_app/core/constantes/constantes.dart';
import 'package:news_app/core/networking/api_end_points.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

class HomeRepo {
  Future<ArticalsModel> getTopHeadLineArtical() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndPoints.topHeadLineUrl,
        query: {"apiKey": AppConstantes.newsApiKey, "country": "us"},
      );

      if (response.statusCode == 200) {
        final articalsModel = ArticalsModel.fromJson(response.data);

        log("TOTAL RESULTS: ${articalsModel.totalResults}");

        for (final article in articalsModel.articles.take(10)) {
          log("TITLE: ${article.title}");
          log("IMAGE URL: ${article.urlToImage}");
        }

        return articalsModel;
      } else {
        throw Exception(
          "Request failed with status code: ${response.statusCode}",
        );
      }
    } catch (e) {
      log("SERVICE ERROR: $e");
      throw Exception(e.toString());
    }
  }
}
