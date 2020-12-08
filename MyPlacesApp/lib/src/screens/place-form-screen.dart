import 'dart:io';

import 'package:MyPlacesApp/src/providers/greatePlacesProvider.dart';
import 'package:MyPlacesApp/src/widgets/InputLocation.dart';
import 'package:MyPlacesApp/src/widgets/inputImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  @override
  _PlaceFormScreenState createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void selectedImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void submitForm() {
    if (_titleController.text.isEmpty && _pickedImage == null) return;

    Provider.of<GreatePlacesProvider>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Lugar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Título'),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10),
                    InputImage(this.selectedImage),
                    SizedBox(height: 10),
                    InputLocation()
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Adicionar'),
            color: Theme.of(context).accentColor,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: submitForm,
          )
        ],
      ),
    );
  }
}
