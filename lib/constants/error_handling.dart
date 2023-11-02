import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:letshop/constants/utils.dart';

void dioErrorHandle({
  required dio.Response<dynamic> response, // Use dynamic type for the response
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      if (response.data != null) {
        final Map<String, dynamic> responseData = response.data;
        final String errorMsg = responseData['msg'] ?? 'Unknown error';
        showSnackBar(context, errorMsg);
      } else {
        showSnackBar(context, 'Unknown error');
      }
      break;
    default:
      showSnackBar(context, 'An error occurred');
  }
}
