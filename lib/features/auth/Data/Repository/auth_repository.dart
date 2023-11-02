import 'package:flutter/material.dart';
import 'package:letshop/constants/constants.dart';
import 'package:letshop/constants/error_handling.dart';
import 'package:letshop/constants/utils.dart';
import 'package:letshop/features/auth/Data/Models/user.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Future<void> signUpUser(
      {required String email,
      // required BuildContext context,
      required String password,
      required String name}) async {
    final dio = Dio();
    try {
      User user = User(
          name: name,
          email: email,
          id: "",
          password: password,
          address: '',
          type: '',
          token: '');

      Response response =
          await dio.post("${ServerUrl.server}/api/signup", data: user.toJson());

      // dioErrorHandle(
      //     response: response,
      //     context: context,
      //     onSuccess: () {
      //       showSnackBar(context, "Account Created");
      //     });
    } catch (e) {
      throw e;
      //showSnackBar(context, e.toString());
    }
  }
}
