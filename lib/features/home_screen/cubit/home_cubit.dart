import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home_screen/cubit/home_states.dart';
import 'package:news_app/features/home_screen/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInatialState());

  final HomeRepo homeRepo = HomeRepo();

  Future<void> getTopHeadLines() async {
    emit(LoidingTopHeadLinesState());
    try {
      final response = await homeRepo.getTopHeadLineArtical();
      emit(SuccessTopHeadLinesState(response));
    } catch (e) {
      emit(ErrorTopHeadLinesState(e.toString()));
    }
  }
}
