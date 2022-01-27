import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bodax_wallet/application/coin_convert/coin_convert_notifier.dart';
import 'package:bodax_wallet/application/coin_convert/coin_convert_provider.dart';
import 'package:bodax_wallet/domain/coin.dart';
import 'package:bodax_wallet/presentation/core/utils.dart';
import 'package:bodax_wallet/presentation/core/widgets/image_coin.dart';
import 'package:bodax_wallet/presentation/core/widgets/round_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../presentation/routes/router.gr.dart';

import 'portafolio_page.dart';

class ConversionPage extends StatefulWidget {
  const ConversionPage({Key? key}) : super(key: key);

  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  // final _color = const Color(0xfff3a00ff);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<CoinConvertState>(
      onChange: (context, state){
        if (state.isPreview) {
          context.router.push(const ConfirmationRoute());
          
        }
      }, 
      provider: coinConvertNotifierProvider, 
      child: Consumer(builder: (context, watch, child) {
          final state = watch(coinConvertNotifierProvider);
          // final msg1 = '${Utils.getPrice(state.from!.dollars!)} ';
          return state.isLoading 
          ? Scaffold(
              body: Center(
                child: Container(
                  color: Colors.white,
                  child: const CircularProgressIndicator()
                ),
              ),
            )
             
            : Scaffold(
              backgroundColor: const Color(0xDA000000),
              appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0.0,
                centerTitle: true,
                automaticallyImplyLeading: true,
                brightness: Brightness.dark,
                // leading: IconButton(
                //   color: Colors.black,
                //   iconSize: 45.h,
                //   icon: const Icon(Icons.close),
                //   onPressed: () => Navigator.pop(context),
                // ),
                title: Column(
                  children: [
                    Text('Exchange',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.bold)
                          ),
                  ],
                ),
              ),
              body:  Center(
                // child: ConstrainedBox(
                //   constraints: const BoxConstraints(maxWidth: 600),
                  child: ExchangeCoin(from: state.from!, to: state.to!)
              ),
      
            );
          }
        )
      );
  }
}

class ExchangeCoin extends StatelessWidget {
  const ExchangeCoin({
    Key? key, required this.from, required this.to,
  }) : super(key: key);
  final Coin from, to;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          
          child: Container(
            width: double.infinity,
            // height: double.infinity,
           
            decoration: const BoxDecoration(
                 color: Color.fromRGBO(5,30,71, 30),
                borderRadius:
                    BorderRadius.all(Radius.circular(10.0))
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),

              child: Column(
                children: <Widget>[
                  const Text(
                    'You Send',
                    style: TextStyle(
                        color: Colors.white24,
                        fontFamily: 'Popins',
                        
                        fontSize: 15.5),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        '5,550.25',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Popins',
                            fontSize: 25.5),
                      ),

                      InkWell(
                        onTap: () {
                          final state = context.read(coinConvertNotifierProvider);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PortafolioPage(
                                selected: state.from!,
                                coins: state.portafolio!,
                                isPortafolio: true,
                                oppositeCoin: state.to!,
                              )
                            )
                          );
                        },
                        child: Row(
                          children: [
                            ImageCoin(
                              imageUrl: from.id,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            _CoinColum(
                              aligment: CrossAxisAlignment.start,
                              title: '',
                              subtitle: from.symbol,
                            ),
                          ],
                        ),
                      ),
                      // DropdownButton<String>(
                      //   value: selectedVa,
                      //   items: items,
                      //   icon: ,

                      // )
                    ],
                  ),
                  SizedBox(height: 11.h),
                  const Divider(
                    height: 50,
                    thickness: 5,
                  ),
                  SizedBox(height: 11.h),
                  const Text(
                    'You Receive',
                    style: TextStyle(
                        color: Colors.white24,
                        fontFamily: 'Popins',
                        fontSize: 15.5),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '87,321.74',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Popins',
                            fontSize: 25.5),
                      ),
                      // DropdownButton<String>(
                      //   value: selectedVa,
                      //   items: items,
                      //   icon: ,

                      // )
                      InkWell(
                        onTap: () {
                          final state = context.read(coinConvertNotifierProvider);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PortafolioPage(
                                      isPortafolio: false,
                                      selected: state.to!,
                                      oppositeCoin: state.from!,
                                      coins: state.all!)));
                        },
                        child: Row(
                          children: [
                            _CoinColum(
                              aligment: CrossAxisAlignment.end,
                              title: '',
                              subtitle: to.symbol,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            ImageCoin(
                              imageUrl: to.id,
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Text(
                    'Available Portfolio',
                    style: TextStyle(
                        color: Colors.white24,
                        fontFamily: 'Popins',
                        fontSize: 15.5),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 100.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        border: Border.all(color: Colors.grey.shade300, width: 2),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  const WidgetSpan(
                                      child: Icon(Icons.backup_table)),
                                  TextSpan(
                                    text: 'Ethereum',
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            // DropdownButton(
                            //   value: selectedValue,
                            //   style: TextStyle(color: Colors.red,fontSize: 30),
                            //   onChanged: null,
                            //   items: dropdownItems
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '1 Eth'),
                            WidgetSpan(child: Icon(Icons.drag_handle)),
                            TextSpan(text: '15.887 ETC')
                          ],
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                            fontSize: 30,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 218,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Icon(Icons.account_balance_wallet),
                        Column(
                          children: const [
                            Text(
                              '0.010%',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              'Exchange Fee',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),

              Container(
                width: 130,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Text(
                  '\$${40}',
                  style: TextStyle(
                    fontSize: 28, 
                    fontWeight: FontWeight.w500)
                  ),
              )
            ],
          ),
        ),

        SizedBox(
          height: 30.h,
        ),

        RoundButton(
          text: 'Exchange',
          onTap: () {
            context
                .read(coinConvertNotifierProvider.notifier)
                .validate();
          },
        ),
      ],

      // _ExchangeCoin(
      //   from: state.from!,
      //   to: state.to!,
      // ),

      // const _Keyboard(),
      // SizedBox(
      //     height: 60.h,
      // ),
      // RoundButton(
      //     text: 'Exchange',
      //     onTap: () {
      //       context
      //           .read(coinConvertNotifierProvider.notifier)
      //           .validate();
      //     },
      // ),
    );
  }
}

class _ExchangeCoin extends StatelessWidget {
  const _ExchangeCoin({Key? key, required this.from, required this.to})
      : super(key: key);

  final Coin from, to;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              final state = context.read(coinConvertNotifierProvider);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PortafolioPage(
                            selected: state.from!,
                            coins: state.portafolio!,
                            isPortafolio: true,
                            oppositeCoin: state.to!,
                          )));
            },
            child: Row(
              children: [
                ImageCoin(
                  imageUrl: from.id,
                ),
                SizedBox(
                  width: 30.w,
                ),
                _CoinColum(
                  aligment: CrossAxisAlignment.start,
                  title: '',
                  subtitle: from.symbol,
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Container(),
            ),
          ),
          Container(
            height: 65.h,
            width: 65.h,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400, width: 2),
                borderRadius: BorderRadius.circular(100)),
            child: Icon(
              Icons.import_export,
              size: 35.h,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Container(),
            ),
          ),
          InkWell(
            onTap: () {
              final state = context.read(coinConvertNotifierProvider);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PortafolioPage(
                          isPortafolio: false,
                          selected: state.to!,
                          oppositeCoin: state.from!,
                          coins: state.all!)));
            },
            child: Row(
              children: [
                _CoinColum(
                  aligment: CrossAxisAlignment.end,
                  title: '',
                  subtitle: to.symbol,
                ),
                SizedBox(
                  width: 30.w,
                ),
                ImageCoin(
                  imageUrl: to.id,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CoinColum extends StatelessWidget {
  const _CoinColum(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.aligment})
      : super(key: key);

  final String title, subtitle;
  final CrossAxisAlignment aligment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: aligment,
      children: [
        Text(title,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 28.sp,
                fontWeight: FontWeight.normal)),
        SizedBox(
          height: 5.h,
        ),
        Text(subtitle.toUpperCase(),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 32.sp,
                fontWeight: FontWeight.normal)),
      ],
    );
  }
}

class _Keyboard extends StatelessWidget {
  const _Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: Column(
        children: [
          const Expanded(
            child: _KeyboardRow(
              start: 1,
              end: 3,
            ),
          ),
          const Expanded(
            child: _KeyboardRow(
              start: 4,
              end: 6,
            ),
          ),
          const Expanded(
            child: _KeyboardRow(
              start: 7,
              end: 9,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context
                          .read(coinConvertNotifierProvider.notifier)
                          .onKeyboardTap('.');
                    },
                    child: Text('.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 66.sp,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context
                          .read(coinConvertNotifierProvider.notifier)
                          .onKeyboardTap('0');
                    },
                    child: Text('0',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 66.sp,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
                Expanded(
                    child: IconButton(
                        iconSize: 40.h,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          context
                              .read(coinConvertNotifierProvider.notifier)
                              .onKeyboardDelete();
                        })),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _KeyboardRow extends StatelessWidget {
  const _KeyboardRow({Key? key, required this.start, required this.end})
      : super(key: key);
  final int start, end;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = start; i <= end; i++)
          Expanded(
            child: InkWell(
              onTap: () {
                context
                    .read(coinConvertNotifierProvider.notifier)
                    .onKeyboardTap(i.toString());
              },
              child: Text(i.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 66.sp,
                      fontWeight: FontWeight.normal)),
            ),
          ),
      ],
    );
  }
}
