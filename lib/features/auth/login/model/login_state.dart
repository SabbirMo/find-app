class LoginState {
  final bool isObscure;

  LoginState({required this.isObscure});
  LoginState copyWith({bool? isObscure}) {
    return LoginState(isObscure: isObscure ?? this.isObscure);
  }
}
