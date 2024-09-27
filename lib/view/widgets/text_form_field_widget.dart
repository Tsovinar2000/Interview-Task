import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReactiveTextFieldWidget extends StatefulWidget {
  final String formControlName;
  final String? labelText;
  final String? hintText;
  final bool? showObscureText;
  final bool? cutBorderFromRight;
  final FormGroup formGroup;
  const ReactiveTextFieldWidget({
    super.key,
    required this.formControlName,
    this.labelText,
    this.hintText,
    this.cutBorderFromRight,
    required this.formGroup,
    this.showObscureText = false,
  });

  @override
  State<ReactiveTextFieldWidget> createState() =>
      _ReactiveTextFieldWidgetState();
}

class _ReactiveTextFieldWidgetState extends State<ReactiveTextFieldWidget> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    bool validationCheck =
        widget.formGroup.control(widget.formControlName).invalid &&
            widget.formGroup.control('validate').value == true;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ReactiveTextField(
        formControlName: widget.formControlName,
        style: theme.textTheme.bodyMedium,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          contentPadding: EdgeInsets.all(4).copyWith(left: 15),
          enabledBorder: OutlineInputBorder(
              borderRadius: widget.cutBorderFromRight == true
                  ? const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))
                  : const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: validationCheck
                    ? Colors.red
                    : HexColor('#194866').withOpacity(0.8),
                width: .5,
              )),
          border: OutlineInputBorder(
              borderRadius: widget.cutBorderFromRight == true
                  ? const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))
                  : const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: validationCheck
                    ? Colors.red
                    : HexColor('#194866').withOpacity(0.8),
                width: .5,
              )),
          errorStyle:
              const TextStyle(height: 0, color: Colors.black, fontSize: 0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: validationCheck
              ? Text(
                  widget.formGroup
                          .control(widget.formControlName)
                          .errors
                          .keys
                          .contains(ValidationMessage.required)
                      ? AppLocalizations.of(context)!
                          .field_is_required(widget.hintText!)
                      : 'The email value must be a valid email',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: Colors.red, fontSize: 15),
                )
              : null,
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: validationCheck ? Colors.red : HexColor('#194866'),
                width: .5,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: validationCheck ? Colors.red : HexColor('#194866'),
                width: .5,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: validationCheck ? Colors.red : HexColor('#194866'),
                width: .5,
              )),
          hintText: widget.hintText,
          suffixIcon: widget.showObscureText == true
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_sharp
                        : Icons.visibility_off_sharp,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : const SizedBox(),
        ),
        autofocus: false,
      ),
    );
  }
}
