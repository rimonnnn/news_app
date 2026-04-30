import 'dart:developer';

import 'package:news_app/core/constantes/constantes.dart';
import 'package:news_app/core/networking/api_end_points.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

class HomeScreenServices {
  getTopHeadLineArtical() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndPoints.topHeadLineUrl,
        query: {"apiKey": AppConstantes.newsApiKey, "country": "us"},
      );
      if (response.statusCode == 200) {
        TopHeadLinesModel topHeadLinesModel = TopHeadLinesModel.fromJson(
          response.data,
        );
        log(topHeadLinesModel.totalResults.toString());
        return topHeadLinesModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}
