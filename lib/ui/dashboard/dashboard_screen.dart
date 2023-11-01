import 'package:flutter/material.dart';
import 'package:blockrx/base/base_bloc.dart';
import 'package:blockrx/base/base_stateful_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends BaseState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BlockRX"),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Logged in"),
        ),
      ),
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    return null;
  }
}
