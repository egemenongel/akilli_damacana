import 'package:akilli_damacana/core/extension/context_extension.dart';
import 'package:akilli_damacana/features/_product/widgets/blue_elevated_button.dart';
import 'package:akilli_damacana/features/_product/widgets/bordered_form_field.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingMedium,
      child: Column(
        children: [
          Expanded(
              flex: 16,
              child: Container(
                padding: context.paddingLow,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: context.colors.primary,
                    )),
                child: CircleAvatar(
                  radius: context.highValue,
                  child: Icon(
                    Icons.camera_alt,
                    color: context.colors.primary,
                    size: context.mediumValue,
                  ),
                ),
              )),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                    flex: 10,
                    child: BlueElevatedButton(
                        child: const Text("Profili Düzenle"),
                        onPressed: () {})),
                const Spacer(),
                Expanded(
                    flex: 10,
                    child: BlueElevatedButton(
                        child: const Text("Şifre Değiştir"), onPressed: () {}))
              ],
            ),
          ),
          const Spacer(
            flex: 4,
          ),
          const Expanded(
              flex: 4,
              child: BorderedFormField(
                keyboardType: TextInputType.number,
                labelText: "Boy",
                textInputAction: TextInputAction.next,
                assetPath: "assets/icons/boy.svg",
              )),
          const Spacer(),
          const Expanded(
              flex: 4,
              child: BorderedFormField(
                keyboardType: TextInputType.number,
                labelText: "Kilo",
                textInputAction: TextInputAction.next,
                assetPath: "assets/icons/kg.svg",
              )),
          const Spacer(),
          const Expanded(
              flex: 4,
              child: BorderedFormField(
                keyboardType: TextInputType.number,
                labelText: "Yaş",
                textInputAction: TextInputAction.next,
                assetPath: "assets/icons/calender.svg",
              )),
          const Spacer(),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                const Expanded(
                    flex: 8,
                    child: BorderedFormField(
                      keyboardType: TextInputType.number,
                      labelText: "Tüketilen Su (Lt)",
                      textInputAction: TextInputAction.next,
                      assetPath: "assets/icons/personal.svg",
                    )),
                const Spacer(),
                Expanded(flex: 2, child: TextFormField() /*Dropdown*/),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                    child: BlueElevatedButton(
                        child: const Text("Kaydet"), onPressed: () {})),
              ],
            ),
          ),
          const Spacer(
            flex: 6,
          ),
        ],
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff118BBF),
              Color(0xff05B4FF),
            ],
            stops: [
              0,
              0.6325,
            ]),
      ),
    );
  }
}
