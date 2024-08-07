import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_boxes/components/custom_auth_text_form_field.dart';
import 'package:the_boxes/components/custom_elavated_button.dart';
import 'package:the_boxes/_core/util/validation_utils.dart';
import 'package:the_boxes/_core/constants/size.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/store/session_store.dart';

class JoinForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _birthdate = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _email = TextEditingController();
  final _companyAddress = TextEditingController();
  final _industry = TextEditingController();
  final _position = TextEditingController();
  final _logisticsCenterLocation = TextEditingController();
  final _equipment = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            text: "Username",
            obscureText: false,
            funValidator: ValidationUtils.validateUsername,
            controller: _username,
          ),
          const SizedBox(height: m_gap),
          CustomAuthTextFormField(
            text: "Password",
            obscureText: true,
            funValidator: ValidationUtils.validatePassword,
            controller: _password,
          ),
          const SizedBox(height: m_gap),
          CustomAuthTextFormField(
            text: "Name",
            obscureText: false,
            funValidator: ValidationUtils.validateName,
            controller: _name,
          ),
          const SizedBox(height: m_gap),
          CustomAuthTextFormField(
            text: "Birthdate",
            obscureText: false,
            funValidator: ValidationUtils.validateBirthdate,
            controller: _birthdate,
          ),
          const SizedBox(height: m_gap),
          CustomAuthTextFormField(
            text: "Phone",
            obscureText: false,
            funValidator: ValidationUtils.validatePhone,
            controller: _phone,
          ),
          const SizedBox(height: m_gap),
          CustomAuthTextFormField(
            text: "Address",
            obscureText: false,
            funValidator: ValidationUtils.validateAddress,
            controller: _address,
          ),
          const SizedBox(height: m_gap),
          CustomAuthTextFormField(
            text: "Email",
            obscureText: false,
            funValidator: ValidationUtils.validateEmail,
            controller: _email,
          ),
          const SizedBox(height: m_gap),
          CustomAuthTextFormField(
            text: "Company Address",
            obscureText: false,
            funValidator: ValidationUtils.validateCompanyAddress,
            controller: _companyAddress,
          ),
          const SizedBox(height: m_gap),
          CustomAuthTextFormField(
            text: "Industry",
            obscureText: false,
            funValidator: ValidationUtils.validateIndustry,
            controller: _industry,
          ),
          const SizedBox(height: m_gap),
          CustomAuthTextFormField(
            text: "Position",
            obscureText: false,
            funValidator: ValidationUtils.validatePosition,
            controller: _position,
          ),
          const SizedBox(height: m_gap),
          CustomAuthTextFormField(
            text: "Logistics Center Location",
            obscureText: false,
            funValidator: ValidationUtils.validateLogisticsCenterLocation,
            controller: _logisticsCenterLocation,
          ),
          const SizedBox(height: m_gap),
          CustomAuthTextFormField(
            text: "Equipment",
            obscureText: false,
            funValidator: ValidationUtils.validateEquipment,
            controller: _equipment,
          ),
          const SizedBox(height: l_gap),
          CustomElevatedButton(
            text: "회원가입",
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                String username = _username.text.trim();
                String password = _password.text.trim();
                String name = _name.text.trim();
                String birthdate = _birthdate.text.trim();
                String phone = _phone.text.trim();
                String address = _address.text.trim();
                String email = _email.text.trim();
                String companyAddress = _companyAddress.text.trim();
                String industry = _industry.text.trim();
                String position = _position.text.trim();
                String logisticsCenterLocation = _logisticsCenterLocation.text.trim();
                String equipment = _equipment.text.trim();

                // 여기에 가입 요청 로직 추가
                // 예: API 호출, 데이터베이스 저장 등
                print('Username: $username');
                print('Password: $password');
                print('Name: $name');
                print('Birthdate: $birthdate');
                print('Phone: $phone');
                print('Address: $address');
                print('Email: $email');
                print('Company Address: $companyAddress');
                print('Industry: $industry');
                print('Position: $position');
                print('Logistics Center Location: $logisticsCenterLocation');
                print('Equipment: $equipment');

                // 예를 들어:
                JoinReqDTO joinReqDTO = JoinReqDTO(
                  username: username,
                  password: password,
                  email: email,
                );

                // 로그인 메서드 호출
                SessionStore store = ref.read(sessionProvider);
                await store.join(joinReqDTO);
                store.join(joinReqDTO);

                // 로그인 요청 DTO 생성
                if (store.isJoin) {
                  print('join form 회원가입 성공');
                  // 로그인 성공 시 Home 페이지로 이동
                  Navigator.of(context).pushReplacementNamed('/home'); // Navigate to HomePage
                } else {
                  // 로그인 실패 시 에러 메시지 표시
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('회원가입 실패. 다시 시도해 주세요.')),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
