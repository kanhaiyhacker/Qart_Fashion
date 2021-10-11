const PRODUCTS_TABLE = "products";
const DATABASE_NAME = "products_database.db";

//query string
const CREATE_PRODUCT_TABLE =
    'CREATE TABLE $PRODUCTS_TABLE(Option TEXT PRIMARY KEY, Season TEXT,Brand TEXT,'
    'Mood TEXT,Gender TEXT,Theme TEXT,Category TEXT,Name TEXT,Color TEXT,MRP float,SubCategory TEXT,'
    'Collection TEXT,Fit TEXT,Description TEXT,QRCode TEXT,Looks TEXT,LooksImageUrl TEXT,LooksImage TEXT,'
    'Fabric TEXT,EAN TEXT,Finish TEXT,AvailableSizes TEXT,SizeWiseStock TEXT,OfferMonths TEXT,ProductClass INT,'
    'Promoted INT,Secondary INT,Deactivated INT,DefaultSize TEXT,Material TEXT,Quality TEXT,QRCode2 TEXT,'
    'DisplayName TEXT,DisplayOrder INT,MinQuantity INT,MaxQuantity INT,QPSCode TEXT,DemandType TEXT,Image TEXT,'
    'ImageUrl TEXT,AdShoot INT,Technology TEXT,ImageAlt TEXT,TechnologyImage TEXT,'
    'TechnologyImageUrl TEXT,IsCore INT,MinimumArticleQuantity INT,Likeabilty float,BrandRank TEXT)';

String getSearchQuery(String query) =>
    "Option LIKE '$query%' OR QRCode LIKE '$query%'";
