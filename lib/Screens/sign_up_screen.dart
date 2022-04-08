import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itsmygram/Widgets/text_feild_input.dart';
import 'package:itsmygram/resources/auth_methods.dart';
import 'package:itsmygram/utils/colors.dart';

import '../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? image;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(),
              flex: 2,
            ),
            // svg image

            SvgPicture.asset(
              'assets/ic_instagram.svg',
              color: primaryColor,
              height: 64,
            ),

            const SizedBox(
              height: 64,
            ),
            //circular widget to accept and show selected image
            Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        backgroundImage: MemoryImage(image!),
                        radius: 64,
                      )
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                          'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg',
                        ),
                      ),
                Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {
                        selectImage();
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 64,
            ),

            // text feild for username
            TextFeildInput(
                hintText: 'Enter Your username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController),
            const SizedBox(
              height: 24,
            ),

            TextFeildInput(
                hintText: 'Enter Your Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController),
            const SizedBox(
              height: 24,
            ),
            TextFeildInput(
              hintText: 'Enter Your password',
              textInputType: TextInputType.emailAddress,
              textEditingController: _passwordController,
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),

            TextFeildInput(
                hintText: 'Enter Your bio',
                textInputType: TextInputType.text,
                textEditingController: _bioController),

            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () async {
                String res = await AuthMethods().signUpuser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                  bio: _bioController.text,
                  file: image!,
                );
                print(res);
              },
              child: Container(
                child: const Text(
                  'Sign up',
                ),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: blueColor,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Text('Dont have an account ? '),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
                Container(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8),
                )
              ],
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),

            // text feild input for email
            // for password

            // button for login
            // transitioning to sign in
          ],
        ),
      ),
    ));
  }
}
