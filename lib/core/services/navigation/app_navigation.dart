import 'package:bmi_calculator/core/services/navigation/route_path.dart';
import 'package:bmi_calculator/core/util/widgets/error_widget.dart';
import 'package:bmi_calculator/features/bmi_detailed_info/presentation/pages/bmi_details_info_screen.dart';
import 'package:bmi_calculator/features/bmi_entries_history/presentation/pages/bmi_entries_screen.dart';
import 'package:bmi_calculator/features/bmi_form/presentation/pages/bmi_form_screen.dart';
import 'package:bmi_calculator/features/home/presentation/pages/home_screen.dart';
import 'package:bmi_calculator/features/sign_in/presentation/pages/sign_in_screen.dart';
import 'package:bmi_calculator/shared/entities/bmi_entry_with_id.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static final GoRouter router = GoRouter(
    errorPageBuilder: (context, state) => MaterialPage(
        child: ErrorMessage(
      errorMessage: state.error!.toString(),
    )),
    initialLocation: RoutePath.signInPage,
    routes: <RouteBase>[
      GoRoute(
        path: RoutePath.signInPage,
        builder: (context, state) => SignInScreen(key: state.pageKey),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.bmiFormPage,
                builder: (context, state) => BmiFormScreen(
                  key: state.pageKey,
                ),
              ),
            ],
          ),
          StatefulShellBranch(routes: [
            GoRoute(
              path: RoutePath.bmiEntriesPage,
              builder: (context, state) => BmiEntriesScreen(key: state.pageKey),
            ),
          ])
        ],
      ),
      GoRoute(
          path: RoutePath.bmiDetailsPage,
          builder: (context, state) {
            BmiEntryWithId bmiEntryWithId = state.extra as BmiEntryWithId;
            return BmiDetailsInfoScreen(
              key: state.pageKey,
              bmiEntryWithId: bmiEntryWithId,
            );
          }),
    ],
  );
}
