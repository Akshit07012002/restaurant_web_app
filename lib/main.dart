import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_web_app/bloc/bloc_observer.dart';
import 'package:restaurant_web_app/bloc/cart/cart_bloc.dart';
import 'package:restaurant_web_app/bloc/data_fetch/menu_fetch_bloc.dart';
import 'package:restaurant_web_app/pages/checkout_page.dart';
import 'package:restaurant_web_app/pages/home_page.dart';
import 'package:restaurant_web_app/pages/success_page.dart';
import 'package:restaurant_web_app/utils/colors.dart';

void main() {
  Bloc.observer = RestoBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late MenuFetchBloc menuFetchBloc;
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    super.initState();
    menuFetchBloc = MenuFetchBloc()..add(MenuFetchStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => menuFetchBloc,
      child: BlocBuilder<MenuFetchBloc, MenuFetchState>(
        builder: (context, state) {
          if (state is MenuFetchStateFailure) {
            return const Center(
              child: MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: Text('Failed to fetch data'),
                  ),
                ),
              ),
            );
          }
          if (state is MenuFetchStateSuccess) {
            // return MaterialApp(
            //   debugShowCheckedModeBanner: false,
            //   title: 'Restaurant App',
            //   theme: ThemeData(
            //     fontFamily: 'Poppins',
            //     brightness: Brightness.light,
            //     primaryColor: AppColors.primary,
            //   ),
            //   home: const HomePage(),
            // );
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  lazy: false,
                  create: (context) => CartBloc(),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Restaurant App',
                theme: ThemeData(
                  fontFamily: 'Poppins',
                  brightness: Brightness.light,
                  primaryColor: AppColors.primary,
                ),
                routes: {
                  '/': (context) => HomePage(
                        categories: state.response,
                      ),
                  '/order': (context) => const CheckoutPage(),
                  '/success': (context) => const SuccessPage(),
                },
                initialRoute: '/',
                // home: HomePage(categories: state.response),
                // Scaffold(
                //   body: Center(
                //     child: ListView.builder(itemBuilder: (context, index) {
                //       return ListTile(
                //         title: Text(state.response[index].categoryName!),
                //         // title: Text('hi'),
                //       );
                //     }),
                //   ),
                // ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
