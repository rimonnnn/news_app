import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

abstract class SearchStates {}

class ArticlesInatialeState extends SearchStates{}

class LoadingArtialesSate extends SearchStates {}

class SucsessArticlesState extends SearchStates {
  final ArticalsModel searchArticles;

  SucsessArticlesState(this.searchArticles);
}

class ErrorArticlesState extends SearchStates {
  final String error;

  ErrorArticlesState(this.error);
}
