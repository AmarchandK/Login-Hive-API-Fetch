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
  void login() async {
    final form = logInFormKey.currentState;
    if (form!.validate()) {
      await _refreshUsereUi();
      try {
        if (_exits(emailController.text.trim())) {
          for (UserModel model in userList) {
            if (model.email == emailController.text.trim() &&
                model.password == passController.text.trim()) {
              Get.offAll(() => Homepage(userName: model.name));
              break;
            } else {
              ErrorHandlers.showDialogue('Email and Password not Match');
            }
          }
        } else {
          ErrorHandlers.showDialogue('Account not Found, SignUP Now');
          controllerClear();
          Get.off(() => const SignUpPage());
        }
      } catch (e) {
        ErrorHandlers.showDialogue('Account not Found');
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
          Get.offAll(() => Homepage(userName: model.name));
        } catch (e) {
          ErrorHandlers.toastMessage(e.toString());
        }
      } else {
        ErrorHandlers.showDialogue('Email Already exits');
      }
    }
  }

  _exits(String email) {
    for (UserModel item in userList) {
      if (item.email == email) {
        return true;
      }
    }
    return false;
  }

  Future<void> _refreshUsereUi() async {
    List<UserModel> list = await MovieService.getAllUser();
    userList.clear();
    userList.addAll(list);
  }

  controllerClear() {
    emailController.clear();
    mobileController.clear();
    nameController.clear();
    passController.clear();
    profession = null;
  }
}
