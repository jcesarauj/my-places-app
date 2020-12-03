import 'package:MyPlacesApp/src/providers/greatePlacesProvider.dart';
import 'package:MyPlacesApp/src/utils/appRoutes.dart';
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
      body: FutureBuilder(
        future: Provider.of<GreatePlacesProvider>(context, listen: false)
            .loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<GreatePlacesProvider>(
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
      ),
    );
  }
}
