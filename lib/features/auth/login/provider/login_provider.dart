import 'package:custom_app/features/auth/login/model/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginProvider extends Notifier<LoginState> {
  @override
  LoginState build() => LoginState(isObscure: true);

  void toggleObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }
}

final loginProvider = NotifierProvider<LoginProvider, LoginState>(
  LoginProvider.new,
);
