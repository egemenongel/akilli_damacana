import 'package:akilli_damacana/core/components/blue_elevated_button.dart';
import 'package:akilli_damacana/core/components/bordered_form_field.dart';
import 'package:akilli_damacana/core/extension/context_extension.dart';

import 'package:akilli_damacana/features/home/profile/model/profile_model.dart';
import 'package:akilli_damacana/services/rest_api_service.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final apiService = RestApiService();
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  late final Future profile;
  @override
  void initState() {
    super.initState();
    profile = apiService.fetchProfile();
  }

  updateInfo(UserProfile userProfile) {
    _heightController.text = "${userProfile.height}";
    _ageController.text = "${userProfile.age}";
    _weightController.text = "${userProfile.weight}";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: profile,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }

          var model = snapshot.data as ProfileInfoModel;
          UserProfile userProfile = model.data!.user!;
          _heightController.text = "${userProfile.height}";
          _ageController.text = "${userProfile.age}";
          _weightController.text = "${userProfile.weight}";
          return SingleChildScrollView(
            child: Container(
              height: context.screenHeight,
              padding: context.paddingMedium,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: context.mediaQuery.viewPadding.bottom,
                ),
                child: Form(
                  key: _formKey,
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
                                    child: const Text("Şifre Değiştir"),
                                    onPressed: () {}))
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      Expanded(
                          flex: 4,
                          child: BorderedFormField(
                            keyboardType: TextInputType.number,
                            labelText: "Boy",
                            textInputAction: TextInputAction.next,
                            assetPath: "assets/icons/boy.svg",
                            textEditingController: _heightController,
                            validator: (val) => _heightController.text.isEmpty
                                ? "Lütfen bu alanı doldurunuz."
                                : int.tryParse(_heightController.text) is! int
                                    ? "Lütfen bir tamsayı giriniz."
                                    : null,
                          )),
                      const Spacer(),
                      Expanded(
                          flex: 4,
                          child: BorderedFormField(
                            keyboardType: TextInputType.number,
                            labelText: "Kilo",
                            textInputAction: TextInputAction.next,
                            assetPath: "assets/icons/kg.svg",
                            textEditingController: _weightController,
                            validator: (val) => _weightController.text.isEmpty
                                ? "Lütfen bu alanı doldurunuz."
                                : int.tryParse(_weightController.text) is! int
                                    ? "Lütfen bir tamsayı giriniz."
                                    : null,
                          )),
                      const Spacer(),
                      Expanded(
                          flex: 4,
                          child: BorderedFormField(
                            keyboardType: TextInputType.number,
                            labelText: "Yaş",
                            textInputAction: TextInputAction.next,
                            assetPath: "assets/icons/calender.svg",
                            textEditingController: _ageController,
                            validator: (val) => _ageController.text.isEmpty
                                ? "Lütfen bu alanı doldurunuz."
                                : int.tryParse(_ageController.text) is! int
                                    ? "Lütfen bir tamsayı giriniz."
                                    : null,
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
                            Expanded(
                                flex: 2, child: TextFormField() /*Dropdown*/),
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
                                    child: const Text("Kaydet"),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        UserProfile updatedProfile =
                                            UserProfile(
                                                height: int.parse(
                                                    _heightController.text),
                                                weight: int.parse(
                                                    _weightController.text),
                                                age: int.parse(
                                                    _ageController.text));
                                        apiService
                                            .updateProfile(updatedProfile)
                                            .then((value) => setState(() {
                                                  profile =
                                                      apiService.fetchProfile();
                                                }));
                                      }
                                    })),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 6,
                      ),
                    ],
                  ),
                ),
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
            ),
          );
        });
  }
}
