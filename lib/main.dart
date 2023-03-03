import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lancemeup_workspace_ui/core/db_client.dart';
import 'app/app.dart';

void main() async {
  await DbClient.initialize();
  runApp(const ProviderScope(child: LancemeUpApp()));
}
