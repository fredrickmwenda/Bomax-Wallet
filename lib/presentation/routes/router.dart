import 'package:auto_route/auto_route.dart';
import 'package:bodax_wallet/presentation/pages/coin_detail_page.dart';
import 'package:bodax_wallet/presentation/pages/confirmation_page.dart';
import 'package:bodax_wallet/presentation/pages/convert_page.dart';
import 'package:bodax_wallet/presentation/pages/home_page.dart';
import 'package:bodax_wallet/presentation/pages/status_page.dart';

import 'package:bodax_wallet/presentation/pages/welcome_page.dart';
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WelcomePage, initial: true),
    AutoRoute(page: HomePage),
    AutoRoute(page: CoinDetail),
    AutoRoute(page: ConvertPage),
    AutoRoute(page: ConfirmationPage),
    AutoRoute(page: StatusPage),
  ],
)
class $AppRouter {}
