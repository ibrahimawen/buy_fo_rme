import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    fetchProducts();
  }

  Future<List<dynamic>> fetchProducts() async {
    // emit(HomeLoading());
    final response =
        await http.get(Uri.parse("http://192.168.3.104:5000/getproducts"));

    if (response.statusCode == 200) {
      // emit(HomeSuccess());
      print(response.statusCode);
      return jsonDecode(response.body);
    } else {
      // emit(HomeFail());
      throw Exception('Failed to load products');
    }
  }
}
