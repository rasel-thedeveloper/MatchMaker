
import 'package:flutter/material.dart';

class UserInfoForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;
  const UserInfoForm({required this.onSubmit, super.key});

  @override
  _UserInfoFormState createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String role = 'Player';
  String status = '';
  String subscription = 'Basic';

  final Map<String, List<String>> statusOptions = {
    'Player': ['Independent', 'Amateur', 'Professional', 'High-Level'],
    'Club': ['Amateur', 'Professional'],
    'Manager': ['Manager', 'Not a Manager'],
  };

  @override
  Widget build(BuildContext context) {
    List<String> currentStatusOptions = statusOptions[role]!;

    return Scaffold(
      appBar: AppBar(title: const Text('Complete Your Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'First Name'),
                onChanged: (value) => firstName = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last Name'),
                onChanged: (value) => lastName = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              DropdownButtonFormField<String>(
                value: role,
                items: ['Player', 'Manager', 'Club']
                    .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    role = value!;
                    status = '';
                  });
                },
                decoration: const InputDecoration(labelText: 'Role'),
              ),
              DropdownButtonFormField<String>(
                value: status.isEmpty ? null : status,
                items: currentStatusOptions
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (value) => setState(() => status = value!),
                decoration: const InputDecoration(labelText: 'Status'),
              ),
              DropdownButtonFormField<String>(
                value: subscription,
                items: ['Basic', 'Standard', 'Premium']
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (value) => setState(() => subscription = value!),
                decoration: const InputDecoration(labelText: 'Subscription Plan'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && status.isNotEmpty) {
                    widget.onSubmit({
                      'firstName': firstName,
                      'lastName': lastName,
                      'role': role,
                      'status': status,
                      'subscription': subscription,
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
