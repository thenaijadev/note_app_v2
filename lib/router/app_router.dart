import 'package:flutter/material.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/presentation/screens/error.dart';
import 'package:netapp/app/presentation/screens/home.dart';
import 'package:netapp/app/presentation/screens/new/add_sku_screen.dart';
import 'package:netapp/app/presentation/screens/new/competition_review_form_screen.dart';
import 'package:netapp/app/presentation/screens/new/competition_review_table.dart';
import 'package:netapp/app/presentation/screens/new/data_capture_form.dart';
import 'package:netapp/app/presentation/screens/new/outlet_details_screen.dart';
import 'package:netapp/app/presentation/screens/new/outlet_table.dart';
import 'package:netapp/app/presentation/screens/new/product_table.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/router/routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      // case Routes.products:
      //   return MaterialPageRoute(
      //     builder: (_) => ProductsScreen(),
      //   );
      case Routes.todayDetails:
        return MaterialPageRoute(
          builder: (_) => const TodayDetails(),
        );

      case Routes.dataCapture:
        return MaterialPageRoute(
          builder: (_) => const DataCatureScreen(),
        );
      case Routes.options:
        return MaterialPageRoute(
          builder: (_) => const OutletTable(),
        );
      // case Routes.details:
      //   var data = routeSettings.arguments as Map;

      //   // return MaterialPageRoute(
      //   //   builder: (_) => DetailScreen(
      //   //     data: data,
      //   //   ),
      //   // );

      case Routes.outlets:
        return MaterialPageRoute(
          builder: (_) => const OutletTable(),
        );

      case Routes.skuForm:
        var data = routeSettings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => SkuScreen(
            id: data,
          ),
        );
      case Routes.reviews:
        return MaterialPageRoute(
          builder: (_) => const CompetitionReviewTable(),
        );

      case Routes.reviewForm:
        return MaterialPageRoute(
          builder: (_) => const CompetitionReviewFormScreen(),
        );
      case Routes.outletDetails:
        var outlet = routeSettings.arguments as Outlet;

        return MaterialPageRoute(
          builder: (_) => OutletDetailsScreen(
            outlet: outlet,
          ),
        );
      case Routes.productsTable:
        var data = routeSettings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => ProductsTable(
            id: data,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
