import 'package:flutter/material.dart';
import 'package:meal_monkey/core/utils/constatns.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// TODO: Implement CustomSearchBar
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding32),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10)),
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('Search', style: TextStyle(color: Colors.grey)),
            )
          ],
        ),
      ),
    );
  }
}
