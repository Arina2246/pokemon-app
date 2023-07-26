import 'package:flutter/material.dart';

import '../../../../config/colors/colors.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error,try again",
              style: TextStyle(color: primaryColor, fontSize: 20)),
        ],
      ),
    );
  }
}
