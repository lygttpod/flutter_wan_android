import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  final LoginLogic logic = Get.put(LoginLogic());

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("登录"),
        ),
        body: _buildLoginWidget());
  }

  Widget _buildLoginWidget() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          _buildInput("帐号", "请输入账号", Icons.person, _userNameController),
          _buildInput("密码", "请输入密码", Icons.lock, _passWordController),
          _buildRegister(),
          _buildConfirm()
        ],
      ),
    );
  }

  Widget _buildInput(String labelText, String hintText, IconData icon,
      TextEditingController controller) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 20, right: 50, top: 10, bottom: 5),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: _buildInputDecoration(labelText, hintText, icon),
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      String labelText, String hintText, IconData icon) {
    return InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(10)),
        hintText: hintText,
        icon: Icon(icon),
        labelText: labelText);
  }

  Widget _buildRegister() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(right: 50),
      alignment: Alignment.centerRight,
      child: Text("没有账号？去注册>"),
    );
  }

  Widget _buildConfirm() {
    return Container(
      width: 200,
      child: ElevatedButton(onPressed: () => doLogin(), child: Text("登录")),
    );
  }

  doLogin() {
    var userName = _userNameController.text.trim();
    var passWord = _passWordController.text.trim();
    if (userName == null || userName.isEmpty) {
    } else if (passWord == null || passWord.isEmpty) {
    } else {
      logic.login(userName, passWord);
    }
  }
}
