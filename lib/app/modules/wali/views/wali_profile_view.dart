import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/modules/wali/controllers/wali_controller.dart';

class WaliProfileView extends GetView<WaliController> {
  const WaliProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.setValueFormProfile();
    controller.resetFormState();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          backgroundColor: Color(ConfigColor.appBarColor1),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          children: [
            Obx(
              () => Container(
                child: TextField(
                  controller: controller.nama,
                  autocorrect: false,
                  decoration: InputDecoration(
                    label: Text('Nama'),
                    floatingLabelStyle:
                        TextStyle(color: Color(ConfigColor.appBarColor2)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? Color(ConfigColor.appBarColor2)
                            : Colors.grey.shade800),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(ConfigColor.appBarColor2),
                      ),
                    ),
                    errorText: controller.namaError.value.isEmpty
                        ? null
                        : controller.namaError.value,
                  ),
                ),
              ),
            ),
            Obx(
              () => Container(
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    label: Text('Email'),
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
                    errorText: controller.emailError.value.isEmpty
                        ? null
                        : controller.emailError.value,
                  ),
                ),
              ),
            ),
            Obx(
              () => Container(
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: controller.telp,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autocorrect: false,
                  decoration: InputDecoration(
                    label: Text('Telphone'),
                    floatingLabelStyle:
                        TextStyle(color: Color(ConfigColor.appBarColor2)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                    prefixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? Color(ConfigColor.appBarColor2)
                            : Colors.grey.shade800),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(ConfigColor.appBarColor2),
                      ),
                    ),
                    errorText: controller.telpError.value.isEmpty
                        ? null
                        : controller.telpError.value,
                  ),
                ),
              ),
            ),
            Obx(
              () => Container(
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: controller.alamat,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autocorrect: false,
                  decoration: InputDecoration(
                    label: Text('Alamat'),
                    floatingLabelStyle:
                        TextStyle(color: Color(ConfigColor.appBarColor2)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.home),
                    prefixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? Color(ConfigColor.appBarColor2)
                            : Colors.grey.shade800),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(ConfigColor.appBarColor2),
                      ),
                    ),
                    errorText: controller.alamatError.value.isEmpty
                        ? null
                        : controller.alamatError.value,
                  ),
                ),
              ),
            ),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      'Ubah Password',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                  ),
                  Container(
                    child: Text(
                      '*Jika tidak ingin merubah password, biarkan kosong',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextField(
                      controller: controller.password,
                      obscureText: controller.notShowPassword.value,
                      decoration: InputDecoration(
                        label: Text('Password'),
                        floatingLabelStyle:
                            TextStyle(color: Color(ConfigColor.appBarColor2)),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.key),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
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
                        errorText: controller.passwordError.value.isEmpty
                            ? null
                            : controller.passwordError.value,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextField(
                      controller: controller.password_confirmation,
                      obscureText: controller.notShowPasswordConfirmation.value,
                      decoration: InputDecoration(
                        label: Text('Konfirmasi Password'),
                        floatingLabelStyle:
                            TextStyle(color: Color(ConfigColor.appBarColor2)),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.key),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? Color(ConfigColor.appBarColor2)
                                : Colors.grey.shade800),
                        suffixIcon: IconButton(
                          onPressed: () =>
                              controller.notShowPasswordConfirmation.toggle(),
                          icon: controller.notShowPasswordConfirmation.value
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.visibility_off),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(ConfigColor.appBarColor2),
                          ),
                        ),
                        errorText:
                            controller.passwordConfirmationError.value.isEmpty
                                ? null
                                : controller.passwordConfirmationError.value,
                      ),
                    ),
                  )
                ],
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
                onPressed: controller.isLoadingSaveProfile.value
                    ? null
                    : () => controller.saveProfile(),
                // null,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: controller.isLoadingSaveProfile.value
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                ),
              ),
            ),
          ],
        ));
  }
}
