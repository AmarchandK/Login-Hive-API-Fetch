import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../controller/home_controller.dart';
import '../view/authentication/widgets/text_span.dart';

const Color darkGreen = Color.fromARGB(255, 78, 110, 88);
const Color redColor = Color.fromARGB(255, 250, 108, 108);
const Color wColor = Color.fromARGB(255, 255, 255, 255);
const Color bColor = Colors.black;
const Color greyColor = Color.fromARGB(255, 99, 96, 96);
const Color lightGreen = Color.fromARGB(255, 158, 227, 125);
const String url = 'https://hoblist.com/api/movieList';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.onTap,
    required this.secondText,
  }) : super(key: key);
  final void Function()? onTap;
  final String secondText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 100,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: bColor),
        child: TextspanAuth(onTap: null, firstText: '', secondText: secondText),
      ),
    );
  }
}

height(context) {
  return MediaQuery.of(context).size.height;
}

width(context) {
  return MediaQuery.of(context).size.width;
}

const SizedBox h5 = SizedBox(height: 5);
const SizedBox w10 = SizedBox(width: 10);
 controllerInit() {
    Get.put(AuthController());
    Get.put(HomeController());
  }
  String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}