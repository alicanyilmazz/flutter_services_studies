### Google Firebase Notes

- Used Dart Packages ;
 - firebase_auth:  https://pub.dev/packages/firebase_auth
 - firebase_core:  https://pub.dev/packages/firebase_core
  - cloud_firestore: https://pub.dev/packages/cloud_firestore
  - firebase storage: https://pub.dev/packages/firebase_storage
  - image picker: https://pub.dev/packages/image_picker
  
- I prefer Cloud Firestore , please read this documentation for reasons : https://firebase.google.com/docs/database/rtdb-vs-firestore .

### Firebase

![](https://firebase.google.com/images/social.png)




###Firebase Service Operations
                
----

> Firebase --> Sign In With Email And Password

```Dart
Future signInWithEmailAndPassword({FirebaseAuth auth,GlobalKey<ScaffoldState> key, String email, String password,BuildContext context}) async {
  var authResult = await auth
      .signInWithEmailAndPassword(email: email, password: password).then((authenticatedUser) {
        if(!authenticatedUser.user.emailVerified)
        {
          callSnackBar(key: key,message: "please verify your email.",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
          auth.signOut();
        }else{
          Navigator.of(context).push(_createRoute());
        }
  }).catchError((e) {
          callSnackBar(key: key,message: "Email or password is incorrect.",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
  });
}
```

> Firebase --> Sign Out

```javascript
Future<void> signOut({FirebaseAuth auth,GlobalKey<ScaffoldState> key,BuildContext context}) async {
   if( auth.currentUser!=null){
     auth.signOut().then((value) {
       SignInModel.password=null;
       SignInModel.email=null;
       SignInModel.phoneNumber=null;
       Navigator.of(context).push(_createRoute2());
     }).catchError((onError){debugPrint("Sign Out Error!");});
   }else{
     Navigator.of(context).push(_createRoute2());
   }
}
```

> Firebase --> Forgot Password

```Dart
void forgotPassword({FirebaseAuth auth,GlobalKey<ScaffoldState> key,String email}){
  auth.sendPasswordResetEmail(email: email).then((value) {
    callSnackBar(key: key,message: "Password reset link sended!",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
  }).catchError((error){
    callSnackBar(key: key,message: "This user not defined in system!",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
  });
}
```

> Firebase --> Update Password

```Dart
void updatePassword({FirebaseAuth auth,String password,GlobalKey<ScaffoldState> key}) {
  if(auth.currentUser!=null){
    auth.currentUser.updatePassword(password).catchError((onError){
      callSnackBar(key: key,message: "Error! Password was not updated!",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
    }).whenComplete(() {
      callSnackBar(key: key,message: "Password was updated successfully.",icon: Icons.done,iconColor: Colors.green,textColor: Colors.green,fontWeight: FontWeight.bold);
    });
  }else{
    callSnackBar(key: key,message: "Please sign in to update the password.",icon: Icons.done,iconColor: Colors.green,textColor: Colors.green,fontWeight: FontWeight.bold);
  }
}
```

> Firebase --> Sign In With Google

```Dart
void signInWithGoogle({FirebaseAuth auth,GoogleSignIn googleSignIn,BuildContext context}){
  googleSignIn.signIn().then((result) {
    
    result.authentication.then((googleKeys) {

          AuthCredential credential=GoogleAuthProvider.credential(idToken: googleKeys.idToken,accessToken: googleKeys.accessToken);
          auth.signInWithCredential(credential).then((userAuthResult){
            var user=userAuthResult.user;
            if(user!=null){
              Navigator.of(context).push(_createRoute());
            }
          }).catchError((onError){
            debugPrint("authentication error!");
          });
    }).catchError((onError){
      debugPrint("Google Authentication Error $onError");
    });
    
  }).catchError((error){

    debugPrint("Google Auth Sign In Error $error");

  });
}

```

> Firebase --> Sign In With Phone Number

```Dart
void signInWithPhoneNumber({FirebaseAuth auth,BuildContext context,String phoneNumber}) async{
  await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async{
        debugPrint("sms code : "+phoneAuthCredential.smsCode);
        await auth.signInWithCredential(phoneAuthCredential);
        Navigator.of(context).push(_createRoute());
      },
      verificationFailed: (FirebaseAuthException firebaseAuthException){
        debugPrint("verification failed"+firebaseAuthException.phoneNumber);
      },
    codeSent: (String verificationId, int resendToken) async {
      // Update the UI - wait for the user to enter the SMS code
      String smsCode = 'xxxx';
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(phoneAuthCredential);
    },
      codeAutoRetrievalTimeout: (String verificationId){
        debugPrint("time out verification id : $verificationId");
      },
      timeout: const Duration(seconds: 30),
  );
}
```

> Firebase --> Sign Up

```Dart
Future signUpWithEmailAndPassword({FirebaseAuth auth,String email, String password,GlobalKey<ScaffoldState> key}) async {
  var authResult = await auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .catchError((e) {callSnackBar(key: key,message: "This user already exist!",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);});

  var firebaseUser = authResult.user;

  if (firebaseUser != null) {
    firebaseUser.sendEmailVerification().then((data) {
      auth.signOut();
    }).catchError((e)   {
      callSnackBar(key: key,message: "Verification email not send your mail please take support our team.",icon: Icons.error_outline,iconColor: Colors.pink,textColor: Colors.pink,fontWeight: FontWeight.bold);
    });
    //debugPrint("Uid ${firebaseUser.uid} mail ${firebaseUser.email} isEmailVerify : ${firebaseUser.emailVerified}");
  }

}

```

> Reading Document 

```Dart
Future readData() async{
DocumentSnapshot documentSnapshot= await _firestore.document("users/alicanyilmaz").get();

debugPrint("document id : " + documentSnapshot.documentID);
debugPrint("is there any document : " + documentSnapshot.exists.toString());
debugPrint("document id : " + documentSnapshot.toString());
debugPrint("is there any writing : " + documentSnapshot.metadata.hasPendingWrites.toString());
debugPrint("data is from cache  : " + documentSnapshot.isFromCache.toString());
debugPrint("data : " + documentSnapshot.data.toString());
debugPrint("money : " + documentSnapshot.data['money']);
debugPrint("name : " + documentSnapshot.data['name']);
documentSnapshot.data.forEach((key,value){
debugPrint("key :  + $key  value : $value");
});
}
```

> Reading Collection

```javascript
_firestore.collection("user").getDocuments().then((querySnapshots){
  debugPrint("number of collection member "+querySnapshots.documents.length.toString());
});

for(int i=0;i<querySnapshots.documents.length;i++)
{
	debugPrint(querySnapshots.document[i].data.toString());
}
```


> Realtime  Document Listen


```Dart
DocumentReference ref= _firestore.collection("users").document("alican_yilmaz").snapshots().listen((changingData){
	debugPring("realtime changing data : "+ changingData.data.toString());
});

```

> Realtime  Collection Listen


```Dart
 _firestore.collection("users").snapshots().listen((snap){
 	debugPring(snap.documents.length.toString());
 });

```


> Firebase Queries

```dart
void queryData() async{
var _documents=await _firestore.collection('users').where('email',isEqualTo:'contact@alicanyilmaz.com.tr').getDocuments();

for(var document in _documents.documents){
debugPrint(_documents.data.toString());
  }
  
  var _limitedDocument= await _firestore.collection("users").limit(2).getDocuments();
  
  for(var limitedDocument in _limitedDocument.documents){
debugPrint(_limitedDocument.data.toString());
  }
  
  
  var arrayQuery=await _firestore.collection("users").where("tvseries",arrayContains:'game of thrones').getDocuments();

for(var document in arrayQuery.documents){
debugPrint('conditional tv series :' + document.data.toString());
}

var stringQuery=await _firestore.collection("users").orderBy("email",descending:true).startAt(['alican']).getDocuments();

for(var document in stringQuery.documents){
debugPrint('ordered data :' + document.data.toString());
}

var stringQuery2=await _firestore.collection("users").orderBy("email",descending:true).startAt(['alican']).endAt(['alican'+'\uf8ff']).getDocuments();

for(var document in stringQuery2.documents){
debugPrint('ordered2 data :' + document.data.toString());
}

_firestore.collection("users").documents('alican_yilmaz').get().then((docSnap){
  debugPrint(docSnap.data.toString());
  
  _firestore.collection("users").orderBy('likes').startAt([docSnap.data['likes']]).getDocuments().then((querySnap){
  if(querySnap.documents.length>0)
  {
     for(var document in querySnap.documents)
    {
     debugPrint('users more than alican_yilmaz according to like' + document.data.toString());
     }
   }
  });
});
  
}

```


