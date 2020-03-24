import 'package:flutter/material.dart';
import 'package:tiago_web_view/model/app_state.dart';
import 'package:tiago_web_view/model/state_container.dart';
import 'package:tiago_web_view/pages/init_ros_form.dart';
import 'package:tiago_web_view/pages/loading_screen.dart';

class InitRosScreen extends StatefulWidget {
  InitRosScreen({Key key}) : super(key: key);

  @override
  _InitRosScreenState createState() => _InitRosScreenState();
}

class _InitRosScreenState extends State<InitRosScreen> {
  bool loading;

  @override
  void initState() {
    loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tiago Web View"),
      ),
      body: _getPageToDisplay(context),
    );
  }

  Widget _getPageToDisplay(BuildContext context) {
    final container = StateContainer.of(context);
    AppState state = container.appState;

    if (loading) {
      return LoadingScreen();
    } else if (state.node == null) {
      return InitRosForm();
    } else {
      return LoadingScreen();
    }
  }
}
