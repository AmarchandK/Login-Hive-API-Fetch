import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_details/controller/home_controller.dart';
import 'package:movie_details/helpers/refactoring.dart';
import 'package:movie_details/view/authentication/auth_pag.dart';
import 'widgets/product_tile.dart';

class Homepage extends GetView<HomeController> {
  const Homepage({required this.userName, super.key});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${greeting()}  $userName"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => LoginPage());
          
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        return controller.isLoading.value
            ? const Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                  color: Colors.green,
                ),
              )
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Products(
                    index: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(),
                  );
                },
                itemCount: controller.data.length,
              );
      }),
    );
  }
}
