class ItemProfileOption{
  num id;
  String name;

  ItemProfileOption(this.id, this.name);


static List<ItemProfileOption> getEyesList(){
    return [
      ItemProfileOption(1,'Brown'),
      ItemProfileOption(2,'Black'),
      ItemProfileOption(3,'Blue'),
    ];
  }
  static List<ItemProfileOption> getBodyTypeList(){
    return [
      ItemProfileOption(1,'Skinny'),
      ItemProfileOption(2,'fat'),
    ];
  }
  static List<ItemProfileOption> getMaritalStatusList(){
    return [
      ItemProfileOption(1,'Single'),
      ItemProfileOption(2,'Married'),
      ItemProfileOption(3,'Divorced'),
    ];
  }
  static List<ItemProfileOption> getHairList(){
    return [
      ItemProfileOption(1,'Curly'),
      ItemProfileOption(2,'Straight'),
    ];
  }
  static List<ItemProfileOption> getGenderList(){
    return [
      ItemProfileOption(1,'Male'),
      ItemProfileOption(2,'Female'),
      ItemProfileOption(3,'Rather Not To Say'),
    ];
  }

}

