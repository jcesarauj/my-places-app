import 'package:MyPlacesApp/src/screens/place-form-screen.dart';
import 'package:MyPlacesApp/src/screens/places-list-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/providers/greatePlacesProvider.dart';
import 'src/utils/appRoutes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatePlacesProvider(),
      child: MaterialApp(
        title: 'My Places App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PlacesListScreen(),
        routes: {AppRoutes.PLACE_FORM: (ctx) => PlaceFormScreen()},
      ),
    );
  }
}
