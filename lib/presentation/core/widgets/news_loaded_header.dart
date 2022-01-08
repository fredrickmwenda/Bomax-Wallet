import 'package:bodax_wallet/presentation/core/models/new_model.dart';
import 'package:bodax_wallet/presentation/core/widgets/news_intro.dart';
import 'package:bodax_wallet/presentation/core/widgets/page_transformer.dart';
import 'package:flutter/material.dart';
/// Calling imageLoading animation for set a grid layout
class NewsLoadedHeader extends StatelessWidget {
  const NewsLoadedHeader({Key? key, required this.items}) : super(key: key);

  final List<News>? items;

  @override
  Widget build(BuildContext context) {
    return PageTransformer(
      pageViewBuilder: (context, visibilityResolver) {
        return PageView.builder(
          controller: PageController(viewportFraction: 0.87),
          itemCount: items?.length,
          itemBuilder: (context, index) {
            final item = items![index];
            final pageVisibility =
                visibilityResolver.resolvePageVisibility(index);
            return IntroPageItem(
              item: item,
              pageVisibility: pageVisibility,
            );
          },
        );
      },
    );
  }
}