import 'package:flutter/material.dart';
import 'package:roslib/roslib.dart';
import 'package:tiago_web_view/model/app_state.dart';

class StateContainer extends StatefulWidget {
  // You must pass through a child.
  final Widget child;

  StateContainer({@required this.child});

  static StateContainerState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
        .data;
  }

  @override
  StateContainerState createState() => new StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  AppState appState;

  @override
  void initState() {
    this.appState = AppState.fromDefault();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }

  void initRosNode(String rosUrl) {
    debugPrint(rosUrl);
    Ros node = Ros(url: rosUrl);
    debugPrint(node.url);
    node.connect();

    if (mounted) {
      setState(() {
        this.appState.node = node;
      });
    }
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
