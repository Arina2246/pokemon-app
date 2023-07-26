import 'package:flutter/material.dart';

import '../../../../config/colors/colors.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No pokemons",
              style: TextStyle(color: primaryColor, fontSize: 20)),
        ],
      ),
    );
  }
}
