import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_text_style.dart';

class CustomCategoryItemWidget extends StatelessWidget {
  final String text;
  final Function() onTap;

  const CustomCategoryItemWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: InkWell(
        onTap: () {},
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            overlayColor: Color(0xffE9EEFA),
            backgroundColor: AppColors.whiteColor,
            side: BorderSide(color: Color(0xffE9EEFA), width: 1.sp),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(56.r),
            ),
          ),
          child: Text(text, style: AppTextStyle.black16Medium),
        ),
      ),
    );
  }
}
