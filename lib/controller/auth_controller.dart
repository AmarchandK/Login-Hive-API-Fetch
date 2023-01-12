import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_details/helpers/error_handling.dart';
import 'package:movie_details/service/service.dart';
import 'package:movie_details/view/authentication/auth_pag.dart';
import '../model/hive_model.dart';
import '../view/home/home.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  String? profession;
  List<String> items = [
    'Flutter Developer',
    'Android Developer',
    'iOS Developer',
    'MERN Stack Developer',
    'DJANGO Developer'
  ];
  List<UserModel> userList = [];

  Future<void> login() async {
    final form = logInFormKey.currentState;
    if (form!.validate()) {
      await _refreshUsereUi();
      try {
        UserModel? model = _exitsModel(emailController.text.trim());
        if (model != null) {
          if (model.password == passController.text.trim()) {
            Get.offAll(() => Homepage(userName: model.name));
            controllerClear();
          } else {
            ErrorHandlers.showDialogue('Email and Password not match');
          }
        } else {
          ErrorHandlers.showDialogue('Account not found');
          controllerClear();
          Get.off(() => const SignUpPage());
        }
      } catch (e) {
        ErrorHandlers.showDialogue('Somthing went wrong');
      }
    }
  }

  Future<void> signUp() async {
    await _refreshUsereUi();
    final form = signUpFormKey.currentState;
    if (form!.validate()) {
      UserModel model = UserModel(
          id: DateTime.now().millisecondsSinceEpoch,
          name: nameController.text.trim(),
          password: passController.text.trim(),
          profession: profession?.trim() ?? 'Not Added',
          email: emailController.text.trim(),
          mobile: mobileController.text.trim());
      if (!_exits(model.email)) {
        try {
          await MovieService.userAdd(model);
          controllerClear();
          Get.offAll(() => Homepage(userName: model.name));
        } catch (e) {
          ErrorHandlers.toastMessage(e.toString());
        }
      } else {
        ErrorHandlers.showDialogue('Email Already exits');
        controllerClear();
        Get.offAll(() => LoginPage());
      }
    }
  }

  bool _exits(String email) {
    for (UserModel item in userList) {
      if (item.email == email) {
        return true;
      }
    }
    return false;
  }

  UserModel? _exitsModel(String email) {
    for (UserModel item in userList) {
      if (item.email == email) {
        return item;
      }
    }
    return null;
  }

  Future<void> _refreshUsereUi() async {
    List<UserModel> list = await MovieService.getAllUser();
    userList.clear();
    userList.addAll(list);
  }

  void controllerClear() {
    emailController.clear();
    mobileController.clear();
    nameController.clear();
    passController.clear();
    profession = null;
  }
}
