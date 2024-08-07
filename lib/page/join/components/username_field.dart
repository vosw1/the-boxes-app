import 'dart:async';
import 'package:flutter/material.dart';
import 'package:the_boxes/_core/util/validation_utils.dart';
import 'package:the_boxes/components/custom_auth_text_form_field.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/repository/user_repository.dart';

class UsernameField extends StatefulWidget {
  final UserRepository userRepository;
  final ValueChanged<bool> onUsernameAvailable;

  UsernameField({
    required this.userRepository,
    required this.onUsernameAvailable,
  });

  @override
  _UsernameFieldState createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  final _usernameController = TextEditingController();
  bool _isUsernameAvailable = false;
  String? _usernameError;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_onUsernameChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _usernameController.dispose();
    super.dispose();
  }

  void _onUsernameChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), _checkUsername);
  }

  Future<void> _checkUsername() async {
    final username = _usernameController.text.trim();
    if (username.isEmpty) {
      setState(() {
        _usernameError = null;
        _isUsernameAvailable = true;
      });
      widget.onUsernameAvailable(true);
      return;
    }

    final requestDTO = DuplimentEmailCheckDTO(username: username);
    try {
      final responseDTO = await widget.userRepository.fetchUsernameSameCheck(requestDTO);
      final isAvailable = responseDTO.body == false;

      setState(() {
        _isUsernameAvailable = isAvailable;
        _usernameError = isAvailable ? null : 'Username is already taken';
      });
      widget.onUsernameAvailable(isAvailable);
    } catch (e) {
      setState(() {
        _usernameError = 'Server error: Username check failed';
      });
      widget.onUsernameAvailable(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthTextFormField(
          text: "Username",
          obscureText: false,
          funValidator: ValidationUtils.validateUsername,
          controller: _usernameController,
        ),
        if (_usernameError != null)
          Text(
            _usernameError!,
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
