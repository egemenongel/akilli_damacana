import 'package:akilli_damacana/core/extension/context_extension.dart';
import 'package:akilli_damacana/features/_product/widgets/bordered_form_field.dart';
import 'package:akilli_damacana/features/_product/widgets/white_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.highValue, vertical: context.normalValue),
        child: Column(
          children: [
            const Spacer(
              flex: 92,
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
                      onPressed: () {},
                      padding: context.paddingNormal,
                    ),
                  ),
                ],
              ),
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
    );
  }
}
