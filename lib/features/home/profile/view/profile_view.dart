import 'dart:developer';
import 'dart:io';

import 'package:akilli_damacana/core/constants/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/components/blue_elevated_button.dart';
import '../../../../core/components/bordered_form_field.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../services/rest_api_service.dart';
import '../model/profile_model.dart';

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
  final ImagePicker _picker = ImagePicker();
  File? image;

  @override
  void initState() {
    super.initState();
    profile = apiService.fetchProfile();
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
          updateInfo(userProfile);
          return SingleChildScrollView(
            child: Container(
              height: context.screenHeight,
              padding: context.paddingMedium,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: context.mediaQuery.viewPadding.bottom,
                ),
                child: buildForm(context),
              ),
              decoration: BoxDecoration(gradient: mainGradient),
            ),
          );
        });
  }

  GestureDetector buildAvatar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickImage()
            .then((value) => apiService.profilePictureEdit(image!.path));
      },
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
          backgroundImage: image != null
              ? FileImage(
                  image!,
                )
              : null,
        ),
      ),
    );
  }

  Row buildProfileButtons() {
    return Row(
      children: [
        Expanded(
            flex: 10,
            child: BlueElevatedButton(
                child: const Text("Profili D??zenle"), onPressed: () {})),
        const Spacer(),
        Expanded(
            flex: 10,
            child: BlueElevatedButton(
                child: const Text("??ifre De??i??tir"), onPressed: () {}))
      ],
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            flex: 16,
            child: buildAvatar(context),
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 6,
            child: buildProfileButtons(),
          ),
          const Spacer(
            flex: 2,
          ),
          Expanded(
              flex: 6,
              child: BorderedFormField(
                keyboardType: TextInputType.number,
                labelText: "Boy",
                textInputAction: TextInputAction.next,
                assetPath: "assets/icons/boy.svg",
                textEditingController: _heightController,
                validator: (val) => _heightController.text.isEmpty
                    ? "L??tfen bu alan?? doldurunuz."
                    : int.tryParse(_heightController.text) is! int
                        ? "L??tfen bir tamsay?? giriniz."
                        : null,
              )),
          const Spacer(),
          Expanded(
              flex: 6,
              child: BorderedFormField(
                keyboardType: TextInputType.number,
                labelText: "Kilo",
                textInputAction: TextInputAction.next,
                assetPath: "assets/icons/kg.svg",
                textEditingController: _weightController,
                validator: (val) => _weightController.text.isEmpty
                    ? "L??tfen bu alan?? doldurunuz."
                    : int.tryParse(_weightController.text) is! int
                        ? "L??tfen bir tamsay?? giriniz."
                        : null,
              )),
          const Spacer(),
          Expanded(
              flex: 6,
              child: BorderedFormField(
                keyboardType: TextInputType.number,
                labelText: "Ya??",
                textInputAction: TextInputAction.next,
                assetPath: "assets/icons/calender.svg",
                textEditingController: _ageController,
                validator: (val) => _ageController.text.isEmpty
                    ? "L??tfen bu alan?? doldurunuz."
                    : int.tryParse(_ageController.text) is! int
                        ? "L??tfen bir tamsay?? giriniz."
                        : null,
              )),
          const Spacer(),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                const Expanded(
                    flex: 7,
                    child: BorderedFormField(
                      keyboardType: TextInputType.number,
                      labelText: "T??ketilen Su (Lt)",
                      textInputAction: TextInputAction.done,
                      assetPath: "assets/icons/personal.svg",
                    )),
                const Spacer(),
                Expanded(
                    flex: 3,
                    child: BlueElevatedButton(
                      child: Row(
                        children: [
                          const Text("4.5LT"),
                          SvgPicture.asset("assets/icons/bardak.svg"),
                        ],
                      ),
                      onPressed: () {},
                    )),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(child: buildSaveButton()),
              ],
            ),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }

  BlueElevatedButton buildSaveButton() {
    return BlueElevatedButton(
        child: const Text("Kaydet"),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            UserProfile updatedProfile = UserProfile(
                height: int.parse(_heightController.text),
                weight: int.parse(_weightController.text),
                age: int.parse(_ageController.text));
            apiService
                .updateProfile(updatedProfile)
                .then((value) => setState(() {
                      profile = apiService.fetchProfile();
                    }));
          }
        });
  }

  updateInfo(UserProfile userProfile) {
    _heightController.text = "${userProfile.height}";
    _ageController.text = "${userProfile.age}";
    _weightController.text = "${userProfile.weight}";
  }

  Future _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      final imgTemp = File(pickedFile.path);
      image = imgTemp;
      setState(() {
        image = imgTemp;
      });
    } on PlatformException catch (e) {
      log("Image picker error $e");
    }
  }
}
