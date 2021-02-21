import 'package:flutter/material.dart';
import 'package:news_app_with_structure/utils/theme/app_theme.dart';

class AppIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              valueColor:
                  new AlwaysStoppedAnimation<Color>(AppTheme.color.mainColor),
              strokeWidth: 4.0,
            ),
          )
        ],
      ),
    );
  }
}
