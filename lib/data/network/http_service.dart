import 'dart:convert';
<<<<<<< Updated upstream
import 'package:covid_fl/data/models/response_model/add_model_response.dart';
import 'package:covid_fl/data/models/response_model/brand_response.dart';
import 'package:covid_fl/data/models/response_model/category_response.dart';
import 'package:covid_fl/data/models/response_model/login_response.dart';
import 'package:covid_fl/data/models/response_model/models_response.dart';
import 'package:covid_fl/data/models/response_model/order_response.dart';
import 'package:covid_fl/data/models/response_model/update_response.dart';
import 'package:covid_fl/data/network/network_properties.dart';
import 'package:covid_fl/utils/url_constants.dart';
=======
import 'package:phone_tech_london/data/models/response_model/brand_response.dart';
import 'package:phone_tech_london/data/models/response_model/category_response.dart';
import 'package:phone_tech_london/data/models/response_model/login_response.dart';
import 'package:phone_tech_london/data/models/response_model/models_response.dart';
import 'package:phone_tech_london/data/models/response_model/order_response.dart';
import 'package:phone_tech_london/data/models/response_model/update_response.dart';
import 'package:phone_tech_london/data/network/network_properties.dart';
import 'package:phone_tech_london/utils/url_constants.dart';
>>>>>>> Stashed changes
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../utils/url_constants.dart';
import '../models/response_model/brand_response.dart';
import '../models/response_model/category_response.dart';
import '../models/response_model/login_response.dart';
import '../models/response_model/models_response.dart';
import '../models/response_model/order_response.dart';
import '../models/response_model/update_response.dart';
import 'network_properties.dart';

class HttpService {
  HttpService._();

  static Future<LoginResponse> login(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.login),
        body: body);
    final value = LoginResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<CategoryResponse> fetchCategories(
      Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchCategory),
        body: body);
    final value = CategoryResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<BrandResponse> fetchBrands(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchBrands),
        body: body);
    final value = BrandResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<ModelsResponse> fetchModels(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchModels),
        body: body);
    final value = ModelsResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<OrdersResponse> fetchOrders(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.fetchOrders),
        body: body);
    final value = OrdersResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<UpdateResponse> editServices(Map<String, dynamic> body) async {
<<<<<<< Updated upstream
=======
    print(NetworkProperties.baseUrl + UrlConstants.editServices);
    print(body);
>>>>>>> Stashed changes
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.editServices),
        body: body);
    final value = UpdateResponse.fromJson(jsonDecode(_result.body));
    return value;
  }

  static Future<AddModelResponse> addModel(Map<String, dynamic> body) async {
    Response _result = await http.post(
        Uri.parse(NetworkProperties.baseUrl + UrlConstants.addModel),
        body: body);
    final value = AddModelResponse.fromJson(jsonDecode(_result.body));
    return value;
  }
}
