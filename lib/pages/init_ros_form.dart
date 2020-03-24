import 'package:flutter/material.dart';
import 'package:tiago_web_view/model/state_container.dart';
import 'package:validators/validators.dart';

class InitRosForm extends StatefulWidget {
  InitRosForm({Key key}) : super(key: key);

  @override
  _InitRosFormState createState() => _InitRosFormState();
}

class _InitRosFormState extends State<InitRosForm> {
  TextEditingController rosUrlController = TextEditingController();
  String errorText;

  @override
  Widget build(BuildContext context) {
    final stateContainer = StateContainer.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: TextField(
                  controller: rosUrlController,
                  decoration: InputDecoration(
                    errorText: errorText != null ? errorText : null,
                    labelText: "ROS Master URL",
                  ))),
          RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              if (validateRosUrl(rosUrlController.text)) {
                stateContainer.initRosNode(rosUrlController.text);
                setState(() {
                  errorText = null;
                });
              } else {
                setState(() {
                  errorText = "Please enter a valid URL!";
                });
              }
            },
          ),
        ],
      ),
    );
  }

  bool validateRosUrl(String url) {
    if (url != null || url.isNotEmpty || isURL(url)) {
      return true;
    } else {
      return false;
    }
  }
}
