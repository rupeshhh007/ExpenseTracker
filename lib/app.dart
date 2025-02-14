import 'package:expense_tracker/bloc/app_cubit.dart';
import 'package:expense_tracker/screens/main.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: MediaQuery.of(context).platformBrightness,
    ));

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ExpenseTracker',
          themeMode: state.themeMode, 
          theme: ThemeData.light().copyWith(  
           
            navigationBarTheme: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                TextStyle style = const TextStyle(fontWeight: FontWeight.w500, fontSize: 11);
                if (states.contains(WidgetState.selected)) {
                  style = style.merge(const TextStyle(fontWeight: FontWeight.w600));
                }
                return style;
              }),
            ),
          ),
          darkTheme: ThemeData.dark().copyWith( 
            navigationBarTheme: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                TextStyle style = const TextStyle(fontWeight: FontWeight.w500, fontSize: 11);
                if (states.contains(WidgetState.selected)) {
                  style = style.merge(const TextStyle(fontWeight: FontWeight.w600));
                }
                return style;
              }),
            ),
          ),
          home: const MainScreen(),
        );
      },
    );
  }
}
