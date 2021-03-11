import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_structure/bloc/login/bloc.dart';
import 'package:news_app_with_structure/data/services/flavor_config.dart';
import 'package:news_app_with_structure/utils/theme/app_theme.dart';

class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, BaseState>(
      listener: (context, state) {
        if (state is FailedState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.msg),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, BaseState>(
        builder: (context, state) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
                child: Form(
                  child: Column(
                    children: [
                      _buildHeader(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.color.titleColor,
                            fontWeight: FontWeight.bold),
                        controller: _usernameController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(EvaIcons.emailOutline,
                              color: Colors.black26),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(30.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppTheme.color.mainColor),
                              borderRadius: BorderRadius.circular(30.0)),
                          contentPadding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          labelText: "E-Mail",
                          hintStyle: TextStyle(
                              fontSize: 12.0,
                              color: AppTheme.color.grey,
                              fontWeight: FontWeight.w500),
                          labelStyle: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                        autocorrect: false,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.color.titleColor,
                            fontWeight: FontWeight.bold),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            EvaIcons.lockOutline,
                            color: Colors.black26,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(30.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppTheme.color.mainColor),
                              borderRadius: BorderRadius.circular(30.0)),
                          contentPadding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          labelText: "Password",
                          hintStyle: TextStyle(
                              fontSize: 12.0,
                              color: AppTheme.color.grey,
                              fontWeight: FontWeight.w500),
                          labelStyle: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                        autocorrect: false,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            "Forget password?",
                            style: TextStyle(
                                color: Colors.black45, fontSize: 12.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 45,
                              child: state is LoadingState
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            SizedBox(
                                              height: 25.0,
                                              width: 25.0,
                                              child:
                                                  CupertinoActivityIndicator(),
                                            )
                                          ],
                                        ))
                                      ],
                                    )
                                  : RaisedButton(
                                      color: AppTheme.color.mainColor,
                                      disabledColor: AppTheme.color.mainColor,
                                      disabledTextColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      onPressed: _onLoginButtonPressed,
                                      child: const Text(
                                        "LOG IN",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Or connect using",
                            style: TextStyle(
                                color: Colors.black26, fontSize: 12.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40.0,
                            width: 180.0,
                            child: RaisedButton(
                                color: const Color(0xFF385c8e),
                                disabledColor: AppTheme.color.mainColor,
                                disabledTextColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      EvaIcons.facebook,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "Facebook",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 180.0,
                            height: 40.0,
                            child: RaisedButton(
                                color: const Color(0xFFf14436),
                                disabledColor: AppTheme.color.mainColor,
                                disabledTextColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      EvaIcons.google,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text("Google",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: AppTheme.color.grey),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5.0),
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        color: AppTheme.color.mainColor,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )),
                      const SizedBox(
                        height: 20.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 200.0,
      padding: const EdgeInsets.only(bottom: 20.0, top: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppFlavorConfig.instance.appName,
            style: TextStyle(
              color: AppTheme.color.red,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            "AUTH WITH REST",
            style: TextStyle(
                color: AppTheme.color.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Text(
            "Login app using BLOC pattern and REST API",
            style: TextStyle(fontSize: 10.0, color: Colors.black38),
          )
        ],
      ),
    );
  }
}
