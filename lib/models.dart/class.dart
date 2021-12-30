class Class {
String? thName;
String? eName;
String? classvalue;




Class(this.thName, this.eName,this.classvalue,);


static List<Class>getClass(){
  return[
    Class('ชั้นปีที่ 1','1','1'),
    Class('ชั้นปีที่ 2','2','2'),
    Class('ชั้นปีที่ 3','3','3'),
    Class('ชั้นปีที่ 4','4','4'),
  ];
}

}