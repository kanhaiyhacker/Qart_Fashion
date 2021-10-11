class ProductsResponse {
  int? productCount;
  List<Products>? products;
  List<Brands>? brands;
  int? lastUpdatedToken;

  ProductsResponse(
      {this.productCount, this.products, this.brands, this.lastUpdatedToken});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    productCount = json['ProductCount'];
    if (json['Products'] != null) {
      products = <Products>[];
      json['Products'].forEach((v) {
        products?.add(new Products.fromJson(v));
      });
    }
    if (json['Brands'] != null) {
      brands = <Brands>[];
      json['Brands'].forEach((v) {
        brands?.add(new Brands.fromJson(v));
      });
    }
    lastUpdatedToken = json['LastUpdatedToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductCount'] = this.productCount;
    if (this.products != null) {
      data['Products'] = this.products?.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data['Brands'] = this.brands?.map((v) => v.toJson()).toList();
    }
    data['LastUpdatedToken'] = this.lastUpdatedToken;
    return data;
  }
}

class Products {
  String? season;
  String? brand;
  String? mood;
  String? gender;
  String? theme;
  String? category;
  String? name;
  String? color;
  String? option;
  double? mRP;
  String? subCategory;
  String? collection;
  String? fit;
  String? description;
  String? qRCode;
  String? looks;
  String? looksImageUrl;
  String? looksImage;
  String? fabric;
  Map<String, dynamic>? eAN;
  String? finish;
  List<String>? availableSizes;
  int? sizeWiseStock;
  List<String>? offerMonths;
  int? productClass;
  bool? promoted;
  bool? secondary;
  bool? deactivated;
  int? defaultSize;
  String? material;
  String? quality;
  String? qRCode2;
  String? displayName;
  int? displayOrder;
  int? minQuantity;
  int? maxQuantity;
  String? qPSCode;
  Null? demandType;
  String? image;
  String? imageUrl;
  bool? adShoot;
  String? technology;
  String? imageAlt;
  String? technologyImage;
  String? technologyImageUrl;
  bool? isCore;
  int? minimumArticleQuantity;
  double? likeabilty;
  String? brandRank;

  Products(
      {this.season,
      this.brand,
      this.mood,
      this.gender,
      this.theme,
      this.category,
      this.name,
      this.color,
      this.option,
      this.mRP,
      this.subCategory,
      this.collection,
      this.fit,
      this.description,
      this.qRCode,
      this.looks,
      this.looksImageUrl,
      this.looksImage,
      this.fabric,
      this.eAN,
      this.finish,
      this.availableSizes,
      this.sizeWiseStock,
      this.offerMonths,
      this.productClass,
      this.promoted,
      this.secondary,
      this.deactivated,
      this.defaultSize,
      this.material,
      this.quality,
      this.qRCode2,
      this.displayName,
      this.displayOrder,
      this.minQuantity,
      this.maxQuantity,
      this.qPSCode,
      this.demandType,
      this.image,
      this.imageUrl,
      this.adShoot,
      this.technology,
      this.imageAlt,
      this.technologyImage,
      this.technologyImageUrl,
      this.isCore,
      this.minimumArticleQuantity,
      this.likeabilty,
      this.brandRank});

  Products.fromJson(Map<String, dynamic> json) {
    season = json['Season'];
    brand = json['Brand'];
    mood = json['Mood'];
    gender = json['Gender'];
    theme = json['Theme'];
    category = json['Category'];
    name = json['Name'];
    color = json['Color'];
    option = json['Option'];
    mRP = json['MRP'];
    subCategory = json['SubCategory'];
    collection = json['Collection'];
    fit = json['Fit'];
    description = json['Description'];
    qRCode = json['QRCode'];
    looks = json['Looks'];
    looksImageUrl = json['LooksImageUrl'];
    looksImage = json['LooksImage'];
    fabric = json['Fabric'];
    eAN = json['EAN'] != null ? json['EAN'] as Map<String,dynamic>?: null;
    finish = json['Finish'];
    availableSizes = json['AvailableSizes'].cast<String>();
    sizeWiseStock = json['SizeWiseStock'];
    offerMonths = json['OfferMonths'].cast<String>();
    productClass = json['ProductClass'];
    promoted = json['Promoted'];
    secondary = json['Secondary'];
    deactivated = json['Deactivated'];
    defaultSize = json['DefaultSize'];
    material = json['Material'];
    quality = json['Quality'];
    qRCode2 = json['QRCode2'];
    displayName = json['DisplayName'];
    displayOrder = json['DisplayOrder'];
    minQuantity = json['MinQuantity'];
    maxQuantity = json['MaxQuantity'];
    qPSCode = json['QPSCode'];
    demandType = json['DemandType'];
    image = json['Image'];
    imageUrl = json['ImageUrl'];
    adShoot = json['AdShoot'];
    technology = json['Technology'];
    imageAlt = json['ImageAlt'];
    technologyImage = json['TechnologyImage'];
    technologyImageUrl = json['TechnologyImageUrl'];
    isCore = json['IsCore'];
    minimumArticleQuantity = json['MinimumArticleQuantity'];
    likeabilty = json['Likeabilty'];
    brandRank = json['BrandRank'];
  }

  Products.fromJsonDB(Map<String, dynamic> json) {
    season = json['Season'];
    brand = json['Brand'];
    mood = json['Mood'];
    gender = json['Gender'];
    theme = json['Theme'];
    category = json['Category'];
    name = json['Name'];
    color = json['Color'];
    option = json['Option'];
    mRP = json['MRP'];
    subCategory = json['SubCategory'];
    collection = json['Collection'];
    fit = json['Fit'];
    description = json['Description'];
    qRCode = json['QRCode'];
    looks = json['Looks'];
    looksImageUrl = json['LooksImageUrl'];
    looksImage = json['LooksImage'];
    fabric = json['Fabric'];
    if (json['EAN'] != null) {
      String temp = json['EAN'];
      List<String> keys = temp.split(",");
      eAN = Map.fromIterable(keys);
    }
    finish = json['Finish'];
    if (json['AvailableSizes'] != null) {
      String temp = json['AvailableSizes'];
      availableSizes = temp.split(",");
    }
    sizeWiseStock = json['SizeWiseStock'];

    if (json['OfferMonths'] != null) {
      String temp = json['OfferMonths'];
      offerMonths = temp.split(",");
    }

    productClass = json['ProductClass'];
    promoted = json['Promoted'] == 1 ;
    secondary = json['Secondary'] == 1;
    deactivated = json['Deactivated'] ==1;
    defaultSize = json['DefaultSize'];
    material = json['Material'];
    quality = json['Quality'];
    qRCode2 = json['QRCode2'];
    displayName = json['DisplayName'];
    displayOrder = json['DisplayOrder'];
    minQuantity = json['MinQuantity'];
    maxQuantity = json['MaxQuantity'];
    qPSCode = json['QPSCode'];
    demandType = json['DemandType'];
    image = json['Image'];
    imageUrl = json['ImageUrl'];
    adShoot = json['AdShoot'] == 1;
    technology = json['Technology'];
    imageAlt = json['ImageAlt'];
    technologyImage = json['TechnologyImage'];
    technologyImageUrl = json['TechnologyImageUrl'];
    isCore = json['IsCore'] == 1;
    minimumArticleQuantity = json['MinimumArticleQuantity'];
    likeabilty = json['Likeabilty'];
    brandRank = json['BrandRank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Season'] = this.season;
    data['Brand'] = this.brand;
    data['Mood'] = this.mood;
    data['Gender'] = this.gender;
    data['Theme'] = this.theme;
    data['Category'] = this.category;
    data['Name'] = this.name;
    data['Color'] = this.color;
    data['Option'] = this.option;
    data['MRP'] = this.mRP;
    data['SubCategory'] = this.subCategory;
    data['Collection'] = this.collection;
    data['Fit'] = this.fit;
    data['Description'] = this.description;
    data['QRCode'] = this.qRCode;
    data['Looks'] = this.looks;
    data['LooksImageUrl'] = this.looksImageUrl;
    data['LooksImage'] = this.looksImage;
    data['Fabric'] = this.fabric;
    if (this.eAN != null) {
      //convert the ean as comma separated string
      data['EAN'] = this.eAN?.keys.toList().join(",");
    }
    data['Finish'] = this.finish;
    data['AvailableSizes'] = this.availableSizes?.join(",");
    data['SizeWiseStock'] = this.sizeWiseStock;
    data['OfferMonths'] = this.offerMonths?.join(",");
    data['ProductClass'] = this.productClass;
    data['Promoted'] = this.promoted ?? false ? 1 : 0;
    data['Secondary'] = this.secondary ?? false ? 1 : 0;
    data['Deactivated'] = this.deactivated ?? false ? 1 : 0;
    data['DefaultSize'] = this.defaultSize;
    data['Material'] = this.material;
    data['Quality'] = this.quality;
    data['QRCode2'] = this.qRCode2;
    data['DisplayName'] = this.displayName;
    data['DisplayOrder'] = this.displayOrder;
    data['MinQuantity'] = this.minQuantity;
    data['MaxQuantity'] = this.maxQuantity;
    data['QPSCode'] = this.qPSCode;
    data['DemandType'] = this.demandType;
    data['Image'] = this.image;
    data['ImageUrl'] = this.imageUrl;
    data['AdShoot'] = this.adShoot ?? false ? 1 : 0;
    data['Technology'] = this.technology;
    data['ImageAlt'] = this.imageAlt;
    data['TechnologyImage'] = this.technologyImage;
    data['TechnologyImageUrl'] = this.technologyImageUrl;
    data['IsCore'] = this.isCore ?? false ? 1 : 0;
    data['MinimumArticleQuantity'] = this.minimumArticleQuantity;
    data['Likeabilty'] = this.likeabilty;
    data['BrandRank'] = this.brandRank;
    return data;
  }
}

class Brands {
  String? name;
  int? mOQ;

  Brands({this.name, this.mOQ});

  Brands.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    mOQ = json['MOQ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['MOQ'] = this.mOQ;
    return data;
  }
}
