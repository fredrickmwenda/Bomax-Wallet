import 'package:bodax_wallet/presentation/core/models/new_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';


// ignore: camel_case_types
class newsListDetail extends StatefulWidget {
 

  newsListDetail({Key? key, required this.item}) : super(key: key);
  final  News item;

 @override
  // ignore: no_logic_in_create_state
  State< newsListDetail> createState() => _newsListDetailState(item: item);
}

// ignore: camel_case_types
class _newsListDetailState extends State<newsListDetail> {
  
  _newsListDetailState({required this.item});
  News item;
  @override
  Widget build(BuildContext context) {
    double _fullHeight = MediaQuery.of(context).size.height;

    /// Hero animation for image
    Hero(
      tag: 'hero-tag-list-${item.id}',
      child: DecoratedBox(
        decoration:  BoxDecoration(
          image:  DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(item.imageurl!),
          ),
          shape: BoxShape.rectangle,
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 130.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
              colors: [
                Color(0xFF000000),
                Color(0x00000000),
              ],
            ),
          ),
        ),
      ),
    );

    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: MySliverAppBar(
                img: item.imageurl, 
                id: item.id, 
                expandedHeight: _height - 0.0
              ),
       
              pinned: true,
            ),

          
            /// Container for description to Sort and Refine
            SliverToBoxAdapter(
                child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 40.0, left: 20.0, right: 20.0, bottom: 10.0),
                child: Text(
                  item.title!,
                  style: TextStyle(
                      fontFamily: 'Popins',
                      color: Colors.red[900],
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Text(
                  item.body!,
                  style: TextStyle(
                      fontFamily: 'Popins',
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Text(
                  item.tags!,
                  style: TextStyle(
                      fontFamily: 'Popins',
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Text(
                  item.source!,
                  style: TextStyle(
                      fontFamily: 'Popins',
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 50.0,
              )
            ])),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {


  MySliverAppBar({@required this.img, this.id, @required this.expandedHeight});
  final double? expandedHeight;

  String? img, id;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.clip,
      children: [
        Container(
          height: 50.0,
          width: double.infinity,
          color: const Color(0xFF172E4D),
        ),
        Opacity(
          // use !for accepting null values
          opacity: (1 - shrinkOffset / expandedHeight!),
          child: Hero(
            transitionOnUserGestures: true,
            // ignore: unnecessary_brace_in_string_interps
            tag: 'hero-tag-list-${id}',
            child:  DecoratedBox(
              decoration:  BoxDecoration(
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image:  CachedNetworkImageProvider(img!),
                ),
                shape: BoxShape.rectangle,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 130.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: <Color>[
                      Color(0xFF000000),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Icon(Icons.arrow_back),
                    ))),
            Align(
              alignment: Alignment.center,
              child: Text(
                'News',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gotik',
                  fontWeight: FontWeight.w700,
                  fontSize: (expandedHeight! / 40) - (shrinkOffset / 40) + 18,
                ),
              ),
            ),
            const SizedBox(
              width: 36.0,
            )
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight!;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
