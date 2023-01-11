import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movie_details/helpers/refactoring.dart';

class ErrorHandlers {
  static void toastMessage(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.redAccent);
  }

  static void errorHandler(Object e) {
    if (e is DioError) {
      if (e.response?.statusCode == 401) {
        toastMessage(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        toastMessage('Connection Timeout');
      } else if (e.type == DioErrorType.receiveTimeout) {
        toastMessage('Receive Timeout');
      } else if (e.type == DioErrorType.cancel) {
        toastMessage('Cancelled');
      } else if (e.type == DioErrorType.sendTimeout) {
        toastMessage('Send Timeout');
      } else if (e.type == DioErrorType.response) {
        toastMessage('No Response');
      } else if (e.error is SocketException) {
        toastMessage('No Internet Connection');
      } else if (e.type == DioErrorType.other) {
        toastMessage('Something went Wrong');
      }
    }
  }

 static SnackbarController showDialogue(tittle) {
    return Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          tittle,
          style: const TextStyle(color: redColor, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(CupertinoIcons.exclamationmark_shield),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.transparent,
        barBlur: 10,
        dismissDirection: DismissDirection.horizontal,
        overlayBlur: 1,
        margin: const EdgeInsets.all(20.0),
        animationDuration: const Duration(seconds: 2),
        snackStyle: SnackStyle.GROUNDED,
        forwardAnimationCurve: Curves.bounceInOut,
        reverseAnimationCurve: Curves.bounceOut,
        borderColor: redColor,
        borderRadius: 10,
      ),
    );
  }
}
