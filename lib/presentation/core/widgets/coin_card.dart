import 'package:bodax_wallet/domain/coin.dart';
import 'package:bodax_wallet/presentation/core/utils.dart';
import 'package:bodax_wallet/presentation/core/widgets/image_coin.dart';
import 'package:bodax_wallet/presentation/pages/coin_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    Key? key,
    required Coin coin,
    

  }):_coin = coin,
  
  super(key: key);

  final Coin _coin;
 

  @override
  Widget build(BuildContext context) {
    // var themeData = Theme.of(context);
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),
      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            // ignore: avoid_print
            onPressed: (_) {},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Send',
          ),
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Receive',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (_) {},
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),

      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return CoinDetail(
                  coin: _coin,
                );
              },
            ),
          );
        },
        child: Container(
          height: 90,
          color: const Color.fromRGBO(55, 66, 92, 0.4),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            children: <Widget>[
              Container(width: 40.0, child: ImageCoin(imageUrl: _coin.id)),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_coin.name} (${_coin.symbol})',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(Utils.getCoinAmount(_coin.amount!, _coin.symbol),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${_coin.currentPrice}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       getCoinProgress(coin),
                  //       style: TextStyle(
                  //         color: coin.trend == Trend.UP
                  //             ? kSuccessColor
                  //             : kDangerColor,
                  //         fontSize: 13.0,
                  //       ),
                  //     ),
                  //     Icon(
                  //       coin.trend == Trend.UP
                  //           ? FlutterIcons.caret_up_faw
                  //           : FlutterIcons.caret_down_faw,
                  //       size: 14.0,
                  //       color: coin.trend == Trend.UP
                  //           ? kSuccessColor
                  //           : kDangerColor,
                  //     )
                  //   ],
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
