import 'package:flutter/material.dart';

class DropdownFormExample extends StatefulWidget {
  @override
  _DropdownFormExampleState createState() => _DropdownFormExampleState();
}

class _DropdownFormExampleState extends State<DropdownFormExample> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = 'Option 1'; // Default value or null if no default
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Form Example'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: _selectedOption,
                decoration: InputDecoration(
                  labelText: 'Choose an Option',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue;
                  });
                },
                items: <String>['Option 1', 'Option 2', 'Option 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process data or provide further navigation
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing ${_selectedOption}'))
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}


