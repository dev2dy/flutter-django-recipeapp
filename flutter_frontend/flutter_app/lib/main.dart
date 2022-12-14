import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth.dart';
import 'package:flutter_app/screens/recipe_details_screen2.dart';
import 'package:flutter_app/screens/recipes_screen.dart';
import 'package:flutter_app/screens/search_screen.dart';
import 'package:provider/provider.dart';

// Screens
import 'screens/tabs_screen.dart';
import 'screens/recipe_details_screen2.dart';
import 'screens/filter_screen.dart';

// Providers
import './providers/recipes.dart';
import './providers/auth.dart';
import './providers/favorites.dart';
import './providers/recommendations.dart';
import './providers/filters.dart';
import './providers/settings.dart';

// Theme
import './common/theme.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => Recipes(),
        ),
        // ignore: missing_required_param
        ChangeNotifierProxyProvider<Auth, Favorites>(
          update: (ctx, auth, previousProducts) => Favorites(
              auth.token,
              auth.getUserId,
              previousProducts == null ? [] : previousProducts.favitems),
        ),
        // ignore: missing_required_param
        ChangeNotifierProxyProvider<Auth, Recommendations>(
          update: (ctx, auth, previousProducts) => Recommendations(
              auth.token,
              auth.getUserId,
              previousProducts == null ? [] : previousProducts.recitems),
        ),
        ChangeNotifierProvider(
          create: (_) => Filters(),
        ),
        ChangeNotifierProvider(
          create: (_) => Settings(),
        ),
      ],
      // child: Consumer<Auth>(
      //   builder: (ctx, auth, _) => MaterialApp(
      //     title: "RecipeApp",
      //     theme: appTheme,
      //     home: auth.isAuth
      //         ? TabsScreen()
      //         : FutureBuilder(
      //             future: auth.tryAutoLogin(),
      //             builder: (ctx, authResultSnapshot) => (auth.isAuth &&
      //                     authResultSnapshot.connectionState ==
      //                         ConnectionState.waiting)
      //                 ? SplashScreen()
      //                 : AuthScreen(),
      //           ),
      //     routes: {
      //       RecipeDetailsScreen.route: (ctx) => RecipeDetailsScreen(),
      //       SearchScreen.route: (ctx) => SearchScreen(),
      //       FilterScreen.route: (ctx) => FilterScreen(),
      //       // MealDetailScreen.route: (ctx) => MealDetailScreen(_toggleFavourite, _isMealFavourite),
      //       // FiltersScreen.route: (ctx) => FiltersScreen(_filters, _setFilters),
      //     },
      //     onUnknownRoute: (settings) {
      //       return MaterialPageRoute(builder: (ctx) => RecipesScreen());
      //     },
      //   ),
      // ),
      child: MaterialApp(
        title: "RecipeApp",
        theme: appTheme,
        home: TabsScreen(),
        routes: {
          RecipeDetailsScreen2.route: (ctx) => RecipeDetailsScreen2(),
          SearchScreen.route: (ctx) => SearchScreen(),
          FilterScreen.route: (ctx) => FilterScreen(),
          // MealDetailScreen.route: (ctx) => MealDetailScreen(_toggleFavourite, _isMealFavourite),
          // FiltersScreen.route: (ctx) => FiltersScreen(_filters, _setFilters),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => RecipesScreen());
        },
      ),
    );
  }
}
