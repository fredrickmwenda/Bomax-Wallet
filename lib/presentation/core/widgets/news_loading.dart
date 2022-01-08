import 'package:bodax_wallet/presentation/core/models/new_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Calling imageLoading animation for set a list layout
class NewsLoading extends StatelessWidget {
  const NewsLoading({
    Key? key, required this.items,
  }) : super(key: key);
  final List<News>? items;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.only(top: 0.0),
      itemCount: items!.length,
      itemBuilder: (ctx, i) {
        return Padding(
    padding: const EdgeInsets.only(left: 25.0, top: 20.0, bottom: 0.0),
    child: Shimmer.fromColors(
      baseColor: const Color(0xFF3B4659),
      highlightColor: const Color(0xFF606B78),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 95.0,
            width: 130.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              color: Theme.of(ctx).hintColor.withAlpha(170),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 13.0,
                    width: 70.0,
                    color: Theme.of(ctx).hintColor.withAlpha(170),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Container(
                    height: 15.0,
                    width: 170.0,
                    color: Theme.of(ctx).hintColor.withAlpha(170),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Container(
                    height: 15.0,
                    width: 170.0,
                    color: Theme.of(ctx).hintColor.withAlpha(170),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        size: 15.0,
                        color: Theme.of(ctx).hintColor.withAlpha(170),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                          height: 12.0,
                          width: 30.0,
                          color: Theme.of(ctx).hintColor.withAlpha(170),
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
      },
    );
  }
}

