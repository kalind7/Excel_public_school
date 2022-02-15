import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/ui_pages/forgot_password.dart';
import 'package:new_project_work/widgets/elevated_button.dart';
import 'package:new_project_work/widgets/footer.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences localStorage;
TextEditingController emailController = new TextEditingController();
TextEditingController pwdController = new TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }



  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  late String email;
  late String password;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool checkedValue = false;
  bool newValue = true;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image(
                      height: 125,
                      width: 150,
                      image: AssetImage('images/excellogo.png'),
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        SizedBox(height: 25.0),
                        Padding(
                          padding: EdgeInsets.only(left: 40.0, right: 40.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            controller: emailController,
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            cursorColor: Colors.black12,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              hoverColor: Colors.black26,
                              focusColor: Colors.black26,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              isDense: false,
                              hintText: 'Enter your Email',
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'OpenSans',
                                fontStyle: FontStyle.normal,
                                color: Colors.black26,
                              ),
                              suffixIcon: Icon(Icons.mail,
                                  size: 15.0, color: Colors.black26),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: 'Required'),
                              EmailValidator(errorText: 'Not a valid Email'),
                            ]),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Padding(
                          padding: EdgeInsets.only(left: 40.0, right: 40.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            obscureText: _isObscure,
                            controller: pwdController,
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            cursorColor: Colors.black12,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              hoverColor: Colors.black26,
                              focusColor: Colors.black26,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              isDense: false,
                              hintText: 'Enter your Password',
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'OpenSans',
                                fontStyle: FontStyle.normal,
                                color: Colors.black26,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                    color: Colors.black26,
                                  )),
                            ),
                            autovalidateMode: null,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              } else if (value.length < 8) {
                                return "Should atleast be 8 characters";
                              } else if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return "Enter strong password(Hint:abc@123.ab)";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          children: [
                            SizedBox(width: 30),
                            GestureDetector(
                              onTap: save,
                              child: Checkbox(
                                  checkColor: Colors.black,
                                  activeColor: Colors.blue,
                                  value: checkedValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkedValue = newValue!;
                                    });
                                  }),
                            ),
                            Text(
                              'Remember me?',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            SizedBox(width: 30.0),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPassword()));
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Button(
                        color: Colors.green.shade200,
                        shadowColor: Colors.green,
                        text: 'Log In',
                        onPress: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                          }
                        }),
                    Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

save() async {
  await LoginPage.init();
  localStorage.setString('email', emailController.text.toString());
  localStorage.setString('password', pwdController.text.toString());
}
