// Eng Mouaz M. Al-Shahmeh
 
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/home/home.dart';
import 'package:flutter_application_2/screens/widgets/input_textfield_decoration.dart';
import 'package:flutter_application_2/screens/widgets/loading.dart';
import 'package:flutter_application_2/services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // textfield state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('تسجيل مستخدم جديد'),
              actions: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    widget.toggleView();
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.brown[100],
                  ),
                  label: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: Colors.brown[100],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 50.5,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration('البريد الالكتروني'),
                      validator: (val) =>
                          val!.isEmpty ? 'ادخل بريد الكتروني' : null,
                      textDirection: TextDirection.ltr,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration('كلمة المرور'),
                      validator: (val) =>
                          val!.length < 8 ? 'ادخل كلمة مرور بطول ٨+ حرف' : null,
                      textDirection: TextDirection.ltr,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.pink[400],
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error =
                                  'الرجاء ادخال بريد الكتروني صالح وكلمة مرور صحيحة';
                              loading = false;
                            });
                          } else {
                            print(result);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'تسجيل مستخدم جديد',
                          style: TextStyle(color: Colors.brown[100]),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
