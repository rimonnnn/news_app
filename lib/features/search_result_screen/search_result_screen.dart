import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constantes/constantes.dart';
import 'package:news_app/core/styles/app_text_style.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/home_screen/widgets/article_card_widget.dart';
import 'package:news_app/features/search_result_screen/cubit/search_cubit.dart';
import 'package:news_app/features/search_result_screen/cubit/search_states.dart';
import 'package:news_app/features/search_result_screen/repo/search_result_repo.dart';

class SearchResultScreen extends StatefulWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchCubit>().getArticles(widget.query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == "en") {
                context.setLocale(Locale("ar"));
              } else {
                context.setLocale(Locale("en"));
              }
              AppConstantes.lang = context.locale.languageCode;
            },
            icon: Icon(Icons.language_outlined, size: 30),
          ),
        ],
        backgroundColor: Colors.white,
        title: Text("Search results", style: AppTextStyle.black16Medium),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          if (state is LoadingArtialesSate) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (state is ErrorArticlesState) {
            return Center(child: Text(state.error.toString()));
          } else if (state is SucsessArticlesState) {
            ArticalsModel articalsModel = state.searchArticles;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 32.sp),
                    itemCount: articalsModel.articles.length,
                    itemBuilder: (context, index) {
                      Article article = articalsModel.articles[index];
                      return ArticleCardWidget(article: article);
                    },
                  ),
                ),
                HeightSpace(24),
              ],
            );
          } else {
            return SizedBox(child: Center(child: Text("Something Went Wrong")));
          }
        },
      ),
    );
  }
}
