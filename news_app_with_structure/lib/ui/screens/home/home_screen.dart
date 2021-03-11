import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_structure/bloc/auth/bloc.dart';
import 'package:news_app_with_structure/utils/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.color.mainColor,
          leading: const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://filmdaily.co/wp-content/uploads/2019/12/arrow-lede-1300x733.jpg"),
            ),
          ),
          title: const Text("AUTH WITH REST"),
          actions: [
            IconButton(
                icon: const Icon(EvaIcons.logOutOutline),
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    LoggedOut(),
                  );
                })
          ],
        ),
        body: const Center(
          child: Text("Home Screen"),
        ));
  }
}
