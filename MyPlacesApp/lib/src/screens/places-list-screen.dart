import 'package:MyPlacesApp/src/providers/greatePlacesProvider.dart';
import 'package:MyPlacesApp/src/utils/app-routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          )
        ],
      ),
      body: Consumer<GreatePlacesProvider>(
        child: Center(
          child: Text('Nenhum local cadastrado!'),
        ),
        builder: (ctx, greatPlaces, ch) => greatPlaces.placesCount == 0
            ? ch
            : ListView.builder(
                itemCount: greatPlaces.placesCount,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        FileImage(greatPlaces.placeByIndex(i).image),
                  ),
                  title: Text(greatPlaces.placeByIndex(i).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}