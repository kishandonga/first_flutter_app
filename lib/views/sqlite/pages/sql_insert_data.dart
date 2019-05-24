import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/views/sqlite/helper/student_bll.dart';
import 'package:flutter_app/views/sqlite/model/student_model.dart';

class InsertData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false, body: new StudentForm());
  }
}

class StudentForm extends StatefulWidget {

  @override
  StudentFormState createState() {
    return new StudentFormState();
  }
}

class StudentFormState extends State<StudentForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  StudentModel studentModel = new StudentModel();

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
        child: new Padding(
            padding: new EdgeInsets.all(16.0),
            child: new Form(
              key: _formKey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: null,
                    decoration: new InputDecoration(
                        border: const UnderlineInputBorder(),
                        filled: false,
                        labelText: 'Enter student Name'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter student name';
                      }
                    },
                    onSaved: (String value) {
                      studentModel.studentName = value;
                    },
                  ),
                  new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        border: const UnderlineInputBorder(),
                        filled: false,
                        labelText: 'Enter student education'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter student education';
                      }
                    },
                    onSaved: (String value) {
                      studentModel.studentEdu = value;
                    },
                  ),
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        border: const UnderlineInputBorder(),
                        filled: false,
                        labelText: 'Enter student fees'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter student fees';
                      }
                    },
                    onSaved: (String value) {
                      studentModel.fees = double.parse(value);
                    },
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: new SizedBox(
                              height: 35.0,
                              child: new RaisedButton(
                                color: Colors.blue,
                                textColor: Colors.white,
                                onPressed: () async {
                                  // Validate will return true if the form is valid, or false if
                                  // the form is invalid.
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();

                                    StudentBLL bll = new StudentBLL();
                                    int id = await bll.getCount() + 1;
                                    studentModel.id = id;
                                    bll.insertStudent(studentModel);

                                    Scaffold.of(context).showSnackBar(
                                        new SnackBar(
                                            content:
                                                new Text('Data inserted')));
                                  }
                                },
                                child: new Text(Const.Insert),
                              )),
                        )
                      ]),
                ],
              ),
            )));
  }
}
