import 'package:flutter/material.dart';
import 'package:flutter_app/utils/const.dart';
import 'package:flutter_app/views/sqlite/helper/student_bll.dart';
import 'package:flutter_app/views/sqlite/model/student_model.dart';

class UpdateStudentForm extends StatefulWidget {
  UpdateStudentForm(this.model);

  final StudentModel model;

  @override
  UpdateStudentFormState createState() {
    return new UpdateStudentFormState();
  }
}

class UpdateStudentFormState extends State<UpdateStudentForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  StudentModel studentModel = new StudentModel();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(Const.Update),
        ),
        body: new SingleChildScrollView(
            child: new Padding(
                padding: new EdgeInsets.all(16.0),
                child: new Form(
                  key: _formKey,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        initialValue: widget.model.studentName,
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
                        initialValue: widget.model.studentEdu,
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
                        initialValue: widget.model.fees.toString(),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
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
                                        studentModel.id = widget.model.id;
                                        bll.update(studentModel);

                                        Navigator.pop(context, Const.Update);
                                      }
                                    },
                                    child: new Text(Const.Update),
                                  )),
                            )
                          ]),
                    ],
                  ),
                ))));
  }
}
