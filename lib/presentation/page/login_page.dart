import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_lundry_app_learning/presentation/page/search_page.dart';

import '../../config/session.dart';
import '../../data/source/source_user.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final passWord = TextEditingController();
  final userName = TextEditingController();

  login(var contex) async {
    debugPrint("loginCome");
    var user = await SourceUser.login(userName.text, passWord.text);
    if (user == null) {
      DInfo.toastError("Failed");
    } else {
      Session.saveUser(user);
      DInfo.dialogSuccess(contex, "Success Login");
      DInfo.closeDialog(contex, actionAfterClose: () {
        Get.off(() => const HomePage());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DInput(
            controller: userName,
            hint: "UserName",
          ),
          DView.spaceHeight(),
          DInput(
            controller: passWord,
            hint: "PassWord",
          ),
          DView.spaceHeight(),
          ElevatedButton(
              onPressed: () {
                login(context);
              },
              child: Text("Login")),
          OutlinedButton(
              onPressed: () {
                Get.to(const SearchPage());
              },
              child: const Text("Login as Customer"))
        ],
      ),
    );
  }
}
