import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // EMAIL
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // PASSWORD
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // BUTTON LOGIN
            Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        controller.isLoading.value ? null : controller.login,
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Login"),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
