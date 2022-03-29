class Instruction{
  int Image=1;
  double Height_box =80.0;
  String Topic="";
  String Description="";
  bool isVisible = true;
  Instruction({required this.Image,required this.Topic , required this.Description, required this.isVisible,required this.Height_box});
}