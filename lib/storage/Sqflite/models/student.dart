class Student{

  int _id;
  String _name;
  String _surname;
  int _grade;

  Student(this._name, this._surname,this._grade);
  Student.withID(this._id,this._name,this._surname,this._grade);
  Student.fromMap(Map<String,dynamic> map){
    this._id=map['id'];
    this._name=map['name'];
    this._surname=map['surname'];
    this._grade=map['grade'];
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get surname => _surname;

  set surname(String value) {
    _surname = value;
  }


  int get grade => _grade;

  set grade(int value) {
    _grade = value;
  }

  Map<String,dynamic> toMap(){
    var map=Map<String,dynamic>();

    map['id']=_id;
    map['name']=_name;
    map['surname']=_surname;
    map['grade']=_grade;
    return map;

  }

}