import 'package:flutter/material.dart';
import 'package:loka_test/search/domain/models/drinks_model.dart';

import 'data_widget.dart';

class DrinkScreen extends StatefulWidget {
  final DrinkModel drink;
  const DrinkScreen({Key? key, required this.drink}) : super(key: key);

  @override
  State<DrinkScreen> createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.drink.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataWidget(title: 'Glass', value: widget.drink.glass),
            DataWidget(title: 'Category', value: widget.drink.category),
            DataWidget(title: 'Preparation', value: widget.drink.preparation!),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text(
                "Ingredients",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(
              child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: widget.drink.ingredients.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(
                            top: 5, ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.drink.ingredients[index].ingredient!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18,),
                            ),


                          ],
                        ));
                  }
              ),
            )
          ],
        )
      ),
    );
  }
}
