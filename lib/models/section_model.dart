class SectionModel {
  int id=0;
  String name='',img='';
  SectionModel(this.id, this.name,this.img);

  SectionModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    img = json["img"];
  }
}
