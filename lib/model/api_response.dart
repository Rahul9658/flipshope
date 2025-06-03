import 'package:flutter/material.dart';
class ApiResponse<T>{
   final bool status;
  final T data;
  final String message;

  ApiResponse({
    required this.status,
    required this.data,
    required this.message

  });

}