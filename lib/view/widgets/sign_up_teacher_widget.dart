import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../view_model/auth_view_model.dart';
import '../widgets/auth_title_widget.dart';
import '../widgets/button.dart';
import '../widgets/dialogs.dart';
import '../widgets/drop_down.dart';
import '../widgets/text_form_field_widget.dart';

class SignUpTeacherWidget extends StatelessWidget {
  const SignUpTeacherWidget({super.key});

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
            SizedBox(
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
                  hintText: AppLocalizations.of(context)!
                      .phone_number, // Localized "Phone Number"
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
                items: (filter, infiniteScrollProps) =>
                    ["+374", "+1", "+33", "+386"],
                hintText: AppLocalizations.of(context)!.select_code,
                // Localized "Select Code"
              ),
            ),
          ],
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
            return _;
          },
          items: (filter, infiniteScrollProps) =>
              ["City 1", "City 2", "City 3", "City 4"],
          hintText: AppLocalizations.of(context)!.city_village,
        ),
        const SizedBox(
          height: 18,
        ),
        ReactiveDropDownWidget(
          formGroup: authProvider.registerForm,
          formControlName: 'school',
          itemAsString: (_) {
            return _;
          },
          items: (filter, infiniteScrollProps) =>
              ["School 1", "School 2", "School 3", "School 4"],
          hintText: AppLocalizations.of(context)!.school,
        ),
        const SizedBox(
          height: 18,
        ),
        ReactiveDropDownWidget(
          formGroup: authProvider.registerForm,
          formControlName: 'subject',
          isMultiSelect: true,
          itemAsString: (_) {
            return _;
          },
          items: (filter, infiniteScrollProps) =>
              ["Subject 1", "Subject 2", "Subject 3", "Subject 4"],
          hintText: AppLocalizations.of(context)!.subject,
        ),
        ReactiveDropDownWidget(
          formGroup: authProvider.registerForm,
          formControlName: 'grade',
          itemAsString: (_) {
            return _;
          },
          items: (filter, infiniteScrollProps) => ["2", "3", "4", "5"],
          hintText: AppLocalizations.of(context)!.grade,
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
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                showLeavePageDialog(context, true);
              },
              child: SizedBox(
                width: 180,
                child: Text(
                  AppLocalizations.of(context)!.register_as_donor,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(decoration: TextDecoration.underline),
                  maxLines: 2,
                ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: ButtonWidget(
                text: AppLocalizations.of(context)!.ok,
                onTap: () {
                  authProvider.changeValidationStatus(true);
                  // if (authProvider.registerForm.valid) {
                  authProvider.submitRegisterForm();
                  // }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
