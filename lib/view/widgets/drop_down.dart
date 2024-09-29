import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReactiveDropDownWidget<T> extends StatelessWidget {
  final String formControlName;
  final String? labelText;
  final String? hintText;
  final bool? cutBorderFromRight;
  final bool? cutBurderFromLeft;
  final FormGroup formGroup;
  final DropdownSearchOnFind<T>? items;
  final String Function(T) itemAsString;
  final bool isMultiSelect;
  final bool showSearchBox;

  const ReactiveDropDownWidget({
    super.key,
    required this.formControlName,
    this.labelText,
    this.hintText,
    this.cutBorderFromRight,
    this.cutBurderFromLeft,
    required this.formGroup,
    required this.items,
    required this.itemAsString,
    this.isMultiSelect = false,
    this.showSearchBox = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    bool validationCheck = formGroup.control(formControlName).invalid &&
        formGroup.control('validate').value == true;

    return isMultiSelect
        ? _buildMultiSelectDropDown(theme, validationCheck, context,
            formGroup.control(formControlName) as AbstractControl<List<T>>)
        : _buildSingleSelectDropDown(theme, validationCheck, context);
  }

  Widget _buildSingleSelectDropDown(
      ThemeData theme, bool validationCheck, BuildContext context) {
    return ReactiveValueListenableBuilder<T>(
      formControlName: formControlName,
      builder: (context, control, child) {
        return DropdownSearch<T>(
          mode: Mode.form,
          popupProps: PopupProps.menu(
            showSearchBox: showSearchBox,
            constraints: const BoxConstraints(maxHeight: 200),
            menuProps: MenuProps(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              margin: const EdgeInsets.only(top: 5),
            ),
            searchFieldProps: TextFieldProps(
              style: theme.textTheme.bodyMedium,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          items: items,
          itemAsString: itemAsString,
          selectedItem: control.value,
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(
              labelText: labelText,
              contentPadding: const EdgeInsets.all(3).copyWith(
                right: 7,
                left: 15,
              ),
              fillColor: Colors.white,
              hintText: hintText,
              hintMaxLines: 1,
              hintStyle: const TextStyle(height: 2.5),
              errorStyle:
                  const TextStyle(height: 0, color: Colors.black, fontSize: 0),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: validationCheck
                  ? Text(
                      formGroup
                              .control(formControlName)
                              .errors
                              .keys
                              .contains(ValidationMessage.required)
                          ? AppLocalizations.of(context)!
                              .field_is_required(hintText!)
                          : 'Invalid selection',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.red, fontSize: 15),
                    )
                  : null,
              enabledBorder: _outlineInputBorder(theme, validationCheck),
              border: _outlineInputBorder(theme, validationCheck),
              focusedBorder: _outlineInputBorder(theme, validationCheck),
              errorBorder: _outlineInputBorder(theme, validationCheck),
              focusedErrorBorder: _outlineInputBorder(theme, validationCheck),
            ),
          ),
          onChanged: (T? newValue) {
            control.value = newValue;
          },
        );
      },
    );
  }

  Widget _buildMultiSelectDropDown(ThemeData theme, bool validationCheck,
      BuildContext context, AbstractControl<List<T>> control) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ReactiveValueListenableBuilder<List<T>>(
        formControlName: formControlName,
        builder: (context, control, child) {
          return DropdownSearch<T>.multiSelection(
            mode: Mode.form,

            popupProps: PopupPropsMultiSelection.menu(
              showSearchBox: true,
              checkBoxBuilder: (context, item, isDisabled, isSelected) =>
                  Checkbox(
                value: isSelected,
                checkColor: Colors.white,
                activeColor: theme.primaryColor,
                side: const BorderSide(width: .7),
                onChanged: (_) {},
              ),
              constraints: const BoxConstraints(maxHeight: 250),
              menuProps: MenuProps(
                backgroundColor: Colors.white,
                color: theme.primaryColor,
                margin: const EdgeInsets.only(top: 5),
                borderRadius: BorderRadius.circular(10),
              ),
              searchFieldProps: TextFieldProps(
                style: theme.textTheme.bodyMedium,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            items: items, // No casting is required
            itemAsString: itemAsString,
            selectedItems: control.value ?? [],
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                labelText: labelText,
                contentPadding: const EdgeInsets.all(3).copyWith(
                  right: 7,
                  left: 15,
                  top:(control.value?.length ?? 0) > 2? 20:5
                ),
                
                hintText: hintText,
                hintMaxLines: 1,
                hintStyle: const TextStyle(height: 2.5),
                errorStyle: const TextStyle(
                    height: 0, color: Colors.black, fontSize: 0),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: validationCheck
                    ? Text(
                        formGroup
                                .control(formControlName)
                                .errors
                                .keys
                                .contains(ValidationMessage.required)
                            ? AppLocalizations.of(context)!
                                .field_is_required(hintText!)
                            : 'Invalid selection',
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: Colors.red, fontSize: 15),
                      )
                    : null,
                enabledBorder: _outlineInputBorder(theme, validationCheck),
                border: _outlineInputBorder(theme, validationCheck),
                focusedBorder: _outlineInputBorder(theme, validationCheck),
                errorBorder: _outlineInputBorder(theme, validationCheck),
                focusedErrorBorder: _outlineInputBorder(theme, validationCheck),
              ),
            ),
            onChanged: (List<T> selectedValues) {
              control.value = selectedValues;
            },
          );
        },
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder(
      ThemeData theme, bool validationCheck) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: validationCheck
            ? Colors.red.withOpacity(.6)
            : HexColor('#194866').withOpacity(.5),
        width: .5,
      ),
      borderRadius: cutBorderFromRight == true
          ? const BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
          : cutBurderFromLeft == true
              ? const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))
              : const BorderRadius.all(Radius.circular(10)),
    );
  }
}
