class Like{
  String? name;
  String? eName;
  bool? checked;

  Like(this.name, this.eName, this.checked);

  static List<Like> getLike(){
    return [
      Like('ประวัติศาสตร์', '1', false),
      Like('อ่านหนังสือการ์ตูน', '2', false),
      Like('สะสมโมเดล', '3', false),
      Like('ช็อกโกแล็ต', '4', false),
      Like('ดูสตรีมเกม', '5', false),
      Like('แบล็คพิงค์', '6', false),
      Like('สีดำ & สีฟ้า', '7', false),
    ];
  }

  
}