import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
              width: double.infinity,
              height: double.infinity,
              child: CachedNetworkImage(
                imageUrl:
                    article.urlToImage ??
                    "https://cdn.vectorstock.com/i/preview-1x/35/70/reading-hot-news-vector-42233570.jpg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
