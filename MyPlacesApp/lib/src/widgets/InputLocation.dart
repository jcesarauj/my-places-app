import 'dart:ffi';

import 'package:MyPlacesApp/src/utils/locationUtil.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class InputLocation extends StatefulWidget {
  @override
  _InputLocationState createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {
  String _previewImageUrl;

  Future<Void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();

    final staticImageUrl = LocationUtil.generateLocationPreviewImage(
        locData.latitude, locData.latitude);

    setState(() {
      _previewImageUrl = staticImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
              ? Text('Localização não informada!')
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.location_on),
            label: Text('Localização Atual'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _getCurrentUserLocation,
          ),
          FlatButton.icon(
            icon: Icon(Icons.location_on),
            label: Text('Selecione no Mapa'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () {},
          )
        ])
      ],
    );
  }
}
