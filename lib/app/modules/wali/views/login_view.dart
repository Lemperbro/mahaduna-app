import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/modules/wali/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: SvgPicture.asset(
                  'assets/icons/login.svg',
                  width: 280,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: controller.emailOrTelpC,
                autocorrect: false,
                decoration: InputDecoration(
                  label: Text('Email Atau Nomor Telphone'),
                  floatingLabelStyle:
                      TextStyle(color: Color(ConfigColor.appBarColor2)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                      states.contains(MaterialState.focused)
                          ? Color(ConfigColor.appBarColor2)
                          : Colors.grey.shade800),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(ConfigColor.appBarColor2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Obx(
                () => TextField(
                  controller: controller.passwordC,
                  obscureText: controller.notShowPassword.value,
                  decoration: InputDecoration(
                    label: Text('Password'),
                    floatingLabelStyle:
                        TextStyle(color: Color(ConfigColor.appBarColor2)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.key),
                    prefixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? Color(ConfigColor.appBarColor2)
                            : Colors.grey.shade800),
                    suffixIcon: IconButton(
                      onPressed: () => controller.notShowPassword.toggle(),
                      icon: controller.notShowPassword.value
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.visibility_off),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(ConfigColor.appBarColor2),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Obx(
                () => ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(Get.width, 50)),
                    backgroundColor: MaterialStatePropertyAll(
                      Color(ConfigColor.appBarColor1),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: controller.isLoadingLogin.value
                      ? null
                      : () => controller.login(controller.emailOrTelpC.text,
                          controller.passwordC.text),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: controller.isLoadingLogin.value
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            'Masuk',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}
