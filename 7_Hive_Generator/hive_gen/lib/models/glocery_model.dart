
import 'package:hive/hive.dart';
part 'glocery_model.g.dart';

@HiveType(typeId: 0)  //by anoting the this it wil be realize the this is an Adpetor create the respective file 
class GloseryModel{

  @HiveField(0) //this index will be in range 0 to 255
  final String item;


  //the index was not same as above we have to pass the unique index for the different variables
  
  @HiveField(1)
  final String quantity;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final bool completd;



  const GloseryModel( 
    {
      required this.quantity,
      required this.date,
      required this.completd,
      required this.item
    }
  );


}

//now run
//flutter packages pub run build_runner build 