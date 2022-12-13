import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function onSave;

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantName = '';
  var positionName = '';
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Podaj nazwę Restauracji',
              ),
              onChanged: (newValue) {
                setState(() {
                  restaurantName = newValue;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Podaj nazwę Pozycji',
              ),
              onChanged: (newValue) {
                setState(() {
                  positionName = newValue;
                });
              },
            ),
            Slider(
              value: rating,
              min: 1.0,
              max: 6.0,
              divisions: 10,
              label: rating.toString(),
              onChanged: (newValue) {
                setState(() {
                  rating = newValue;
                });
              },
            ),
            ElevatedButton(
              onPressed: restaurantName.isEmpty || positionName.isEmpty
                  ? null
                  : () {
                      FirebaseFirestore.instance.collection('restaurants').add({
                        'name': restaurantName,
                        'Danie': positionName,
                        'rating': rating,
                      });
                      widget.onSave();
                    },
              child: const Text('Dodaj'),
            ),
          ],
        ),
      ),
    );
  }
}
