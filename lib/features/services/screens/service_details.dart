// lib/screens/service_detail_screen.dart
import 'package:flutter/material.dart';

import '../model/services_model.dart';

class ServiceDetailScreen extends StatelessWidget {
  final ServiceModel service;

  ServiceDetailScreen({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(service.name!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(service.description!),
            SizedBox(height: 16),
            Text('Price: \$${service.price?.toStringAsFixed(2)}'),
            SizedBox(height: 16),
            Text('Duration: ${service.days}'),
          ],
        ),
      ),
    );
  }
}
