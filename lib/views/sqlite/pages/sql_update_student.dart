import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/views/sqlite/helper/student_bll.dart';
import 'package:flutter_app/views/sqlite/model/student_model.dart';

class UpdateStudentForm extends StatefulWidget {
  UpdateStudentForm(this.model);

  final StudentModel model;

  @override
  UpdateStudentFormState createState() {
    return UpdateStudentFormState();
  }
}

class UpdateStudentFormState extends State<UpdateStudentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  StudentModel studentModel = StudentModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Const.Update),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        initialValue: widget.model.studentName,
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            filled: false,
                            labelText: 'Enter student Name'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter student name';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          studentModel.studentName = value;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        initialValue: widget.model.studentEdu,
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            filled: false,
                            labelText: 'Enter student education'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter student education';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          studentModel.studentEdu = value;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: widget.model.fees.toString(),
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            filled: false,
                            labelText: 'Enter student fees'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter student fees';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          studentModel.fees = double.parse(value);
                        },
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: SizedBox(
                                  height: 35.0,
                                  child: RaisedButton(
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    onPressed: () async {
                                      // Validate will return true if the form is valid, or false if
                                      // the form is invalid.
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();

                                        StudentBLL bll = StudentBLL();
                                        studentModel.id = widget.model.id;
                                        bll.update(studentModel);

                                        Navigator.pop(context, Const.Update);
                                      }
                                    },
                                    child: Text(Const.Update),
                                  )),
                            )
                          ]),
                    ],
                  ),
                ))));
  }
}
