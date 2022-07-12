<h1 align="center">
   CleanitApp
   <br>
     <a href="https://github.com/ananya-bangera/Msft-project">
       <img src="https://cdn.pixabay.com/photo/2016/10/10/23/21/recycle-1730163_1280.png" width="150" height="150">
     </a>
  <br>
</h1>
<div align="center">
  <strong>CleanitApp</strong> - Helps in cleanup of local areas on a volunteering basis<br>
  Google Solution Challenge 2022<br><br>
</div>

<div align="center">
  <img src="https://img.shields.io/github/stars/ananya-bangera/Msft-project?color=green&style=for-the-badge">
</div>

<hr>

<details>
<summary>Table of Contents</summary>

- [💭Problem Statement](#problem-statement)
- [📰Description](#description)
- [🤖Tech-Stack](#tech-stack)
- [📈Progress](#progress)
- [🔮Future Scope](#future-scope)
- [🚧Major Roadblocks](#major-roadblocks)
- [⚙Usage](#usage)
- [👨‍💻Contributors](#contributors)
- [👨‍🏫Acknowledgement](#acknowledgement)
- [📱Screenshots](#screenshots)

</details>

# CleanitApp

## 📰Description
<table>
  <tr>
    <td>
An app that helps in cleanup of local areas on a volunteering basis.<br>
These 'clean ups' include removing rubbish from public places like beaches, parks, tourist sites and more.<br>
Users can upload images of the messed up places (and a small description) & add the location of the area requiring a cleanup. Also an approximate of the total volunteers is needed. The area will then be highlighted on a map with a unique color based on the intensity of the impact (like red, orange, yellow). 
Volunteers can then look for locations around them and choose to participate in these cleanup activities. <br>
Once done, the cleanup task for that area will be marked as completed.
    </td>
  </tr>
 </table>
 
## 📈Progress
- Upload new cleanup events
- Volunteer to participate in upcoming cleanup events
- Provides a list of similar volunteering events nearby

## 🔮Future Scope
- Gamification - Volunteers earn shareable badges based on their contributions & involvement
- Setting reminders for future cleanup events
- User feedback/reviews page

## 🚧Major Roadblocks
1. Dart Version Conflict with Firebase Dependencies
   ```
   The current Dart SDK version is 2.13.1.
   Because smart_advertising depends on cloud_firestore >=3.1.10 which requires SDK version >=2.16.0 <3.0.0, version solving failed.
    pub get failed (1; Because smart_advertising depends on cloud_firestore >=3.1.10 which requires SDK version >=2.16.0 <3.0.0, version solving failed.)
    Process finished with exit code 1
   ```
   Solved by using version suitable to my current SDK version
2. BuildContext Error
   ```
   error: [dart] The argument type 'Context' can't be assigned to the parameter type 'BuildContext'. [argument_type_not_assignable]
   ```
   By passing the BuildContext context or Just context in the function helped me solved the problem 
3. Missing Firebase Dependency
   ```
   lib/pages/registeration.dart:252:21: Warning: Operand of null-aware operation '!' has type 'User' which excludes null.
     - 'User' is from 'package:firebase_auth/firebase_auth.dart' ('/C:/src/flutter/.pub-cache/hosted/pub.dartlang.org/firebase_auth-2.0.0/lib/firebase_auth.dart').
    userModel.uid = user!.uid;
    /C:/src/flutter/.pub-cache/hosted/pub.dartlang.org/cloud_firestore_platform_interface-5.5.0/lib/src/method_channel/method_channel_firestore.dart:112:15: Error: Method not found: 'Error.throwWithStackTrace'.
            Error.throwWithStackTrace(
    ^^^^^^^^^^^^^^^^^^^
    /C:/src/flutter/.pub-cache/hosted/pub.dartlang.org/cloud_firestore_platform_interface-5.5.0/lib/src/method_channel/utils/exception.dart:14:11: Error: Method not found: 'Error.throwWithStackTrace'.
        Error.throwWithStackTrace(exception, stackTrace);
   ```
   Solved by adding the dependency firebase_auth_platform_interface: ^5.0.0
4. Null value Error - a frequent error
   ```
   Flutter Compile Error on Firebase Auth: "A non-null value must be returned since the return type 'Never' doesn't allow null."
   ```
   Solution:  
   The error message was added from dart 2.16, i.e from flutter 2.10, so the primary solution will be to upgrade your flutter version, which will also upgrade dart version.
   ```
   android{
           //change compile sdk version to 31
           compileSdkVersion 31
    }
    ```
 5. MultiDex Error
    ```
    D8: Cannot fit requested classes in a single dex file 
    ```
    Add multiDex to your app-level build.gradle file. Under defaultConfig add this line
    ```
    multiDexEnabled true
    ```
    Then in dependencies add multidex and check versions
    ```
    implementation 'androidx.multidex:multidex: 2.0.1'
    ```
6. TFLite embedding not supported for Android V2
   ```
   The plugin `tflite` uses a deprecated version of the Android embedding.
    To avoid unexpected runtime failures, or future build failures, try to see if this plugin supports the Android V2 embedding. Otherwise, consider removing it since a future release of Flutter will remove these deprecated APIs.
    If you are plugin author, take a look at the docs for migrating the plugin to the V2 embedding: https://flutter.dev/go/android-plugin-migration.
   ```

## 🤖Tech-Stack
<a href="https://docs.flutter.dev/" title="Flutter"><img src="https://github.com/get-icon/geticon/blob/master/icons/flutter.svg" alt="Flutter" width="31px" height="31px"></a>
<a href="https://dart.dev/guides" title="Dart"><img src="https://github.com/get-icon/geticon/blob/master/icons/dart.svg" alt="Dart" width="31px" height="31px"></a>
<a href="https://firebase.google.com/docs?gclid=CjwKCAjwopWSBhB6EiwAjxmqDd65ZWXRxNjtU_WfBUDGnArAMu7IEwWMIBGkyiTkEB-BLZ5dlniM3xoCSvEQAvD_BwE&gclsrc=aw.ds" title="Firebase"><img src="https://github.com/get-icon/geticon/blob/master/icons/firebase.svg" alt="Firebase" width="31px" height="31px"></a>
<a href="https://developers.google.com/maps/documentation" title="Google Maps"><img src="https://github.com/get-icon/geticon/blob/master/icons/google-maps.svg" alt="Google Maps" width="31px" height="31px"></a>

## 👨‍💻Contributors 
- [Alisha Kamat](https://github.com/alisha-kamat) 
- [Ananya Bangera](https://github.com/ananya-bangera) 
- [Aayush Mehta](https://github.com/AayushM8) 
- [Siddhant Sontakke](https://github.com/Siddhant109) 

## 📱Screenshots
<b></b>
 <br>
<table>
  <tr>
    <td><b> Info Page 1 </b></td>
     <td><b>Info Page 2 </b></td>
     <td><b>Info Page 3 </b></td>
  </tr>
  <tr>
    <td><img src = "https://github.com/alisha-kamat/CleanitApp/blob/main/images/InfoPage1.jpeg" width = 500></td>
     <td><img src = "https://github.com/alisha-kamat/CleanitApp/blob/main/images/InfoPage2.jpeg" width = 500></td>
     <td><img src = "https://github.com/alisha-kamat/CleanitApp/blob/main/images/InfoPage3.jpeg" width = 500></td>
  </tr>
 </table>
 <br>

<br>
<b></b>
 <br>
<table>
  <tr>
    <td><b> Login Page </b></td>
     <td><b>Profile Page </b></td>
  </tr>
  <tr>
    <td><img src = "https://github.com/alisha-kamat/CleanitApp/blob/main/images/Login.jpeg" width = 300></td>
    <td><img src = "https://github.com/alisha-kamat/CleanitApp/blob/main/images/ProfilePage.jpeg" width = 300></td>
  </tr>
 </table>
 <br>

<br>
<b></b>
 <br>
<table>
  <tr>
    <td><b> Events </b></td>
     <td><b> Add Events </b></td>
     <td><b> Map </b></td>
  </tr>
  <tr>
    <td><img src = "https://github.com/alisha-kamat/CleanitApp/blob/main/images/Events.jpeg" width = 500></td>
    <td><img src = "https://github.com/alisha-kamat/CleanitApp/blob/main/images/AddEvents.jpeg" width = 500></td>
     <td><img src = "https://github.com/alisha-kamat/CleanitApp/blob/main/images/Map.jpeg" width = 500></td>
  </tr>
 </table>
 <br>

<br>


