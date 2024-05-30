// lib/screens/maintenance_request_screen.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MaintenanceRequestScreen extends StatefulWidget {
  @override
  _MaintenanceRequestScreenState createState() =>
      _MaintenanceRequestScreenState();
}

class _MaintenanceRequestScreenState extends State<MaintenanceRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _modelController = TextEditingController();
  final _descriptionController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إرسال طلبات الصيانة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'إدخال الأسم كامل'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'إدخل الرقم كامل'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال الرقم';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _modelController,
                decoration: InputDecoration(labelText: 'نوع التلفون'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال نوع التلفون';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                maxLines: 10,
                decoration: InputDecoration(labelText: 'وصف للمشكلة'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال وصف للمشكلة';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _image == null
                  ? Text('لايوجد صورة مختارة.')
                  : Image.file(File(_image!.path)),
              Row(
                children: [
                  TextButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    child: Text('إلتقاط صورة'),
                  ),
                  TextButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    child: Text('إختر صورة من المعرض'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit request
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Submitting Request')),
                    );
                  }
                },
                child: Text('إرسال الطلب '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
