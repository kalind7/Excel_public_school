import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:new_project_work/controller/login/controller/login_controller.dart';
import 'package:new_project_work/global/InternetConnection.dart';
import 'package:new_project_work/ui_pages/forgot_password.dart';
import 'package:new_project_work/utils/color.dart';
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

  final studentController = Get.put(LoginDataController());

  bool checkedValue = false;
  bool newValue = true;
  bool _isObscure = true;

  @override
  void initState() {
    pwdController.text = '1234';
    emailController.text = 'std260@mail.com';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.infinity,
                // color: Colors.red,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18)),
                  gradient: LinearGradient(
                      colors: [pink, orangeOne],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 4.7,
                left: 10,
                right: 10,
                child: loginWidget(),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Footer(),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginWidget() {
    return Center(
      child: Card(
        shadowColor: pink,
        clipBehavior: Clip.antiAlias,
        elevation: 15.0,
        // shape: Border(bottom: BorderSide(color: Colors.red, width: 5)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(width: 1, color: pink)),
        child: Container(
          width: double.infinity - 100,
          decoration: BoxDecoration(
            border: Border(
              // top: BorderSide(width: 2.0, color: Colors.lightBlue.shade600),
              bottom: BorderSide(width: 2.0, color: pink),
            ),
          ),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Image(
                  height: 125,
                  width: 150,
                  image: AssetImage('images/excellogo.png'),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
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
                          hoverColor: Colors.black26,
                          focusColor: Colors.black26,
                          isDense: false,
                          hintText: 'Enter your Email',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'OpenSans',
                            fontStyle: FontStyle.normal,
                            color: Colors.black26,
                          ),
                          prefixIcon: Icon(Icons.mail,
                              size: 25.0, color: Colors.black26),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Required'),
                          EmailValidator(errorText: 'Not a valid Email'),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          hoverColor: Colors.black26,
                          focusColor: pink,
                          isDense: false,
                          hintText: 'Enter your Password',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'OpenSans',
                            fontStyle: FontStyle.normal,
                            color: Colors.black26,
                          ),
                          prefixIcon: Icon(Icons.password_sharp,
                              size: 25.0, color: Colors.black26),
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
                          } else if (value.length < 3) {
                            return "Should atleast be 8 characters";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
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
                          ],
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
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => SizedBox(
                    width: 150,
                    height: 60.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: pink,
                          onSurface: Colors.grey,
                        ),
                        onPressed: () async {
                          bool isInternetConnected = await InternetConnection()
                              .checkInternetConnectivity();
                          print(isInternetConnected);
                          if (formkey.currentState!.validate() &&
                              isInternetConnected) {
                            var data = {
                              "email": emailController.text,
                              "password": pwdController.text
                            };
                            studentController.login(data);
                          }
                        },
                        child: Text(
                          studentController.isloading.value
                              ? 'Loading..'
                              : 'Login',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
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
