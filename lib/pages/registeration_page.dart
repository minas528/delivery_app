import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  static const RouteName = '/registration';
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // var _textFieldName = '';
  // var _textFieldLastName = '';
  // var _textFiledPhone = '';
  // var _textFieldEmail = '';
  // var _textfieldPassword = '';

  bool _phoneValidated = false;
  bool _emailValidated = false;
  bool _passwordValidated = false;
  bool _showPassword = false;

  bool hasUppercase = false;
  bool hasDigits = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Account anlegen',
                        textScaleFactor: 1.1,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Zum Fortfahren anmelden',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      _buildFormlLabel('NAME'),
                      SizedBox(
                        height: 10,
                      ),
                      _buildNameField('Meier'),
                      SizedBox(
                        height: 20,
                      ),
                      _buildFormlLabel('VORNAME'),
                      SizedBox(
                        height: 10,
                      ),
                      _buildNameField('Max'),
                      SizedBox(
                        height: 20,
                      ),
                      _buildFormlLabel('MOBILE'),
                      SizedBox(
                        height: 10,
                      ),
                      _buildPhoneNumberField(),
                      SizedBox(
                        height: 20,
                      ),
                      _buildFormlLabel('EMAIL'),
                      SizedBox(
                        height: 10,
                      ),
                      _buildEmailField('maxmeier12312@web.de'),
                      SizedBox(
                        height: 20,
                      ),
                      _buildFormlLabel('PASSWORD'),
                      SizedBox(
                        height: 20,
                      ),
                      _buildPasswordTextField(),
                      SizedBox(
                        height: 30,
                      ),
                      _passwordLiveCheck(
                          'Kleinsbuchstable (a-z)', hasLowercase),
                      _passwordLiveCheck('Grobunchstable (A-Z)', hasUppercase),
                      _passwordLiveCheck('Zahi (0-9)', hasDigits),
                      _passwordLiveCheck(
                          'Sonderzeichen (()[]{}?!\$%&/=*+~,.;:<>-_),',
                          hasSpecialCharacters),
                      SizedBox(
                        height: 30,
                      ),
                      _submitButton(),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          child: Center(
                              child: Text(
                                  'Sie haben bereits ein Account? Anmelden')))
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildFormlLabel(String label) {
    return (Text(
      label,
      style: TextStyle(
        fontSize: 12,
        letterSpacing: 1.2,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    ));
  }

  Widget _buildNameField(String lable) {
    return Container(
      color: Colors.grey[100],
      child: TextFormField(
        // onChanged: (value) => _phone
        // = value.trim(),

        keyboardType: TextInputType.phone,

        decoration: InputDecoration(
          labelText: lable,
          labelStyle: TextStyle(color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none,
          fillColor: Colors.amber,
        ),
        cursorColor: Colors.black12,
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Container(
      color: Colors.grey[100],
      child: TextFormField(
        onChanged: (value) => {
          if (value.length == 10)
            {
              setState(() {
                _phoneValidated = true;
              })
            }
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Phone number',
          labelStyle: TextStyle(color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: _phoneValidated
              ? Icon(
                  Icons.task_alt,
                  color: Colors.green,
                )
              : null,
          border: InputBorder.none,
          // filled: true,
          fillColor: Theme.of(context).cardTheme.color,
        ),
        cursorColor: Colors.black12,
      ),
    );
  }

  Widget _buildEmailField(String lable) {
    return Container(
      color: Colors.grey[100],
      child: TextFormField(
        // onChanged: (value) => _phone = value.trim(),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: TextStyle(color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: _emailValidated
              ? Icon(
                  Icons.task_alt,
                  color: Colors.green,
                )
              : null,
          border: InputBorder.none,
          // filled: true,
          fillColor: Theme.of(context).cardTheme.color,
        ),
        cursorColor: Colors.black12,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      // controller: _passwordController,
      validator: (value) => value!.length < 4
          ? "Password must be 4 or more characters in length"
          : null,
      obscureText: !this._showPassword,
      onChanged: (value) => {
        setState(() {
          hasUppercase = value.contains(new RegExp(r'[A-Z]'));
          hasDigits = value.contains(new RegExp(r'[0-9]'));
          hasLowercase = value.contains(new RegExp(r'[a-z]'));
          hasSpecialCharacters =
              value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
          _passwordValidated = value.length > 8;
        })
      },
      // onSaved: (value) => _password = value!,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Password',
        focusColor: Color(0xff4064f3),
        labelStyle: TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: InputBorder.none,
        filled: true,
        fillColor: Theme.of(context).cardTheme.color,
        suffixIcon: IconButton(
          icon: this._showPassword
              ? Icon(Icons.remove_red_eye)
              : Icon(Icons.remove_red_eye_sharp),
          color: Theme.of(context).iconTheme.color,
          onPressed: () {
            setState(() => this._showPassword = !this._showPassword);
          },
        ),
      ),
      cursorColor: Colors.black12,
    );
  }

  Widget _passwordLiveCheck(String parameter, bool param) {
    return (Row(
      children: [
        Icon(
          Icons.adjust,
          color: param ? Colors.green : Colors.red,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          parameter,
          style: TextStyle(color: Colors.grey),
        )
      ],
    ));
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/");
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.blue.withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.red[600]),
        child: Text(
          'Account anlegen',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
