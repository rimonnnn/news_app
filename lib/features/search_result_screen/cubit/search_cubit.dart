import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search_result_screen/cubit/search_states.dart';
import 'package:news_app/features/search_result_screen/repo/search_result_repo.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(ArticlesInatialeState());
  final SearchResultRepo searchRepo = SearchResultRepo();

  Future<void> getArticles(String query) async {
    emit(LoadingArtialesSate());
    try {
      final response = await searchRepo.searchItemByName( query);
      emit(SucsessArticlesState(response));
    } catch (e) {
      emit(ErrorArticlesState(e.toString()));
    }
  }
}
