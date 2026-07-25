import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/exceptions/wrong_coupon_exception.dart';

class ErrorMapper {
  static String mapError(dynamic error) {
    print(error);
    if (error is DioException) {
      return _mapErrorByDioException(error);
    } else if(error is WrongCouponException){
      return 'Invalid promo code';
    }
    return 'An unexpected error occurred';
  }

  static String _mapErrorByDioException(DioException error) {
    if(error.response?.data is String && error.response?.statusCode != 400){
      return 'An unexpected error occurred';
    }
    if(error.response?.statusCode == 500){
      return 'Server error';
    }
    if(error.response?.data is String && error.response?.statusCode == 400){
      return 'Invalid or expired code';
    }
    if(error.response?.statusCode == 422){
      print(error.response);
      if (error.response?.data['error'] != null) {
        return error.response?.data['error'];
      }
      return error.response?.data['message'];
    }
    if(error.response?.statusCode == 401){
      return 'Unauthorized';
    }
    if (error.response?.data['message'] != null) {
      return error.response?.data['message'];
    }
    if(error.response?.statusCode == 400){
      return 'Bad request';
    }
    return 'An unexpected error occurred';
  }
}
