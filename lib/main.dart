import 'package:flutter/material.dart';
import 'package:loka_test/search/domain/models/drinks_model.dart';
import 'package:loka_test/search/view/drink_screen.dart';
import 'package:loka_test/search/view/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:loka_test/search/app/search_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loka test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SearchScreen(),
        onGenerateRoute: (settings) {
          if (settings.name == 'drink') {
            final args = settings.arguments as DrinkModel;

            return MaterialPageRoute(builder: (context) {
              return DrinkScreen(
                drink: args,
              );
            });
          }
          return null;
        },
      ),
    );
  }
}
