import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/views/sqlite/helper/student_bll.dart';
import 'package:flutter_app/views/sqlite/model/student_model.dart';

class InsertData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomPadding: false, body: StudentForm());
  }
}

class StudentForm extends StatefulWidget {
  @override
  StudentFormState createState() {
    return StudentFormState();
  }
}

class StudentFormState extends State<StudentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  StudentModel studentModel = StudentModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: null,
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
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                                    int id = await bll.getCount() + 1;
                                    studentModel.id = id;
                                    bll.insertStudent(studentModel);

                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text('Data inserted')));
                                  }
                                },
                                child: Text(Const.Insert),
                              )),
                        )
                      ]),
                ],
              ),
            )));
  }
}
