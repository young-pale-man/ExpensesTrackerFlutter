import 'package:expenses/constants.dart';
import 'package:expenses/models/expenses_data.dart';
import 'package:expenses/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

var kAppTheme = ColorScheme.fromSeed(seedColor: kMainColor);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpensesData(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: kAppTheme,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: kAppTheme.onPrimaryContainer,
            foregroundColor: kAppTheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kAppTheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kAppTheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kAppTheme.onSecondaryContainer,
                  fontSize: 18,
                ),
              ),
        ),
        home: const Expenses(),
      ),
    );
  }
}
