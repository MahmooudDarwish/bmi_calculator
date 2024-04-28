import 'package:bmi_calculator/core/services/navigation/route_path.dart';
import 'package:bmi_calculator/core/services/service_locator.dart';
import 'package:bmi_calculator/core/util/app_constance.dart';
import 'package:bmi_calculator/core/util/enums.dart';
import 'package:bmi_calculator/core/util/string_constance.dart';
import 'package:bmi_calculator/core/util/util_functions.dart';
import 'package:bmi_calculator/features/home/presentation/manager/home_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: HomeView(
        navigationShell: navigationShell,
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.signOutRequestState == RequestState.success) {
          context.go(RoutePath.signInPage);
          sl.unregister<User>();
        } else if (state.signOutRequestState == RequestState.error) {
          UtilFunction.showToast(
              message: state.signOutMessage, state: ToastState.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(StringConstance.home),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout_outlined,
                    color: Colors.black, size: 25),
                onPressed: () {
                  context.read<HomeBloc>().add(const SignOutEvent());
                },
              ),
            ],
          ),
          body: navigationShell,
          bottomNavigationBar: SlidingClippedNavBar(
            backgroundColor: Colors.white,
            onButtonPressed: (index) {
              context.read<HomeBloc>().add(BottomNavBarTappedEvent(
                  index: index, navigationShell: navigationShell));
            },
            barItems: AppConstance.homeBottomNavBarItems,
            selectedIndex: state.selectedIndex,
            activeColor: Colors.black,
          ),
        );
      },
    );
  }
}
