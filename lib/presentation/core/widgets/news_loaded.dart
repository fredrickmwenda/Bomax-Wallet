import 'package:bodax_wallet/presentation/core/models/new_model.dart';
import 'package:bodax_wallet/presentation/core/widgets/news_list_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
/// Calling ImageLoaded animation for set a grid layout
class NewsLoaded extends StatelessWidget {
  const NewsLoaded({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<News>? items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.only(top: 0.0),
      itemCount: items?.length ?? 0,
      itemBuilder: (ctx, i) {
        return NewsLoadedItem(items: items![i]);
      },
    );
  }
}

class NewsLoadedItem extends StatelessWidget {
  const NewsLoadedItem({
    Key? key,
    required this.items,
  }) : super(key: key);

  final News items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 20.0, bottom: 0.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => newsListDetail(item: items),
                transitionDuration: const Duration(milliseconds: 600),
                transitionsBuilder:
                    (_, Animation<double> animation, __, Widget child) {
                  return Opacity(
                    opacity: animation.value,
                    child: child,
                  );
                }),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'hero-tag-list-${items.id}',
              child: Material(
                child: Container(
                  height: 95.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    image: DecorationImage(
                        // image: AssetImage(
                        //   items.imageurl!,
                        // ),
                        image: CachedNetworkImageProvider(items.imageurl!),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 2.0),
                  //   child: Text(
                  //     items.,
                  //     style: TextStyle(
                  //         fontFamily: 'Gotik',
                  //         fontWeight: FontWeight.w700,
                  //         color: Theme.of(context)
                  //             .textSelectionColor
                  //             .withOpacity(0.3)),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Container(
                        width: 180.0,
                        child: Text(
                          items.title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16.0),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 15.0,
                          color: Theme.of(context).hintColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            items.publishedOn!.toString(),
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontFamily: 'Gotik'),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
