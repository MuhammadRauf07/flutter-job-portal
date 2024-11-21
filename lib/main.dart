import 'package:flutter/material.dart';
import 'package:flutter_job_portal/app.dart';
import 'package:flutter_job_portal/provider/tab_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TabProvider()),
    ],
    child: const AppContent(),
  ));
}
