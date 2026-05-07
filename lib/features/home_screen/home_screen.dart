import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/styles/app_text_style.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';
import 'package:news_app/features/home_screen/cubit/home_cubit.dart';
import 'package:news_app/features/home_screen/cubit/home_states.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/home_screen/repo/home_repo.dart';
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
    context.read<HomeCubit>().getTopHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xffE9EEFA),
        toolbarHeight: 120.h,
        title: Padding(
          padding: EdgeInsetsDirectional.only(start: 32.sp),
          child: Text("explore".tr(), style: AppTextStyle.titleStyle),
        ),
        actions: [SearchTextFieldWidget()],
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state is LoidingTopHeadLinesState) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (state is ErrorTopHeadLinesState) {
            return Center(child: Text(state.error.toString()));
          } else if (state is SuccessTopHeadLinesState) {
            ArticalsModel topHeadLinesModel = state.topHeadLines;
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
                              extra: "entertainment".tr(),
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
                        title: topHeadLinesModel.articles[0].title ?? "",
                        autherName: topHeadLinesModel.articles[0].author ?? "",
                        date: DateFormat(
                          'yyyy-MM-dd - kk-mm',
                        ).format(topHeadLinesModel.articles[0].publishedAt),
                        imageUrl: topHeadLinesModel.articles[0].urlToImage,
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
                      return ArticleCardWidget(article: article);
                    },
                  ),
                ),
                HeightSpace(24),
              ],
            );
          } else {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: Text("Something Went Wrong")),
            );
          }
        },
      ),
    );
  }
}
