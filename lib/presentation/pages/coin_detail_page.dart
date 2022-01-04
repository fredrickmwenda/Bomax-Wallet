import 'package:auto_route/src/router/auto_router_x.dart';

import 'package:bodax_wallet/domain/coin.dart';
import 'package:bodax_wallet/widget/transaction_process.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../presentation/routes/router.gr.dart';

class CoinDetail extends StatefulWidget {
  const CoinDetail({Key? key, required this.coin}) : super(key: key);
  final Coin coin;

  @override
  State<CoinDetail> createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff161621),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.blueGrey),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.search, color: Colors.blueGrey),
            onPressed: () {},
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innetIsScrolled) {
            return [
              SliverToBoxAdapter(
                  child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${widget.coin.name}(${widget.coin.symbol})',
                          style: TextStyle(
                              color: Colors.blueGrey.shade300, fontSize: 20),
                        ),
                        Text(
                          '\$${widget.coin.currentPrice}',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 250,
                      child: LineChart(
                        mainData(),
                        swapAnimationDuration:
                            const Duration(milliseconds: 1000),
                        swapAnimationCurve: Curves.linear,
                      ))
                ]),
              ))
            ];
          },
          body: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TransactionProcess(
                          icon: Icons.arrow_downward, title: 'Receive'),
                      const SizedBox(
                        width: 10,
                      ),
                      const TransactionProcess(
                          icon: Icons.arrow_upward, 
                          title: 'Send'
                        ),
                      const SizedBox(
                        width: 10,
                      ),
                      TransactionProcess(
                        icon: Icons.swap_horiz, 
                        title: 'Swap',
                        onTap: (){
                          context.router.push(ConvertRoute());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
               Container(
                  height: 700.0,
                    child:  Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: DefaultTabController(
                              length: 2, 
                              child: Scaffold(
                                appBar: PreferredSize(
                                  preferredSize: const Size.fromHeight(53.0),
                                  child: AppBar(
                                    backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                    elevation: 0.0,
                                    centerTitle: true,
                                    flexibleSpace: SafeArea(
                                      child: Container(
                                        child: Padding(
                                          padding: 
                                          const EdgeInsets.only(right: 100.0),
                                          child: TabBar(
                                            indicatorColor: Colors.amber,
                                            labelColor: 
                                              Theme.of(context).primaryColor,
                                            unselectedLabelColor:
                                              Theme.of(context).textSelectionColor,
                                            indicatorSize: 
                                              TabBarIndicatorSize.label,
                                            tabs: [
                                            Tab(
                                              child: Row(
                                                children: const <Widget>[
                                                  Padding(
                                                    padding: 
                                                    EdgeInsets.only(
                                                        left: 4.0),
                                                    child: Icon(
                                                      IconData(0xe900,
                                                        fontFamily: 'gainers'
                                                      ),
                                                      size: 15.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 8.0
                                                    ),
                                                    child: Text(
                                                      'Transactions',
                                                      style: TextStyle(
                                                        fontFamily: 'Sans'
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Tab(
                                              child: Row(
                                                children: const <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.0),
                                                    child: Icon(
                                                      IconData(0xe901,
                                                          fontFamily: 'loser'),
                                                      size: 15.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.0),
                                                    child: Text('About'),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    ),
                                     automaticallyImplyLeading: false,
                                  ),
                                

                                ),
                                body: const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child:  TabBarView(
                                    children: [
                                      // gainer(),
                                      // loser(),
                                    ],
                                  ),
                                ),
                              )
                            )
                          ),
                        ],
                      ),
                    
                  )
                ],
              )),
        ));
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1.6,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            //Add Dashed line
            dashArray: [3, 3],
            color: const Color(0xff37434d).withOpacity(0.2),
            strokeWidth: 2,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';

              case 11:
                return 'OCT';

              case 14:
                return 'NOV';

              case 17:
                return 'DEC';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 24,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 10,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.4, 2),
            FlSpot(4.4, 5),
            FlSpot(6.6, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 6),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: true,

              //Additionals
              gradientFrom: const Offset(0, 0),
              gradientTo: const Offset(0, 1),
              colors: [
                // gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                const Color(0xff02d39a).withOpacity(0.2),
                const Color(0xff02d39a).withOpacity(0)
              ]),
        ),
      ],
    );
  }
}
