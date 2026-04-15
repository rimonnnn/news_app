import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_style.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';

class TopHeadlineWidget extends StatelessWidget {
  final String title;
  final String autherName;
  final String date;
  final String? imageUrl;
  const TopHeadlineWidget({
    super.key,
    required this.title,
    required this.autherName,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl:
                  imageUrl ??
                  "https://cdn.vectorstock.com/i/preview-1x/35/70/reading-hot-news-vector-42233570.jpg",
              fit: BoxFit.fill,
              height: 206.h,
            ),
          ),
        ),
        HeightSpace(16),
        Text(title, style: AppTextStyle.black18SemiBold),

        HeightSpace(12),
        Text("$autherName . $date", style: AppTextStyle.grey14Regular),
      ],
    );
  }
}
