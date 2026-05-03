import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/styles/app_text_style.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/home_screen/services/home_screen_services.dart';
import 'package:news_app/features/home_screen/widgets/article_card_widget.dart';
import 'package:news_app/features/home_screen/widgets/custom_category_item_widget.dart';
import 'package:news_app/features/home_screen/widgets/search_text_field_widget.dart';
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
        actions: [SearchTextFieldWidget()],
      ),
      body: FutureBuilder<ArticalsModel>(
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

          ArticalsModel articalsModel = snapshot.data!;

          if (articalsModel.totalResults == 0 ||
              articalsModel.articles.isEmpty) {
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
                        CustomCategoryItemWidget(
                          text: "travel".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: "travel".tr(),
                            );
                          },
                        ),
                        CustomCategoryItemWidget(
                          text: "technology".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: "technology".tr(),
                            );
                          },
                        ),
                        CustomCategoryItemWidget(
                          text: "business".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: "business".tr(),
                            );
                          },
                        ),
                        CustomCategoryItemWidget(
                          text: "entertainment".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: "travel".tr(),
                            );
                          },
                        ),
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
                        title: articalsModel.articles[0].title ?? "",
                        autherName: articalsModel.articles[0].author ?? "",
                        date: DateFormat(
                          'yyyy-MM-dd - kk-mm',
                        ).format(articalsModel.articles[0].publishedAt),
                        imageUrl: articalsModel.articles[0].urlToImage,
                      ),
                    ],
                  ),
                ),
                HeightSpace(29),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 32.sp),
                    itemCount: articalsModel.articles.length,
                    itemBuilder: (context, index) {
                      Article article = articalsModel.articles[index];
                      return ArticleCardWidget(
                        article: article,
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
