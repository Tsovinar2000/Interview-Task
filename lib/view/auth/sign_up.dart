import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interview_task_project/view/widgets/sign_up_donor_widget.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../view_model/auth_view_model.dart';
import '../widgets/auth_title_widget.dart';
import '../widgets/button.dart';
import '../widgets/dialogs.dart';
import '../widgets/drop_down.dart';
import '../widgets/responsive_header.dart';
import '../widgets/sign_up_teacher_widget.dart';
import '../widgets/text_form_field_widget.dart';

class SignUpPage extends StatelessWidget {
  final bool donor;
  const SignUpPage({super.key, required this.donor});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModelProvider>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: ResponsiveHeader(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Center(
          child: SizedBox(
            width: kIsWeb ? 432 : double.infinity,
            child: ReactiveForm(
              formGroup: authProvider.registerForm,
              child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: donor ? SignUpDonorWidget() : SignUpTeacherWidget()),
            ),
          ),
        ),
      ),
    );
  }
}
