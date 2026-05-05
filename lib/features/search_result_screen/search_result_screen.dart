import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constantes/constantes.dart';
import 'package:news_app/core/styles/app_text_style.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/home_screen/widgets/article_card_widget.dart';
import 'package:news_app/features/search_result_screen/services/search_result_services.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

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
      body: FutureBuilder(
        future: SearchResultServices().searchItemByName(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData) {
            return Center(child: Text("no_results".tr()));
          }

          ArticalsModel articalsModel = snapshot.data! as ArticalsModel;

          if (articalsModel.totalResults == 0 ||
              articalsModel.articles.isEmpty) {
            return Center(child: Text("no_results".tr()));
          }
          if (snapshot.hasData) {
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
          }
          return Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
