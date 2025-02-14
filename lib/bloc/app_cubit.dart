import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState {
  final String? username;
  final int themeColor;
  final String? currency;
  final ThemeMode themeMode; // Dark mode support

  AppState({
    this.username,
    required this.themeColor,
    this.currency,
    required this.themeMode,
  });

  // Retrieve saved app state from SharedPreferences
  static Future<AppState> getState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieving saved values
    int? themeColor = prefs.getInt("themeColor");
    String? username = prefs.getString("username");
    String? currency = prefs.getString("currency");
    bool isDarkMode = prefs.getBool("isDarkMode") ?? false;

    // If no themeColor is saved, fallback to default (Green)
    themeColor ??= Colors.green.value;

    // Return new AppState with retrieved data
    return AppState(
      themeColor: themeColor,
      username: username,
      currency: currency,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }

  // Copy method for updating state without overwriting other fields
  AppState copyWith({
    String? username,
    int? themeColor,
    String? currency,
    ThemeMode? themeMode,
  }) {
    return AppState(
      username: username ?? this.username,
      themeColor: themeColor ?? this.themeColor,
      currency: currency ?? this.currency,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

class AppCubit extends Cubit<AppState> {
  AppCubit(AppState initialState) : super(initialState);

  // Update username and save to SharedPreferences
  Future<void> updateUsername(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", username);
    emit(state.copyWith(username: username));
  }

  Future<void> updateCurrency(String currency) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("currency", currency);
    emit(state.copyWith(currency: currency));
  }

  Future<void> updateThemeColor(int color) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("themeColor", color);
    emit(state.copyWith(themeColor: color));
  }

  Future<void> toggleTheme() async {
    final bool isDarkMode = state.themeMode == ThemeMode.dark;
    final ThemeMode newTheme = isDarkMode ? ThemeMode.light : ThemeMode.dark;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDarkMode", newTheme == ThemeMode.dark); // Save theme mode preference

    emit(state.copyWith(themeMode: newTheme)); // Update the state to trigger UI changes
  }

  // Reset all preferences to defaults
  Future<void> reset() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clears all stored settings
    emit(await AppState.getState()); // Reset state from saved preferences
  }
}
