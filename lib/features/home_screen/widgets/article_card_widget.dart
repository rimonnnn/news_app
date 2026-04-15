import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_style.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';

class ArticleCardWidget extends StatelessWidget {
  final String title;
  final String autherName;
  final String date;
  final String? imageUrl;
  const ArticleCardWidget({
    super.key,
    required this.title,
    required this.autherName,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeightSpace(16),
            SizedBox(
              width: 238.w,
              child: Text(title, style: AppTextStyle.black18SemiBold),
            ),

            HeightSpace(12),
            Text("$autherName . $date", style: AppTextStyle.grey14Regular),
          ],
        ),

        SizedBox(
          width: 112.w,
          height: 80.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl:
                  imageUrl ??
                  "https://cdn.vectorstock.com/i/preview-1x/35/70/reading-hot-news-vector-42233570.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
