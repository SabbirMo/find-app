import 'dart:developer';
import 'dart:ui';

import 'package:custom_app/core/assets/app_assets.dart';
import 'package:custom_app/core/widget/custom_button.dart';
import 'package:custom_app/features/auth/login/provider/login_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final loginNotifier = ref.read(loginProvider.notifier);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.city,
            fit: BoxFit.cover,
            height: double.infinity,
          ),

          Center(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16.w,
                    left: 16.w,
                    right: 16.w,
                    bottom: 10.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                label: Text('Enter your email'),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextFormField(
                              decoration: InputDecoration(
                                label: Text('Enter your password'),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    loginNotifier.toggleObscure();
                                  },
                                  icon: Icon(
                                    loginState.isObscure
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                  ),
                                ),
                              ),
                              obscureText: loginState.isObscure,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  overlayColor: Colors.transparent,
                                ),
                                onPressed: () {
                                  log('Forgot Password?');
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: Theme.of(context).textTheme.labelMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            CustomButton(text: 'Sign In', onPressed: () {}),

                            SizedBox(height: 16.h),

                            RichText(
                              text: TextSpan(
                                text: 'Don\'t have an account? ',
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
