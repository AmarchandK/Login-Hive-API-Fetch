import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_details/controller/auth_controller.dart';
import 'package:movie_details/helpers/refactoring.dart';
import 'package:movie_details/view/authentication/widgets/text_span.dart';
import 'widgets/form_fields.dart';

class SignUpPage extends GetView<AuthController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.signUpFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Fields(
                error: 'Please enter your Name',
                keybord: TextInputType.name,
                label: 'Name',
                iconData: Icons.person,
                controller: controller.nameController,
              ),
              Fields(
                error: 'Please enter a Mobile number',
                keybord: TextInputType.number,
                iconData: Icons.phone,
                label: 'Mobile',
                controller: controller.mobileController,
              ),
              Fields(
                error: 'Please enter an email',
                keybord: TextInputType.emailAddress,
                label: 'Email',
                iconData: Icons.email,
                controller: controller.emailController,
              ),
              Fields(
                error: 'Please enter a Password',
                keybord: TextInputType.number,
                label: 'Password',
                iconData: Icons.password,
                controller: controller.passController,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<AuthController>(
                  builder: (controller) => DropdownButton(
                    isExpanded: true,
                    itemHeight: 60,
                    hint: const Text('Select domain'),
                    borderRadius: BorderRadius.circular(10),
                    value: controller.profession,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: controller.items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.profession = newValue!;
                      controller.update();
                    },
                  ),
                ),
              ),
              Button(onTap: () => controller.signUp(), secondText: 'Sign UP'),
              TextspanAuth(
                  onTap: () {
                    controller.controllerClear();
                    Get.off(() => LoginPage(), transition: Transition.fadeIn);
                  },
                  firstText: 'Already have an account? ',
                  secondText: 'Login')
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Form(
        key: controller.logInFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Fields(
                  error: 'Please enter a email',
                  label: 'Email',
                  keybord: TextInputType.emailAddress,
                  iconData: Icons.email,
                  controller: controller.emailController),
              Fields(
                error: 'Please enter a Password',
                label: 'Password',
                keybord: TextInputType.number,
                iconData: Icons.password,
                controller: controller.passController,
              ),
              Button(secondText: 'Log In', onTap: () => controller.login()),
              TextspanAuth(
                  onTap: () {
                    controller.controllerClear();
                    Get.off(() => const SignUpPage(),
                        transition: Transition.fadeIn);
                  },
                  firstText: "Don't have an account? ",
                  secondText: 'Sign UP')
            ],
          ),
        ),
      ),
    );
  }
}
