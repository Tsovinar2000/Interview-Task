import 'package:flutter/material.dart';
import 'package:interview_task_project/view/auth/verify_account.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../service/remote_repository/firebase_repo.dart';
import '../../view_model/auth_view_model.dart';
import '../widgets/auth_title_widget.dart';
import '../widgets/button.dart';
import '../widgets/dialogs.dart';
import '../widgets/drop_down.dart';
import '../widgets/text_form_field_widget.dart';

class SignUpDonorWidget extends StatelessWidget {
  const SignUpDonorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModelProvider>(context);
    final theme = Theme.of(context);
    return Column(
      children: [
        AuthTitle(
          title: AppLocalizations.of(context)!.sign_up_title,
          description: AppLocalizations.of(context)!.sign_up_subtitle,
        ),
        Row(
          children: [
            Expanded(
              child: ReactiveTextFieldWidget(
                formGroup: authProvider.registerForm,
                formControlName: 'name',
                hintText: AppLocalizations.of(context)!.name,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: ReactiveTextFieldWidget(
                formGroup: authProvider.registerForm,
                formControlName: 'lastName',
                hintText: AppLocalizations.of(context)!
                    .lastName, // Localized in the next section
              ),
            ),
          ],
        ),
        ReactiveTextFieldWidget(
          formGroup: authProvider.registerForm,
          formControlName: 'email',
          hintText: AppLocalizations.of(context)!.email, // Localized "Email"
        ),
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 110),
                child: ReactiveTextFieldWidget(
                  formGroup: authProvider.registerForm,
                  formControlName: 'phone',
                  cutBorderFromRight: true,
                  hintText: AppLocalizations.of(context)!.phone_number,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: 120,
              child: ReactiveDropDownWidget(
                formGroup: authProvider.registerForm,
                formControlName: 'country_code',
                cutBorderFromRight: true,
                itemAsString: (_) {
                  return _;
                },
                hintText: AppLocalizations.of(context)!.select_code,
                items: (filter, infiniteScrollProps) =>
                    ["+374", "+1", "+33", "+386"],
              ),
            ),
          ],
        ),
        ReactiveDropDownWidget(
          formGroup: authProvider.registerForm,
          formControlName: 'country',
          itemAsString: (_) {
            return _;
          },

          items: (filter, infiniteScrollProps) =>
              ["Country 1", "Country 2", "Country 3", "Country 4"],
          hintText:
              AppLocalizations.of(context)!.country, // Localized "Country"
        ),
        const SizedBox(
          height: 18,
        ),
        ReactiveDropDownWidget(
          formGroup: authProvider.registerForm,
          formControlName: 'region',
          showSearchBox: false,
          itemAsString: (_) {
            return _;
          },
          items: (filter, infiniteScrollProps) =>
              ["Region 1", "Region 2", "Region 3", "Region 4"],
          hintText: AppLocalizations.of(context)!.region_state,
        ),
        const SizedBox(
          height: 18,
        ),
        ReactiveDropDownWidget(
          formGroup: authProvider.registerForm,
          formControlName: 'cityVillage',
          itemAsString: (_) {
            return 'text';
          },
          items: (filter, infiniteScrollProps) =>
              ["City 1", "City 2", "City 3", "City 4"],
          hintText: AppLocalizations.of(context)!.city,
        ),
        const SizedBox(
          height: 18,
        ),
        ReactiveTextFieldWidget(
          formGroup: authProvider.registerForm,
          formControlName: 'password',
          hintText:
              AppLocalizations.of(context)!.password, // Localized "Password"
          showObscureText: true,
        ),
        ReactiveTextFieldWidget(
          formGroup: authProvider.registerForm,
          formControlName: 'confirmPassword',
          hintText: AppLocalizations.of(context)!.confirm_password,
          showObscureText: true,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                showLeavePageDialog(context, false);
              },
              child: SizedBox(
                width: 180,
                child: Text(
                  AppLocalizations.of(context)!.register_as_teacher,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(decoration: TextDecoration.underline),
                  maxLines: 2,
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Expanded(
              child: ButtonWidget(
                text: AppLocalizations.of(context)!.ok,
                onTap: () async {
                  authProvider.changeValidationStatus(true);
                  await authProvider.submitRegisterForm();
                  if (FirebaseService.firebaseAuth.currentUser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifyAccount(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
