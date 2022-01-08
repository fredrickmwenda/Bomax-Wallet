import 'dart:async';
import 'package:bodax_wallet/presentation/core/models/new_model.dart';
import 'package:bodax_wallet/presentation/core/widgets/news_loaded.dart';
import 'package:bodax_wallet/presentation/core/widgets/news_loaded_header.dart';
import 'package:bodax_wallet/presentation/core/widgets/news_loading.dart';
import 'package:bodax_wallet/presentation/core/widgets/news_loading_header.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key, required this.news}) : super(key: key);
  final Future<List<News>> news;

  @override
  // ignore: no_logic_in_create_state
  State<NewsPage> createState() => _NewsPageState(news: news);
}

class _NewsPageState extends State<NewsPage> {
  _NewsPageState({required this.news});
  final Future<List<News>> news;

  ///
  /// Get image data dummy from firebase server
  ///
  var imageNetwork = const NetworkImage(
      "https://firebasestorage.googleapis.com/v0/b/beauty-look.appspot.com/o/Artboard%203.png?alt=media&token=dc7f4bf5-8f80-4f38-bb63-87aed9d59b95");

  ///
  /// check the condition is right or wrong for image loaded or no
  ///
  bool loadImage = true;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        loadImage = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ClipPath(
                clipper: DialogonalClipper(),
                child: Container(
                  height: 230.0,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          tileMode: TileMode.repeated,
                          colors: [Color(0xFF15EDED), Color(0xFF029CF5)])),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 70.0, left: 20.0),
                  child: Text(
                    'Today',
                    style: TextStyle(
                        fontFamily: 'Sans',
                        fontWeight: FontWeight.w800,
                        fontSize: 30.0,
                        letterSpacing: 1.5,
                        color: Colors.white),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    // child: loadImage
                    //     ? _loadingDataHeader(context)
                    //     : _dataLoadedHeader(context),
                    child: loadImage
                        ? SizedBox.fromSize(
                            size: const Size.fromHeight(500.0),
                            child: FutureBuilder<List<News>>(
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.none &&
                                    !snapshot.hasData) {
                                  return const Text('No data');
                                }
                                return NewsLoadingHeader(items: snapshot.data);
                              },
                              future: news,
                            )
                            // child: FutureBuilder<List<News>>(
                            //   future: news,
                            //   builder: (context, snapshot) {
                            //     if (snapshot.hasError) print(snapshot.error);
                            //     return snapshot.hasData
                            //         ? NewsLoadingHeader(items: snapshot.data)
                            //         : Center(child: CircularProgressIndicator());
                            //   },
                            // ),
                            )
                        : SizedBox.fromSize(
                            size: const Size.fromHeight(500.0),
                            child: FutureBuilder<List<News>>(
                              future: news,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.none &&
                                    !snapshot.hasData) {
                                  return const Text('No data');
                                }
                                return NewsLoadedHeader(items: snapshot.data);

                                // if (snapshot.hasError) print(snapshot.error);
                                // return snapshot.hasData
                                //     ? NewsLoadedHeader(items: snapshot.data)
                                // : Center(
                                //     child: CircularProgressIndicator());
                              },
                            ),
                          )),

                const Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 30.0),
                  child: Text('Crypto Popular News',
                      style: TextStyle(
                          fontFamily: 'Popins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700)),
                ),
                // loadImage
                //     ? _loadingDataList(context)
                //     : _dataLoadedList(context),
                loadImage
                    ? Container(
                        child: FutureBuilder<List<News>>(
                          future: news,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);
                            return snapshot.hasData
                                ? NewsLoading(items: snapshot.data)
                                : Center(child: CircularProgressIndicator());
                          },
                        ),
                      )
                    : Container(
                        child: FutureBuilder<List<News>>(
                          future: news,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);
                            return snapshot.hasData
                                ? NewsLoaded(items: snapshot.data)
                                : Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),

                const SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path = Path();
    path.lineTo(0.0, size.height * 1.5);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    paint.color = Color(0xFF15EDED);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class DialogonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 180.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
