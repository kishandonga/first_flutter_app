import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldDemo extends StatefulWidget {
  final String title;
  const TextFormFieldDemo(this.title, {Key? key}) : super(key: key);

  @override
  State<TextFormFieldDemo> createState() => TextFormFieldDemoState();
}

class PersonData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.fieldKey,
    this.hintText = '',
    this.labelText = '',
    this.helperText = '',
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  }) : super(key: key);

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}

class TextFormFieldDemoState extends State<TextFormFieldDemo> {
  PersonData person = PersonData();

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  bool _autoValidate = false;
  bool _formWasEdited = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  void _handleSubmitted() {
    final FormState? form = _formKey.currentState;
    if (!(form?.validate() ?? false)) {
      _autoValidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form?.save();
      showInSnackBar('${person.name}\'s phone number is ${person.phoneNumber}');
    }
  }

  String? _validateName(String? value) {
    _formWasEdited = true;
    if (value?.isEmpty ?? true) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value ?? '')) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    _formWasEdited = true;
    final RegExp phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value ?? '')) {
      return '(###) ###-#### - Enter a US phone number.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    _formWasEdited = true;
    final FormFieldState<String>? passwordField =
        _passwordFieldKey.currentState;
    if (passwordField?.value == null || passwordField?.value?.isEmpty == true) {
      return 'Please enter a password.';
    }
    if (passwordField?.value != value) return 'The passwords don\'t match';
    return null;
  }

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState? form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate()) return true;

    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('This form has errors'),
              content: const Text('Really leave this form?'),
              actions: [
                ElevatedButton(
                  child: const Text('YES'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                ElevatedButton(
                  child: const Text('NO'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          onWillPop: _warnUserAboutInvalidData,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.person),
                    hintText: 'What do people call you?',
                    labelText: 'Name *',
                  ),
                  onSaved: (value) {
                    person.name = value ?? '';
                  },
                  validator: _validateName,
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.phone),
                    hintText: 'Where can we reach you?',
                    labelText: 'Phone Number *',
                    prefixText: '+1',
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    person.phoneNumber = value ?? '';
                  },
                  validator: _validatePhoneNumber,
                  // TextInputFormatters are applied in sequence.
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    // Fit the validating format.
                    _phoneNumberFormatter,
                  ],
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.email),
                    hintText: 'Your email address',
                    labelText: 'E-mail',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    person.email = value ?? '-';
                  },
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Tell us about yourself',
                    helperText: 'Keep it short, this is just a demo.',
                    labelText: 'Life story',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Salary',
                      prefixText: '\$',
                      suffixText: 'USD',
                      suffixStyle: TextStyle(color: Colors.green)),
                  maxLines: 1,
                ),
                const SizedBox(height: 24.0),
                PasswordField(
                  fieldKey: _passwordFieldKey,
                  helperText: 'No more than 8 characters.',
                  labelText: 'Password *',
                  onFieldSubmitted: (String value) {
                    setState(() {
                      person.password = value;
                    });
                  },
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  enabled: person.password.isNotEmpty,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    labelText: 'Re-type password',
                  ),
                  maxLength: 8,
                  obscureText: true,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 24.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _handleSubmitted,
                    child: const Text('SUBMIT'),
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  '* indicates required field',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Format incoming numeric text to fit the format of (###) ###-#### ##...
class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue value) {
    final int textLength = value.text.length;
    int selectionIndex = value.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer text = StringBuffer();
    if (textLength >= 1) {
      text.write('(');
      if (value.selection.end >= 1) selectionIndex++;
    }
    if (textLength >= 4) {
      text.write('${value.text.substring(0, usedSubstringIndex = 3)}) ');
      if (value.selection.end >= 3) selectionIndex += 2;
    }
    if (textLength >= 7) {
      text.write('${value.text.substring(3, usedSubstringIndex = 6)}-');
      if (value.selection.end >= 6) selectionIndex++;
    }
    if (textLength >= 11) {
      text.write('${value.text.substring(6, usedSubstringIndex = 10)} ');
      if (value.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (textLength >= usedSubstringIndex) {
      text.write(value.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: text.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
