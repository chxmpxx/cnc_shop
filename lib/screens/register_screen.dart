import 'package:cnc_shop/themes/color.dart';
import 'package:cnc_shop/widgets/input_decoration.dart';
import 'package:cnc_shop/widgets/main_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final formKey = GlobalKey<FormState>();
  String? username, email, phone, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorsPurple,
      appBar: AppBar(
        flexibleSpace: Image(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back.svg', color: kColorsWhite),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: kColorsWhite,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 40, bottom: 20),
                child: Text('Register', style: Theme.of(context).textTheme.headline1),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CreateUsername(),
                    CreateEmail(),
                    CreatePhone(),
                    CreatePassword(),
                    CreateConfirmPassword(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: InkWell(
                  onTap: (){
                    if(formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
                    }
                  },
                  child: MainBtnWidget(colorBtn: kColorsPurple, textBtn: 'Sign Up', isTransparent: false, haveIcon: false)
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: kColorsGrey)),
                      Padding(
                        padding: EdgeInsets.all(10),
                          child: Text("or", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: kColorsGrey)),
                        ),
                      Expanded(child: Divider(color: kColorsGrey)),
                    ]
                  )
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: (){},
                child: MainBtnWidget(colorBtn: kColorsPurple, textBtn: 'Sign Up with Google', isTransparent: true, haveIcon: true)
              ),
              SizedBox(height: 20),
            ]
          ),
        ),
      ),
    );
  }

  Widget CreateUsername() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: kColorsPurple),
        decoration: InputDecorationWidget(context, 'Username'),
        validator: (value) {
          if(value!.isEmpty) {
            return "Please enter username";
          }return null;
        },
        onChanged: (value) {
          username = value;
        },
      )
    );
  }
  Widget CreateEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: kColorsPurple),
        decoration: InputDecorationWidget(context, 'Email'),
        validator: (value) {
          if(value!.isEmpty) {
            return "Please enter Email";
          }return null;
        },
        onChanged: (value) {
          email = value;
        },
      )
    );
  }
  Widget CreatePhone() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.number,
        autofocus: false,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: kColorsPurple),
        decoration: InputDecorationWidget(context, 'Phone'),
        validator: (value) {
          if(value!.isEmpty) {
            return "Please enter phone";
          }return null;
        },
        onChanged: (value) {
          phone = value;
        },
      )
    );
  }
  Widget CreatePassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: kColorsPurple),
        decoration: InputDecorationWidget(context, 'Password'),
        validator: (value) {
          if(value!.isEmpty) {
            return "Please enter password";
          }return null;
        },
        onChanged: (value) {
          password = value;
        },
      )
    );
  }
  Widget CreateConfirmPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: kColorsPurple),
        decoration: InputDecorationWidget(context, 'Confirm Password'),
        validator: (value) {
          if(value!.isEmpty) {
            return "Please enter confirm password";
          }else if(password != null && value != password) {
            return "Those passwords didn't match. Try again.";
          }return null;
        },
        onChanged: (value) {
          confirmPassword = value;
        },
      )
    );
  }

}