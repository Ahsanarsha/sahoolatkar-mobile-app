class Color_Model {
  dynamic Colorcode;
  String Name;

  Color_Model({required this.Colorcode, required this.Name});
}

List<Color_Model> list_of_color = [
  Color_Model(
    Colorcode: 0xff33B2FF,
  Name: 'blue',
  ),

  Color_Model(
    Colorcode: 0xffFF5D33,
    Name: 'Red',
  ),
  Color_Model(
    Colorcode: 0xffFFDF33,
    Name: 'Yellow',
  ),
  Color_Model(
    Colorcode: 0xffC333FF,
    Name: 'Purple',
  ),
];
