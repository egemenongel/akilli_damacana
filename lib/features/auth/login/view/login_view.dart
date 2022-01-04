import 'dart:developer';

import '../../../../core/components/bordered_form_field.dart';
import '../../../../core/components/white_elevated_button.dart';
import '../../../../core/extension/context_extension.dart';

import '../model/login_response_model.dart';

import '../../../../services/rest_api_service.dart';
import '../../../../services/shared_preferences.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: context.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffA1D2F1),
                  Color(0xffE2F2FC),
                  Color(0xff9FD1F1),
                ],
                stops: [
                  0,
                  0.3167,
                  1,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/girissonrasi.png",
                  ))),
          padding: EdgeInsets.symmetric(
              horizontal: context.highValue, vertical: context.normalValue),
          child: Form(
            child: Column(
              children: [
                const Spacer(
                  flex: 15,
                ),
                Expanded(flex: 32, child: buildLogo()),
                const Spacer(
                  flex: 50,
                ),
                Expanded(
                  flex: 15,
                  child: buildEmailField(),
                ),
                const Spacer(
                  flex: 3,
                ),
                Expanded(
                  flex: 15,
                  child: buildPasswordField(),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 15,
                  child: Row(
                    children: [
                      Expanded(
                        child: buildLoginButton(context),
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
                        child: buildRegisterButton(context),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 15,
                        child: buildForgotPasswordButton(context),
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
      ),
    );
  }

  Image buildLogo() {
    return Image.asset(
      "assets/images/girislogosu.png",
    );
  }

  BorderedFormField buildEmailField() {
    return BorderedFormField(
      keyboardType: TextInputType.visiblePassword,
      labelText: "Kullanıcı adı",
      assetPath: "assets/icons/personal.svg",
      textInputAction: TextInputAction.next,
      textEditingController: emailController,
      validator: (val) => emailController.text.isEmpty
          ? "Lütfen kullanıcı adınızı giriniz."
          : null,
    );
  }

  BorderedFormField buildPasswordField() {
    return BorderedFormField(
      keyboardType: TextInputType.visiblePassword,
      labelText: "Şifre",
      assetPath: "assets/icons/password.svg",
      textInputAction: TextInputAction.done,
      textEditingController: passwordController,
      validator: (val) =>
          passwordController.text.isEmpty ? "Lütfen şifrenizi giriniz." : null,
      isObscured: true,
    );
  }

  WhiteElevatedButton buildLoginButton(BuildContext context) {
    return WhiteElevatedButton(
      child: const Text("Giriş Yap"),
      onPressed: () async {
        var response = await widget.restApiService
            .login(emailController.text, passwordController.text);
        if (response is UserModel) {
          Navigator.pushNamed(context, "/home", arguments: response);
        } else {
          log("$response");
        }
      },
      padding: context.paddingNormal,
    );
  }

  WhiteElevatedButton buildRegisterButton(BuildContext context) {
    return WhiteElevatedButton(
      child: const Text(
        "Kayıt Ol",
      ),
      onPressed: () {},
      padding: context.paddingLow,
    );
  }

  WhiteElevatedButton buildForgotPasswordButton(BuildContext context) {
    return WhiteElevatedButton(
      child: const Text("Şifremi Unuttum"),
      onPressed: () {},
      padding: context.paddingLow,
    );
  }

  rememberMe() async {
    var token = await widget.sharedService.getToken();
    if (token != null) {
      Future(() {
        Navigator.pushNamed(
          context,
          "/home",
        );
      });
    }
  }
}
