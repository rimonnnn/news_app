import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_style.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

class ArticalDetailsScreen extends StatelessWidget {
  final Article article;
  const ArticalDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: 430.w,
              height: 305.h,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    article.urlToImage ??
                    "https://cdn.vectorstock.com/i/preview-1x/35/70/reading-hot-news-vector-42233570.jpg",
              ),
            ),
            Positioned(
              top: 260.h,
              child: Container(
                width: 430.w,
                height: 680.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 32.sp,
                  vertical: 24.sp,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? "",
                        style: AppTextStyle.titleStyle.copyWith(fontSize: 18),
                      ),
                      HeightSpace(16),
                      Text(
                        "${article.author} . ${DateFormat('yyyy-MM-dd - kk-mm').format(article.publishedAt)}",
                        style: AppTextStyle.grey14Regular.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      HeightSpace(24),
                      Text(
                        article.description ?? "",
                        style: AppTextStyle.black16Medium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
