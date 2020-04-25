import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Form',
          ),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: MyFlutterForm(),
      ),
    );
  }
}

class MyFlutterForm extends StatefulWidget {
  @override
  _MyFlutterFormState createState() => _MyFlutterFormState();
}

class _MyFlutterFormState extends State<MyFlutterForm> {
  //Global Key here
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode;
  final myController = TextEditingController();

  //create the focus node
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
    myController.addListener(getSecondName);
  }

  //dispose the focus node
  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(right: 20.0, left: 20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'First Name',
                    ),
                    keyboardType: TextInputType.text,
                    focusNode: focusNode,
                    validator: (String value){
                      return value.isEmpty ? 'Name cannot be empty' :null;
                    },
                    onChanged: (text) => print(text),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Second Name'),
                    keyboardType: TextInputType.text,
                    validator: (String value){
                      return value.isEmpty ? 'Name cannot be empty' : null ;
                    },
                    controller: myController,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (String value){
                return value.isEmpty ? 'Email cannot be empty' : null ;
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
                labelText: 'Phone Number',
                prefixText: '+234',
              ),
              keyboardType: TextInputType.phone,
              validator: (String value){
                return value.isEmpty ?'Number caanot be empty' :null;
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  border: OutlineInputBorder(),
                  labelText: 'Password'),
              keyboardType: TextInputType.visiblePassword,
              validator: (String value) {
                return value.length < 8
                    ? 'Password must be more than 8 characters'
                    : null;
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password'),
//              keyboardType: TextInputType.visiblePassword,
              validator: (String value) {
                return value.length < 8
                    ? 'Password must be more than 8 characters'
                    : null;
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            ButtonTheme(
              minWidth: double.infinity,
              height: 36.0,
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Form Validated, No errors'),
                    ));
                  }
                focusNode.requestFocus();
                },
                textColor: Colors.white,
                elevation: 2.0,
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getSecondName() => print('Second name is ${myController.text}');
}
