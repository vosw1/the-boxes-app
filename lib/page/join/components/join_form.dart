import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_boxes/_core/constants/size.dart';
import 'package:the_boxes/_core/util/validation_utils.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/store/session_store.dart';
import 'package:the_boxes/data/repository/user_repository.dart';
import 'custom_test_form_field.dart';
import 'username_field.dart';
import 'password_field.dart';
import 'submit_button.dart';

class JoinForm extends ConsumerStatefulWidget {
  @override
  _JoinFormState createState() => _JoinFormState();
}

class _JoinFormState extends ConsumerState<JoinForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyAddressController = TextEditingController();
  final _industryController = TextEditingController();
  final _positionController = TextEditingController();
  final _logisticsCenterLocationController = TextEditingController();
  final _equipmentController = TextEditingController();

  bool _isUsernameAvailable = false;
  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UsernameField(
            userRepository: _userRepository,
            onUsernameAvailable: (isAvailable) {
              setState(() {
                _isUsernameAvailable = isAvailable;
              });
            },
          ),
          PasswordField(controller: _passwordController),
          CustomTextField(
            label: "Name",
            controller: _nameController,
            validator: ValidationUtils.validateName,
          ),
          CustomTextField(
            label: "Birthdate",
            controller: _birthdateController,
            validator: ValidationUtils.validateBirthdate,
          ),
          CustomTextField(
            label: "Phone",
            controller: _phoneController,
            validator: ValidationUtils.validatePhone,
          ),
          CustomTextField(
            label: "Address",
            controller: _addressController,
            validator: ValidationUtils.validateAddress,
          ),
          CustomTextField(
            label: "Email",
            controller: _emailController,
            validator: ValidationUtils.validateEmail,
          ),
          CustomTextField(
            label: "Company Address",
            controller: _companyAddressController,
            validator: ValidationUtils.validateCompanyAddress,
          ),
          CustomTextField(
            label: "Industry",
            controller: _industryController,
            validator: ValidationUtils.validateIndustry,
          ),
          CustomTextField(
            label: "Position",
            controller: _positionController,
            validator: ValidationUtils.validatePosition,
          ),
          CustomTextField(
            label: "Logistics Center Location",
            controller: _logisticsCenterLocationController,
            validator: ValidationUtils.validateLogisticsCenterLocation,
          ),
          CustomTextField(
            label: "Equipment",
            controller: _equipmentController,
            validator: ValidationUtils.validateEquipment,
          ),
          SizedBox(height: l_gap),
          SubmitButton(
            onPressed: () async {
              if (_formKey.currentState!.validate() && _isUsernameAvailable) {
                final joinReqDTO = JoinReqDTO(
                  username: _usernameController.text.trim(),
                  password: _passwordController.text.trim(),
                  email: _emailController.text.trim(),
                );

                final store = ref.read(sessionProvider);

                if (store.isLogin) {
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
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
