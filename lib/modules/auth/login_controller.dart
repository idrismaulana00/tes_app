import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/api_service.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  final api = ApiService();

  void login() async {
    try {
      isLoading.value = true;

      final response = await api.login(
        email: emailController.text,
        password: passwordController.text,
      );

      isLoading.value = false;

      if (response != null && response['token'] != null) {
        Get.snackbar("Success", "Login berhasil");

        // pindah ke halaman employee
        Get.offAllNamed('/employees');
      } else {
        Get.snackbar("Error", "Login gagal");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
