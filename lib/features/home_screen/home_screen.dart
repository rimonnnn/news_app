import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/core/styles/app_text_style.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/home_screen/services/home_screen_services.dart';
import 'package:news_app/features/home_screen/widgets/article_card_widget.dart';
import 'package:news_app/features/home_screen/widgets/custom_category_item_widget.dart';
import 'package:news_app/features/home_screen/widgets/top_headline_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE9EEFA),
        toolbarHeight: 120.h,
        title: Padding(
          padding: EdgeInsetsDirectional.only(start: 32.sp),
          child: Text("explore".tr(), style: AppTextStyle.titleStyle),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ),
        ],
      ),
      body: FutureBuilder(
        future: HomeScreenServices().getTopHeadLineArtical(),
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

          TopHeadLinesModel topHeadLinesModel =
              snapshot.data! as TopHeadLinesModel;

          if (topHeadLinesModel.totalResults == 0 ||
              topHeadLinesModel.articles.isEmpty) {
            return Center(child: Text("no_results".tr()));
          }
          if (snapshot.hasData) {
            return Column(
              children: [
                HeightSpace(16),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 32.sp),
                  child: SizedBox(
                    height: 60.h,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        CustomCategoryItemWidget(text: "travel".tr()),
                        CustomCategoryItemWidget(text: "technology".tr()),
                        CustomCategoryItemWidget(text: "business".tr()),
                        CustomCategoryItemWidget(text: "entertainment".tr()),
                      ],
                    ),
                  ),
                ),
                HeightSpace(24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      TopHeadlineWidget(
                        title: topHeadLinesModel.articles[0].title ?? "",
                        autherName: topHeadLinesModel.articles[0].author ?? "",
                        date: DateFormat(
                          'yyyy-MM-dd - kk-mm',
                        ).format(topHeadLinesModel.articles[0].publishedAt),
                        imageUrl:
                            topHeadLinesModel.articles[0].urlToImage ?? "",
                      ),
                    ],
                  ),
                ),
                HeightSpace(29),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 32.sp),
                    itemCount: topHeadLinesModel.articles.length,
                    itemBuilder: (context, index) {
                      Article article = topHeadLinesModel.articles[index];
                      return ArticleCardWidget(
                        title: article.title ,
                        autherName: article.author ?? "",
                        date: DateFormat(
                          'yyyy-MM-dd - kk:mm',
                        ).format(article.publishedAt),
                        imageUrl: topHeadLinesModel.articles[index].urlToImage,
                      );
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
