


import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

//# 1 .First we have write the code as bellow 

// class User{

//   final String name;
//   final String address;
//   final String age;

//   User(
//     this.name,
//     this.age,
//     this.address,
//   );

//   factory User.formJson()=>_$UserFormJson(json);

//   Map<String, dynamic> toJson()=>_$UserToJson(this);

// }


//#2 . then anotate them as JsonSerializable() form the impoting the import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class User {
  final String name;
  final String address;
  final String age;

  User(
    this.name,
    this.age,
    this.address,
  );

  /// A necessary factory constructor for creating a new `User` instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// A necessary method to convert a `User` instance to a map.
  /// Pass the instance to the generated `_$UserToJson()` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}



//3.then write at the top of next of the imapt packge 
    //part user.g.dart
  //by using theis theis can udstude were he was toring the genarated code 
    
// #4. After that, use the build_runner command to generate the code from the annotations
  // build_runner <command>
    // conmands: <command
      //--delete-conflicting-outputs

  //run the :dart run build_runner build --delete-conflicting-outputs

  // it will generate user.g.dart file in the build folder
  