// search_widget.dart
// Widget to display a single search result

import 'package:flutter/material.dart';

class SearchItemWidget extends StatelessWidget {
  final String result;

  const SearchItemWidget({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(result.startsWith("#") ? Icons.tag : Icons.person),
      title: Text(result),
      onTap: () {
        // In real app: open search result page
      },
    );
  }
}
