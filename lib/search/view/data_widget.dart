import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  final String title;
  final String value;
  const DataWidget({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              value,
               textAlign: TextAlign.justify,
               style: const TextStyle(
                fontSize: 16, ),
            ),
          )
        ],
      )
    );
  }
}
