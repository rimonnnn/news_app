import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_style.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';
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
      body: Column(
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
                  title: 'The new Egyptian Museum',
                  autherName: 'Rimon',
                  date: 'Apr 2, 2026',
                  // imageUrl:
                  //     "https://cdn.twocontinents.com/cdn-cgi/image/width=1920/https://cdn.twocontinents.com/we_know_the_opening_date_of_the_grand_egyptian_museum_b42cb729c6.jpg",
                ),
              ],
            ),
          ),
          HeightSpace(29),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32.sp),
              children: [
                ArticleCardWidget(
                  title: 'The new Egyptian museum',
                  autherName: 'Rimon',
                  date: 'April 2, 2026',
                  imageUrl:
                      "https://cdn.twocontinents.com/cdn-cgi/image/width=1920/https://cdn.twocontinents.com/we_know_the_opening_date_of_the_grand_egyptian_museum_b42cb729c6.jpg",
                ),
                ArticleCardWidget(
                  title: 'The new Egyptian museum',
                  autherName: 'Rimon',
                  date: 'April 2, 2026',
                  imageUrl:
                      "https://cdn.twocontinents.com/cdn-cgi/image/width=1920/https://cdn.twocontinents.com/we_know_the_opening_date_of_the_grand_egyptian_museum_b42cb729c6.jpg",
                ),
                ArticleCardWidget(
                  title: 'The new Egyptian museum',
                  autherName: 'Rimon',
                  date: 'April 2, 2026',
                  imageUrl:
                      "https://cdn.twocontinents.com/cdn-cgi/image/width=1920/https://cdn.twocontinents.com/we_know_the_opening_date_of_the_grand_egyptian_museum_b42cb729c6.jpg",
                ),
                ArticleCardWidget(
                  title: 'The new Egyptian museum',
                  autherName: 'Rimon',
                  date: 'April 2, 2026',
                  imageUrl:
                      "https://cdn.twocontinents.com/cdn-cgi/image/width=1920/https://cdn.twocontinents.com/we_know_the_opening_date_of_the_grand_egyptian_museum_b42cb729c6.jpg",
                ),
                ArticleCardWidget(
                  title: 'The new Egyptian museum',
                  autherName: 'Rimon',
                  date: 'April 2, 2026',
                  imageUrl:
                      "https://cdn.twocontinents.com/cdn-cgi/image/width=1920/https://cdn.twocontinents.com/we_know_the_opening_date_of_the_grand_egyptian_museum_b42cb729c6.jpg",
                ),
                ArticleCardWidget(
                  title: 'The new Egyptian museum',
                  autherName: 'Rimon',
                  date: 'April 2, 2026',
                  imageUrl:
                      "https://cdn.twocontinents.com/cdn-cgi/image/width=1920/https://cdn.twocontinents.com/we_know_the_opening_date_of_the_grand_egyptian_museum_b42cb729c6.jpg",
                ),
              ],
            ),
          ),
          HeightSpace(24),
        ],
      ),
    );
  }
}
