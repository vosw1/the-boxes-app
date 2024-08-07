import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ValidationUtils {
  // 사용자 이름 유효성 검사
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 4 || value.length > 50) {
      return 'Username must be between 4 and 50 characters';
    }
    return null;
  }

  // 비밀번호 유효성 검사
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6 || value.length > 20) {
      return 'Password must be between 6 and 20 characters';
    }
    return null;
  }

  // 이름 유효성 검사
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  // 이메일 유효성 검사
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // 전화번호 유효성 검사
  static String? validatePhone(String? value) {
    if (value != null && value.isNotEmpty && value.length > 15) {
      return 'Phone number cannot exceed 15 characters';
    }
    return null;
  }

  // 주소 유효성 검사
  static String? validateAddress(String? value) {
    if (value != null && value.isNotEmpty && value.length > 255) {
      return 'Address cannot exceed 255 characters';
    }
    return null;
  }

  // 회사 주소 유효성 검사
  static String? validateCompanyAddress(String? value) {
    if (value != null && value.isNotEmpty && value.length > 255) {
      return 'Company address cannot exceed 255 characters';
    }
    return null;
  }

  // 업종 유효성 검사
  static String? validateIndustry(String? value) {
    if (value != null && value.isNotEmpty && value.length > 50) {
      return 'Industry cannot exceed 50 characters';
    }
    return null;
  }

  // 직책 유효성 검사
  static String? validatePosition(String? value) {
    if (value != null && value.isNotEmpty && value.length > 50) {
      return 'Position cannot exceed 50 characters';
    }
    return null;
  }

  // 물류 센터 위치 유효성 검사
  static String? validateLogisticsCenterLocation(String? value) {
    if (value != null && value.isNotEmpty && value.length > 100) {
      return 'Logistics center location cannot exceed 100 characters';
    }
    return null;
  }

  // 보유 장비 유효성 검사
  static String? validateEquipment(String? value) {
    if (value != null && value.isNotEmpty && value.length > 100) {
      return 'Equipment details cannot exceed 100 characters';
    }
    return null;
  }

  // 생년월일 유효성 검사
  static String? validateBirthdate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Birthdate is required';
    }
    try {
      final date = DateFormat('yyyy-MM-dd').parseStrict(value);
      final now = DateTime.now();
      if (date.isAfter(now)) {
        return 'Birthdate cannot be in the future';
      }
      final eighteenYearsAgo = now.subtract(Duration(days: 18 * 365));
      if (date.isAfter(eighteenYearsAgo)) {
        return 'You must be at least 18 years old';
      }
    } catch (e) {
      return 'Enter a valid birthdate (yyyy-MM-dd)';
    }
    return null;
  }
}
