import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../view_model/auth_view_model.dart';
import '../widgets/auth_title_widget.dart';
import '../widgets/button.dart';
import '../widgets/responsive_header.dart';
import '../widgets/text_form_field_widget.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModelProvider>(context);
    // Sending code to an email only with firebase is not possible , so I will let the logic empty
    return SafeArea(
      child: Scaffold(
        appBar: ResponsiveHeader(),
        body: ReactiveForm(
          formGroup: authProvider.loginForm,
          child: Center(
            child: Container(
              width: kIsWeb ? 432 : double.infinity,
              decoration: kIsWeb
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 2,
                              color: Colors.grey.withOpacity(.3))
                        ])
                  : const BoxDecoration(
                      color: Colors.white,
                    ),
              margin: kIsWeb ? const EdgeInsets.all(30) : EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    AuthTitle(
                      title: AppLocalizations.of(context)!.verify_account,
                      description: AppLocalizations.of(context)!
                          .recover_password_instruction,
                      showCancelIcon: true,
                    ),
                    ReactiveTextFieldWidget(
                      formGroup: authProvider.loginForm,
                      formControlName: 'recovery_code',
                      hintText: AppLocalizations.of(context)!.recovery_code,
                    ),
                    Spacer(),
                    ButtonWidget(
                      text: AppLocalizations.of(context)!.ok,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
