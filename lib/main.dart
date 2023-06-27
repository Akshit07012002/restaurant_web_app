import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_web_app/bloc/bloc_observer.dart';
import 'package:restaurant_web_app/bloc/data_fetch/menu_fetch_bloc.dart';
import 'package:restaurant_web_app/pages/home_page.dart';
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
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Restaurant App',
              theme: ThemeData(
                fontFamily: 'Poppins',
                brightness: Brightness.light,
                primaryColor: AppColors.primary,
              ),
              home: HomePage(categories: state.response), 
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
