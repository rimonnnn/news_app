import 'dart:developer';

import 'package:news_app/core/constantes/constantes.dart';
import 'package:news_app/core/networking/api_end_points.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

class SearchResultRepo {
  searchItemByName(String query) async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndPoints.searchUrl,
        query: {
          "apiKey": AppConstantes.newsApiKey,
          "q": query,
          "language": AppConstantes.lang.isEmpty ? "en" : AppConstantes.lang,
        },
      );
      if (response.statusCode == 200) {
        ArticalsModel articalsModel = ArticalsModel.fromJson(response.data);
        log(articalsModel.totalResults.toString());
        return articalsModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}
