import 'package:first_flutter_app/utils/const.dart';
import 'package:first_flutter_app/views/sqlite/helper/student_bll.dart';
import 'package:first_flutter_app/views/sqlite/model/student_model.dart';
import 'package:flutter/material.dart';

class UpdateStudentForm extends StatefulWidget {
  final StudentModel model;

  const UpdateStudentForm(this.model, {Key? key}) : super(key: key);

  @override
  State<UpdateStudentForm> createState() => UpdateStudentFormState();
}

class UpdateStudentFormState extends State<UpdateStudentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  StudentModel studentModel = StudentModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Const.update),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  initialValue: widget.model.studentName,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: false,
                      labelText: 'Enter student Name'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter student name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    studentModel.studentName = value ?? '';
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  initialValue: widget.model.studentEdu,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: false,
                      labelText: 'Enter student education'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter student education';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    studentModel.studentEdu = value ?? '';
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: widget.model.fees.toString(),
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: false,
                      labelText: 'Enter student fees'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter student fees';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    studentModel.fees = double.parse(value ?? '0.0');
                  },
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                        height: 35.0,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (_formKey.currentState?.validate() ?? false) {
                              _formKey.currentState?.save();

                              StudentBLL bll = StudentBLL();
                              studentModel.id = widget.model.id;
                              bll.update(studentModel);

                              Navigator.pop(context, Const.update);
                            }
                          },
                          child: const Text(Const.update),
                        )),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
