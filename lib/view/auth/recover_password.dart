import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../view_model/auth_view_model.dart';
import '../widgets/auth_title_widget.dart';
import '../widgets/button.dart';
import '../widgets/text_form_field_widget.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  bool _emailIsSent = true;
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModelProvider>(context);
    final theme = Theme.of(context);

    return ReactiveForm(
      formGroup: authProvider.loginForm,
      child: Center(
        child: SizedBox(
          width: kIsWeb ? 432 : double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: _emailIsSent
                ? Column(children: [
                    AuthTitle(
                      title:
                          AppLocalizations.of(context)!.recover_password_title,
                      description: AppLocalizations.of(context)!
                          .recover_password_instruction,
                      showCancelIcon: true,
                    ),
                    ReactiveTextFieldWidget(
                      formGroup: authProvider.loginForm,
                      formControlName: 'recovery_code',
                      hintText: AppLocalizations.of(context)!.recovery_code,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        AppLocalizations.of(context)!.resend_code,
                        style: theme.textTheme.bodyMedium!
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 15,
                    ),
                    ReactiveTextFieldWidget(
                      formGroup: authProvider.loginForm,
                      formControlName: 'password',
                      hintText: AppLocalizations.of(context)!.new_password,
                      showObscureText: true,
                    ),
                    ReactiveTextFieldWidget(
                      formGroup: authProvider.loginForm,
                      formControlName: 'confirm_password',
                      hintText: AppLocalizations.of(context)!.confirm_password,
                      showObscureText: true,
                    ),
                    ButtonWidget(
                      text: AppLocalizations.of(context)!.done,
                      onTap: () {},
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: ButtonWidget(
                        text: AppLocalizations.of(context)!.remember_password,
                        whiteStyle: true,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ])
                : Column(children: [
                    AuthTitle(
                      title:
                          AppLocalizations.of(context)!.recover_password_title,
                      description: AppLocalizations.of(context)!
                          .recover_password_description,
                      showCancelIcon: true,
                    ),
                    Expanded(
                      child: ReactiveTextFieldWidget(
                        formGroup: authProvider.loginForm,
                        formControlName: 'email',
                        hintText: AppLocalizations.of(context)!.email,
                      ),
                    ),
                    Spacer(),
                    ButtonWidget(
                      text: AppLocalizations.of(context)!.send_button,
                      onTap: () {
                        setState(() {
                          _emailIsSent = true;
                        });
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ]),
          ),
        ),
      ),
    );
  }
}
