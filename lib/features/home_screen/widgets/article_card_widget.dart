import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/styles/app_text_style.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

class ArticleCardWidget extends StatelessWidget {
  final Article article;
  const ArticleCardWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRoutes.articalDetailsScreen, extra: article);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeightSpace(16),
              SizedBox(
                width: 238.w,
                child: Text(
                  maxLines: 2,
                  article.title ?? "",
                  style: AppTextStyle.black18SemiBold,
                ),
              ),

              HeightSpace(12),
              SizedBox(
                width: 238.sp,
                child: Text(
                  "${article.author} . ${article.publishedAt}",
                  style: AppTextStyle.grey14Regular,
                ),
              ),
            ],
          ),

          SizedBox(
            width: 112.w,
            height: 80.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl:
                    article.urlToImage ??
                    "https://cdn.vectorstock.com/i/preview-1x/35/70/reading-hot-news-vector-42233570.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
