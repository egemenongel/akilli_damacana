import 'dart:developer';

import 'package:akilli_damacana/core/components/bordered_form_field.dart';
import 'package:akilli_damacana/core/components/white_elevated_button.dart';
import 'package:akilli_damacana/core/extension/context_extension.dart';

import 'package:akilli_damacana/features/auth/login/model/login_response_model.dart';

import 'package:akilli_damacana/services/rest_api_service.dart';
import 'package:akilli_damacana/services/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);
  final sharedService = SharedPreferencesService();
  final restApiService = RestApiService();
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? token;
  @override
  void initState() {
    super.initState();
    rememberMe();
  }

  rememberMe() async {
    var token = await widget.sharedService.getToken();
    if (token != null) {
      Future(() {
        Navigator.pushReplacementNamed(
          context,
          "/home",
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = context.mediaQuery.viewInsets.bottom != 0;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.highValue, vertical: context.normalValue),
        child: Form(
          child: Column(
            children: [
              isKeyboardOpen == false
                  ? const Spacer(
                      flex: 92,
                    )
                  : const Spacer(
                      flex: 42,
                    ),
              Expanded(
                flex: 15,
                child: BorderedFormField(
                  keyboardType: TextInputType.visiblePassword,
                  labelText: "Kullanıcı adı",
                  assetPath: "assets/icons/personal.svg",
                  textInputAction: TextInputAction.done,
                  textEditingController: emailController,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Expanded(
                flex: 15,
                child: BorderedFormField(
                  keyboardType: TextInputType.visiblePassword,
                  labelText: "Şifre",
                  assetPath: "assets/icons/password.svg",
                  textInputAction: TextInputAction.done,
                  textEditingController: passwordController,
                  isObscured: true,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 15,
                child: Row(
                  children: [
                    Expanded(
                      child: WhiteElevatedButton(
                        child: const Text("Giriş Yap"),
                        onPressed: () async {
                          var response = await widget.restApiService.login(
                              emailController.text, passwordController.text);
                          if (response is UserModel) {
                            Navigator.pushNamed(context, "/home",
                                arguments: response);
                          } else {
                            log("$response");
                          }
                        },
                        padding: context.paddingNormal,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 9,
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: WhiteElevatedButton(
                        child: const Text(
                          "Kayıt Ol",
                        ),
                        onPressed: () {},
                        padding: context.paddingLow,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 15,
                      child: WhiteElevatedButton(
                        child: const Text("Şifremi Unuttum"),
                        onPressed: () {},
                        padding: context.paddingLow,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
