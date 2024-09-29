import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:interview_task_project/view/auth/sign_up.dart';
import 'package:interview_task_project/view/widgets/auth_title_widget.dart';
import 'package:interview_task_project/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import for localization

import '../widgets/button.dart';
import '../widgets/text_form_field_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModelProvider>(context);
    final theme = Theme.of(context);
    return ReactiveForm(
      formGroup: authProvider.loginForm,
      child: Center(
        child: Container(
          decoration: kIsWeb
              ? BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 2,
                          color: Colors.grey.withOpacity(.3))
                    ])
              : BoxDecoration(),
          margin: kIsWeb ? EdgeInsets.all(30) : EdgeInsets.zero,
          width: kIsWeb ? 432 : double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                // Localize the 'Sign In' and 'Welcome Back!'
                AuthTitle(
                  title: AppLocalizations.of(context)!
                      .sign_in, // Localized Sign In
                  description: AppLocalizations.of(context)!
                      .welcome_back, // Localized Welcome Back
                ),
                // Localize the email and password fields
                ReactiveTextFieldWidget(
                  formGroup: authProvider.loginForm,
                  formControlName: 'email',
                  hintText:
                      AppLocalizations.of(context)!.email, // Localized Email
                ),
                ReactiveTextFieldWidget(
                  formGroup: authProvider.loginForm,
                  formControlName: 'password',
                  hintText: AppLocalizations.of(context)!
                      .password, // Localized Password
                  showObscureText: true,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    AppLocalizations.of(context)!
                        .forgot_password, // Localized Forgot Password
                    style: theme.textTheme.bodyMedium!
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(height: 18),
                // Localize the Sign In button text
                ButtonWidget(
                  text: AppLocalizations.of(context)!
                      .sign_in, // Localized Sign In
                  onTap: () {
                    authProvider.changeValidationStatus(true);
                    if (authProvider.registerForm.valid) {}
                  },
                ),
                const SizedBox(height: 18),
                const Divider(),
                const Spacer(),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.register_as,
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: HexColor('#194866'),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        text: AppLocalizations.of(context)!.teachers,
                        whiteStyle: true,
                        onTap: () {
                          authProvider.changeValidationStatus(false);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage(
                                      donor: false,
                                    )),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: ButtonWidget(
                        text: AppLocalizations.of(context)!.donors,
                        whiteStyle: true,
                        onTap: () {
                          authProvider.changeValidationStatus(false);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage(
                                      donor: true,
                                    )),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
