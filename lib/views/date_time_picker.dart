import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class _InputDropdown extends StatelessWidget {
  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;

  const _InputDropdown(
      {Key? key,
      this.labelText = '',
      this.valueText = '',
      required this.valueStyle,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(valueText, style: valueStyle),
            Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}

class _DateTimePicker extends StatelessWidget {
  const _DateTimePicker(
      {Key? key,
      this.labelText = '',
      required this.selectedDate,
      required this.selectedTime,
      required this.selectDate,
      required this.selectTime})
      : super(key: key);

  final String labelText;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> selectDate;
  final ValueChanged<TimeOfDay> selectTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectDate(picked);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime) {
      selectTime(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? valueStyle = Theme.of(context).textTheme.headline6;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: _InputDropdown(
            labelText: labelText,
            valueText: DateFormat.yMMMd().format(selectedDate),
            valueStyle: valueStyle!,
            onPressed: () {
              _selectDate(context);
            },
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          flex: 3,
          child: _InputDropdown(
            valueText: selectedTime.format(context),
            valueStyle: valueStyle,
            onPressed: () {
              _selectTime(context);
            },
          ),
        ),
      ],
    );
  }
}

class DateAndTimePickerDemo extends StatefulWidget {
  const DateAndTimePickerDemo({Key? key}) : super(key: key);

  @override
  _DateAndTimePickerDemoState createState() => _DateAndTimePickerDemoState();
}

class _DateAndTimePickerDemoState extends State<DateAndTimePickerDemo> {
  DateTime _fromDate = DateTime.now();
  TimeOfDay _fromTime = const TimeOfDay(hour: 7, minute: 28);
  DateTime _toDate = DateTime.now();
  TimeOfDay _toTime = const TimeOfDay(hour: 7, minute: 28);
  final List<String> _allActivities = <String>[
    'hiking',
    'swimming',
    'boating',
    'fishing'
  ];
  String _activity = 'fishing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date and time pickers')),
      body: DropdownButtonHideUnderline(
        child: SafeArea(
          top: false,
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              TextField(
                enabled: true,
                decoration: const InputDecoration(
                  labelText: 'Event name',
                  border: OutlineInputBorder(),
                ),
                style: Theme.of(context).textTheme.headline4,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 20.0),
              ),
              _DateTimePicker(
                labelText: 'From',
                selectedDate: _fromDate,
                selectedTime: _fromTime,
                selectDate: (DateTime date) {
                  setState(() {
                    _fromDate = date;
                  });
                },
                selectTime: (TimeOfDay time) {
                  setState(() {
                    _fromTime = time;
                  });
                },
              ),
              _DateTimePicker(
                labelText: 'To',
                selectedDate: _toDate,
                selectedTime: _toTime,
                selectDate: (DateTime date) {
                  setState(() {
                    _toDate = date;
                  });
                },
                selectTime: (TimeOfDay time) {
                  setState(() {
                    _toTime = time;
                  });
                },
              ),
              InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Activity',
                  hintText: 'Choose an activity',
                ),
                child: DropdownButton<String>(
                  value: _activity,
                  isDense: true,
                  onChanged: (value) {
                    setState(() {
                      _activity = value ?? '';
                    });
                  },
                  items: _allActivities.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
