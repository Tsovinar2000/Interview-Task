import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interview_task_project/view/widgets/sign_up_donor_widget.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../view_model/auth_view_model.dart';
import '../widgets/responsive_header.dart';
import '../widgets/sign_up_teacher_widget.dart';

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
                  child: Center(
                    child: Container(
                      decoration: kIsWeb
                          ? BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      color: Colors.grey.withOpacity(.3))
                                ])
                          : BoxDecoration(),
                      margin: kIsWeb ? EdgeInsets.all(30) : EdgeInsets.zero,
                      child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: donor
                              ? SignUpDonorWidget()
                              : SignUpTeacherWidget()),
                    ),
                  ),
                ),
              ),
            )));
  }
}
