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
  
  @override
  //Global Key here

  Widget build(BuildContext context) {

  final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
          child: Container(
        padding: EdgeInsets.only(right:20.0,left:20.0),
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
                    border: OutlineInputBorder(
                    ),
                prefixIcon: Icon(Icons.person),
                labelText: 'First Name',
                  ),
              keyboardType: TextInputType.text,
                ),
              ),
              
            SizedBox(width: 5.0,),

              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Second Name'
                  ),
              keyboardType: TextInputType.text,
                ),
              ),
            ],
              ),         
            SizedBox(height: 30.0,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                labelText: 'Email'
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 30.0,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
                labelText: 'Phome Number',
                prefixText: '+234',
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 30.0,),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
                border: OutlineInputBorder(),
                labelText: 'Password'
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 30.0,),
             TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
                border: OutlineInputBorder(),
                labelText: 'Confirm Password'
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: (String value){
                return int.parse(value) < 8 ? 'Password must be more than 8 characters' : null ;
              },
            ),
            SizedBox(height: 30.0,),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.filter_center_focus),
                border: OutlineInputBorder(),
                labelText: 'Request Focus',
              ),
            ),
            SizedBox(height: 30.0,),
            ButtonTheme(
              minWidth: double.infinity,
              height: 36.0,
                        child: RaisedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){
                  }
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Form Validated, No errors'),)
                  );
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
}
