import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

abstract class HomeStates {}

class HomeInatialState extends HomeStates {}

class LoidingTopHeadLinesState extends HomeStates {}

class SuccessTopHeadLinesState extends HomeStates {
  final ArticalsModel topHeadLines;

  SuccessTopHeadLinesState(this.topHeadLines);
}

class ErrorTopHeadLinesState extends HomeStates {
  final String error;

  ErrorTopHeadLinesState(this.error);
}
