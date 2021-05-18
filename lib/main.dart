import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:list_provider_challenge/models/destinations_model.dart';
import 'package:list_provider_challenge/pages/market_page.dart';

void main() {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Destinations(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AluraTravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[200]
      ),
      home: MarketPage(),
    );
  }
}