import 'package:flutter/material.dart';
import 'package:registerpage095/models.dart/class.dart';
import 'package:registerpage095/models.dart/course.dart';
import 'package:registerpage095/models.dart/like.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.Title}) : super(key: key);

  final Title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _lastnamecontroller = TextEditingController();
  TextEditingController _studentIDcontroller = TextEditingController();


  String? classValue;
  String? courseValue;

  late List<Class> classs;
  late List<Course> courses;
  List<Faculty> dropdownItems = Faculty.getFaculty();
  late List<DropdownMenuItem<Faculty>> dropdownMenuItems;
  late Faculty _selectedFaculty;
  late List<Like> likes;
  List selectedtLike = [];

  @override
  void initState() {
    super.initState();
    classs = Class.getClass();
    courses = Course.getCourse();
    dropdownMenuItems = createDropdownManu(dropdownItems);
    _selectedFaculty = dropdownMenuItems[0].value!;
    likes = Like.getLike();
  }


 List<DropdownMenuItem<Faculty>> createDropdownManu(
   List<Faculty> dropdownItems) {
   List<DropdownMenuItem<Faculty>> Facultys = [];

   for (var Faculty in dropdownItems) {
     Facultys.add(DropdownMenuItem(
       child: Text(Faculty.name!),
       value: Faculty,
     ));
   }

   return Facultys;
 }

  @override
  Widget build(BuildContext context) {
    var courseValue;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  n(),
                  SizedBox(height: 10),
                  username(),
                  SizedBox(height: 16),
                  lastname(),
                  SizedBox(height: 16),
                  studentID(),
                  SizedBox(height: 16),
                  c(),
                  SizedBox(height: 10),
                  Column(
                    children: createClassRadio(),
                  ),
                  Text('Item Selected: $classValue'),
                  SizedBox(height: 20),

                  co(),
                  SizedBox(height: 10),
                  Column(
                    children: createCourseRadio(),
                  ),
                  SizedBox(height: 20),

                  f(),
                  SizedBox(height: 10),
                  DropdownButton(
                    value:  _selectedFaculty,
                    items: dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                         _selectedFaculty = value as Faculty;
                      });
                  }),
                  Text('Faculty:' + _selectedFaculty.value!.toString()),
                  SizedBox(height: 20),

                  l(),
                  SizedBox(height: 10),
                  Column(
                    children: createLikeCheckbox(),
                  ),
                  
                  submit()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text l() {
    return const Text('สิ่งที่ชอบ', 
        style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.orange,
        ) ,);
  }

  Text f() {
    return const Text('คณะที่กำลังศึกษา', 
        style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.orange,
        ) ,);
  }

  Text co() {
    return const Text('หลักสูตรที่กำลังศึกษา', 
        style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.orange,
        ) ,);
  }

  Text c() {
    return const Text('ชั้นปีที่กำลังศึกษา', 
        style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.orange,
        ) ,);
  }

  Text n() {
    return const Text('ข้อมูลส่วนตัว', 
        style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.orange,
        ) ,);
  }

  ElevatedButton submit() {
    return ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          print(_usernamecontroller.text);
          print(_lastnamecontroller.text);
          print(_studentIDcontroller.text);
        }
      },
      child: Text('submit'),
    );
  }

  TextFormField studentID() {
    return TextFormField(
      controller: _studentIDcontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter StudentID';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'StudentID',
        prefixIcon: Icon(Icons.password),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2.0,
        )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            color: Colors.orange,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }

  TextFormField lastname() {
    return TextFormField(
      controller: _lastnamecontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Lastname';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Lastname',
        prefixIcon: Icon(Icons.umbrella),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2.0,
        )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            color: Colors.orange,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }

  TextFormField username() {
    return TextFormField(
      controller: _usernamecontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter username';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(Icons.person),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            color: Colors.orange,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }

  List<Widget> createClassRadio() {
     List<Widget> listRadioClass = [];

    listRadioClass = classs
        .map(
          (Class) => RadioListTile<dynamic>(
            tileColor: Colors.orange[50],
              title: Text(Class.thName!),
              value: Class.classvalue,
              groupValue: classValue,
              onChanged: (value) {
                setState(() {
                  classValue = value!;
                  print(value);
                });
              }),
        )
        .toList();

    return listRadioClass;
  }

  List<Widget> createCourseRadio() {
      List<Widget> listRadioCourse = [];

    listRadioCourse = courses
        .map(
          (Course) => RadioListTile<dynamic>(
            tileColor: Colors.orange[50],
              title: Text(Course.thName!),
              subtitle: Text(Course.enName!),
              value: Course.coursevalue,
              groupValue: courseValue,
              onChanged: (value) {
               setState(() {
                 courseValue = value;
                 print(value);
               });
              },
            ),
        )
        .toList();

    return listRadioCourse;
  }

  List<Widget> createLikeCheckbox() {
    List<Widget> listCheckboxLike = [];

    for (var like in likes){
      listCheckboxLike.add(
          CheckboxListTile (
            tileColor: Colors.orange[50],
            title: Text(like.name!),
            value: like.checked, 
            onChanged: (value) {
              setState(() {
                like.checked = value!;
              }
              );

              if(value!) {
                selectedtLike.add(like.name!);
              }
              else {
                selectedtLike.remove(like.name!);
              }
              print(selectedtLike);
            },
          ),         
      );

    }
    return listCheckboxLike;
  }

}

class Faculty {
  int? value;
  String? name;

  Faculty(this.value, this.name);

  static List<Faculty>getFaculty(){
  return[
      Faculty(001, 'คณะวิศวกรรมศาสตร์'),
      Faculty(002, 'คณะวิทยาศาสตร์'),
      Faculty(003, 'คณะวิทยาการสุขภาพและการกีฬา '),
      Faculty(004, 'คณะนิติศาสตร์'),
      Faculty(005, 'คณะพยาบาลศาสตร์'),
      Faculty(007, 'คณะการพัฒนาชุมชน'),
      Faculty(008, 'คณะอุตสาหกรรมเกษตรและชีวภาพ '),
  ];
 
}
}









 // RadioListTile(
                  //   title: Text('ชั้นปีที่ 1'),
                  //   subtitle: Text('1'),
                  //   value: '1', 
                  //   groupValue: classValue, 
                  //   onChanged: (value) {
                  //     setState(() {
                  //       classValue = value.toString();
                  //     });
                  //   },
                  //   ),


                  // CheckboxListTile(
                  //   value: false, 
                  //   title: Text('สิ่งที่ชอบ'),
                  //   onChanged: (value){

                  //   }),