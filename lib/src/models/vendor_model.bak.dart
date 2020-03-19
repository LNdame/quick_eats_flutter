class Vendor {

   final int  vendorID;
   final int  countryID;
   final int  userID;
  final String name;
  final String  description;
   final String  phoneNumber;
   final String addressLine1  ;
   final String addressLine2 ;
   final String  city;
   final String state ;
   final String  latitude;
   final String longitude;
   final String dateAdded;
   final String emailAddress;
   final String facebookUri;
   final String twitterUri;
   final String instagramUri;
   final String profilePictureUri;

   Vendor({this.vendorID, this.countryID, this.userID, this.name,
       this.description, this.phoneNumber, this.addressLine1, this.addressLine2,
       this.city, this.state, this.latitude, this.longitude, this.dateAdded,
       this.emailAddress, this.facebookUri, this.twitterUri, this.instagramUri,
       this.profilePictureUri});

   Vendor.fromJson(Map<String, dynamic> jsonData)
    :vendorID =jsonData['vendorID'],
     countryID=jsonData['countryID'],
   userID=jsonData['userID'],
    name=jsonData['name'],
     description=jsonData['description'],
     phoneNumber=jsonData['phoneNumber'],
   addressLine1  =jsonData['addressLine1'],
    addressLine2 =jsonData['addressLine2'],
     city=jsonData['city'],
   state =jsonData['state'],
     latitude=jsonData['latitude'],
   longitude=jsonData['longitude'],
   dateAdded=jsonData['dateAdded'],
    emailAddress=jsonData['emailAddress'],
    facebookUri=jsonData['facebookUri'],
    twitterUri=jsonData['twitterUri'],
    instagramUri=jsonData['instagramUri'],
    profilePictureUri=jsonData['profilePictureUri'] ;


   Map<String, dynamic>toJson()=>{
   "vendorID":vendorID,
   "countryID":countryID,
   "userID":userID,
   "name":name,
   "description":description,
   "latitude":latitude,
   "longitude":longitude,
   "dateAdded":dateAdded,
   "addressLine1": addressLine1,
   "addressLine2": addressLine2,
   "city": city,
   "state":state ,
   "emailAddress":emailAddress ,
   "phoneNumber":phoneNumber,
   "facebookUri":facebookUri ,
   "twitterUri":twitterUri ,
   "instagramUri": instagramUri,
   "profilePictureUri":profilePictureUri
   };


}


