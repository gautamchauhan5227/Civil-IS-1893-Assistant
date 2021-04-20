// import 'package:civil_app/screen/home/chapters/chap1/chapter_one.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatelessWidget {

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//  signInWithGoogle() async {
//     GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

//     GoogleSignInAuthentication googleSignInAuthentication =
//     await googleSignInAccount.authentication;

//     AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );

//     final UserCredential userCredential =
//             await _auth.signInWithCredential(credential);
//             print(userCredential.user.email);
   
//   }

//   void signOutGoogle() async{
//   await _googleSignIn.signOut();
//   print("User Sign Out");
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Center(
//             child: Column(
//               children: [
//                 FlatButton(onPressed: (){
//                   signInWithGoogle();
//                 }, child: Text("Google Sign In"),),
//                 FlatButton(onPressed: (){
//                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChapterOneScreen()));
//                   // _incrementCounter();
//                   // signOutGoogle();
//                 }, child: Text("Google Sign Out"),),
//               ],
//             ),
//           )
//         ],
//       )
//     );
//   }
// }

// _incrementCounter() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int counter = (prefs.getInt('counter') ?? 0) + 1;
//   print('Pressed $counter times.');
//   await prefs.setInt('counter', counter);
// }