import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:new_project_work/ui_pages/dashboard.dart';
import 'package:new_project_work/ui_pages/forgot_password.dart';
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
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),

                Image(
                  height: 150,
                  width: 150,
                  image: AssetImage('images/excellogo.png'),
                  fit: BoxFit.cover,
                ),

                SizedBox(height: 20.0),

                Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: TextFormField(

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
                        fontFamily: 'MontserratAlternates',
                        fontStyle: FontStyle.normal,
                        color: Colors.black26,
                      ),
                      suffixIcon:
                          Icon(Icons.mail, size: 15.0, color: Colors.black26),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Required'),
                      EmailValidator(errorText: 'Not a valid Email'),
                    ]),
                  ),
                ),

                SizedBox(height: 20.0),

                Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: TextFormField(
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
                        fontFamily: 'MontserratAlternates',
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

                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    SizedBox(width: 20),
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
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      width: 45.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: SizedBox(
                    width: 200.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          // side: BorderSide(color: Colors.blue),

                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(5)),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'MontserratAlternates'),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 40.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\u00a9 by ',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                          height: 60,
                          width: 60,
                          image: AssetImage('images/logo.png')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

save()async{
  await LoginPage.init();
  localStorage.setString('email', emailController.text.toString());
  localStorage.setString('password', pwdController.text.toString());
}
