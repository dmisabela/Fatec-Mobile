class Compra {
  int id;
  String qt;
  String mercadoria;
 
  Compra(this.qt, this.mercadoria);
 
  Compra.fromMap(Map map) {
    this.id = map["id"];
    this.mercadoria = map["mercadoria"];
    this.qt = map["qt"];
  }
 
  Map toMap() {
    Map<String, dynamic> map = {
      "id": this.id,
      "qt": this.qt,
      "mercadoria": this.mercadoria,
    };
 
    if (this.id != null) {
      map["id"] = this.id;
    }
 
    return map;
  }
}
