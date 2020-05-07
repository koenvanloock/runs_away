import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:runs_away/authentication_service.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController nameController;
  TextEditingController passwordController;
  User user;

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
  }

  login(BuildContext scaffoldHoldingContext) {
    AuthenticationService.getInstance()
        .login(nameController.text, passwordController.text)
        .then((value) => setState(() {
              print(value.firstname);
              user = value;
              Navigator.popAndPushNamed(context, '/');
            }))
        .catchError((error){
          print(error);
          return Scaffold.of(scaffoldHoldingContext)
            .showSnackBar(SnackBar(content: Text('Somethind went wrong')));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Builder(builder: (BuildContext innerContext) {
          return Container(
              padding: EdgeInsets.only(left: 5, top: 3),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'name'),
                    controller: nameController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'password'),
                    controller: passwordController,
                  ),
                  FlatButton(
                      child: Row(children: [Icon(Icons.send), Text('Login')]),
                      onPressed: () => login(innerContext))
                ],
              ));
        }));
  }
}
