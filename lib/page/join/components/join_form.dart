import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_boxes/components/custom_auth_text_form_field.dart';
import 'package:the_boxes/components/custom_elavated_button.dart';
import 'package:the_boxes/_core/util/validation_utils.dart';
import 'package:the_boxes/_core/constants/size.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/store/session_store.dart';
import 'package:the_boxes/data/repository/user_repository.dart';

class JoinForm extends ConsumerStatefulWidget {
  @override
  _JoinFormState createState() => _JoinFormState();
}

class _JoinFormState extends ConsumerState<JoinForm> {
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

  bool _isUsernameAvailable = false;
  String? _usernameError;
  final UserRepository _userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
    _username.addListener(_checkUsername);
  }

  Future<void> _checkUsername() async {
    if (_username.text.isEmpty) {
      setState(() {
        _usernameError = null;
      });
      return;
    }

    final requestDTO = DuplimentEmailCheckDTO(username: _username.text.trim());
    final responseDTO = await _userRepository.fetchUsernameSameCheck(
        requestDTO);

    setState(() {
      _isUsernameAvailable = responseDTO.body;
      _usernameError =
      _isUsernameAvailable ? null : 'Username is already taken';
    });
  }

  @override
  Widget build(BuildContext context) {
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
          if (_usernameError != null)
            Text(
              _usernameError!,
              style: TextStyle(color: Colors.red),
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
              if (_formKey.currentState!.validate() && _isUsernameAvailable) {
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
                String logisticsCenterLocation = _logisticsCenterLocation.text
                    .trim();
                String equipment = _equipment.text.trim();

                // 가입 요청 로직 추가
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

                JoinReqDTO joinReqDTO = JoinReqDTO(
                  username: username,
                  password: password,
                  email: email,
                );

                final store = ref.read(sessionProvider);

                if (store.isLogin) {
                  // 가입 성공 시 홈 페이지로 이동
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
                  // 가입 실패 시 에러 메시지 표시
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