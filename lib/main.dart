import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/services/world_time.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => WorldTime(),
    child: const MaterialApp(
      home: Loading(),
    ),
  ));
}
