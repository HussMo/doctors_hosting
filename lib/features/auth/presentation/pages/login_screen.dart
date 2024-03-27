import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../widgets/dont_have_account_text.dart';
import '../widgets/terms_and_conditions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isChecked = false;
  var isObscureText = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Text(
                  'Welcome back',
                  style: TextStyles.font24BlueBold,
                ),
              ),
              verticalSpace(8),
              Center(
                child: Text('Login to your account',
                    style: TextStyles.font14GrayRegular),
              ),
              verticalSpace(60),
              Form(
                  child: Column(key: formKey, children: [
                AppTextFormField(
                  hintText: 'enter you username',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                verticalSpace(20),
                AppTextFormField(
                    isObscureText: isObscureText,
                    hintText: 'enter you password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                    }),
              ])),
              verticalSpace(20),
              Row(children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    }),
                Text('Remember me', style: TextStyles.font13GrayRegular),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot password?',
                      style: TextStyles.font13BlueRegular),
                ),
              ]),
              verticalSpace(20),
              AppTextButton(
                  buttonText: 'Login',
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {}),
              verticalSpace(40),
              Column(
                children: [
                  TermsAndConditionsText(),
                  verticalSpace(60),
                  DontHaveAccountText()
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
