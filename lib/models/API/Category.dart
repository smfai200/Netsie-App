
class Category_Model{
  static final _controller = Category_Model._internal();
  Category_Model._internal();


  factory Category_Model() {
    return _controller;
  }

  int id;
  String Title;
  String Image_Url;
  String Slug;
  bool IsActive = true;
  List<dynamic> categorylist;
  List<dynamic> storycategorylist;
  List<String> category_labels;
  List<String> category_labels_list = List<String>();

  SetCategoryList(catlist){
    this.categorylist = catlist;
    for (var name in catlist){
      var title = name["Category_Title"];
      this.category_labels_list.add(title.toString());
    }

    this.category_labels = this.category_labels_list.toSet().toList();
  }

  SetCategoryStoryList(catlist){
    this.storycategorylist = catlist;
  }

  GetCategoryTitleById(id){
    for (var name in this.categorylist){
      if(name["id"] == id){
        var title = name["Category_Title"];
        return title;
      }
    }
    return "";
  }

  GetCategoryIDByTitle(title){
    for (var name in this.categorylist){
      if(name["Category_Title"] == title){
        var id = name["id"];
        return id;
      }
    }
    return "";
  }

//  CategoryList_Parse(cat_list){
//    for(cat in cat_list)
//  }
}