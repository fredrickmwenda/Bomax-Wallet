// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages/confirmation_page.dart' as _i6;
import '../pages/convert_page.dart' as _i5;
import '../pages/welcome_page.dart' as _i3;
import '../pages/home_page.dart' as _i4;
import '../pages/status_page.dart' as _i7;
// import '../pages/coin_detail_page.dart' as _i8;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
            data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
          return _i4.HomePage(key: args.key);
        }),
    WelcomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
      routeData: routeData,
      builder: (data){
        final args = 
          data.argsAs<WelcomeRouteArgs>(orElse: () => const WelcomeRouteArgs());
        return _i3.WelcomePage(key: args.key);        
      }),
    ConvertRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ConvertRouteArgs>(
              orElse: () => const ConvertRouteArgs());
          return _i5.ConvertPage(key: args.key);
        }),
    ConfirmationRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.ConfirmationPage();
        }),
    StatusRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.StatusPage();
        }),
    // CoinDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
    //     routeData: routeData,
    //     builder: (_) {
    //       return const _i8.CoinDetail();
    //     })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        
         _i1.RouteConfig(WelcomeRoute.name, path: '/'),
         _i1.RouteConfig(HomeRoute.name, path: '/home-page'),
         _i1.RouteConfig(ConvertRoute.name, path: '/convert-page'),
         _i1.RouteConfig(ConfirmationRoute.name, path: '/confirmation-page'),
         _i1.RouteConfig(StatusRoute.name, path: '/status-page'),
        //  _i1.RouteConfig(CoinDetailRoute.name, path: '/coin-detail-page')
      ];
}

class WelcomeRoute extends _i1.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({_i2.Key? key})
      : super(name, path: '/', args: WelcomeRouteArgs(key: key));

  static const String name = 'WelcomeRoute';
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({this.key});

  final _i2.Key? key;
}
class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i2.Key? key})
      : super(name, path: '/home-page', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i2.Key? key;
}

class ConvertRoute extends _i1.PageRouteInfo<ConvertRouteArgs> {
  ConvertRoute({_i2.Key? key})
      : super(name, path: '/convert-page', args: ConvertRouteArgs(key: key));

  static const String name = 'ConvertRoute';
}

class ConvertRouteArgs {
  const ConvertRouteArgs({this.key});

  final _i2.Key? key;
}

class ConfirmationRoute extends _i1.PageRouteInfo {
  const ConfirmationRoute() : super(name, path: '/confirmation-page');

  static const String name = 'ConfirmationRoute';
}

class StatusRoute extends _i1.PageRouteInfo {
  const StatusRoute() : super(name, path: '/status-page');

  static const String name = 'StatusRoute';
}

// class CoinDetailRoute extends _i1.PageRouteInfo {
//   const CoinDetailRoute() : super(name, path: '/coin-detail-page');

//   static const String name = 'CoinDetailRoute';
// }
