class CategoriesModel {
  final bool status;
  final dynamic message;
  final Data data;

  CategoriesModel({required this.status, this.message, required this.data});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
   return CategoriesModel(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );

  }
}

class Data {
  final int currentPage;
  final List<CategoriesData> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final dynamic nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  Data(
      {required this.currentPage,
      required this.data,
      required this.firstPageUrl,
      required this.from,
      required this.lastPage,
      required this.lastPageUrl,
      this.nextPageUrl,
      required this.path,
      required this.perPage,
      this.prevPageUrl,
      required this.to,
      required this.total});

 factory Data.fromJson(Map<String, dynamic> json) {

   // if (json['data'] != null) {
   //   data = <CategoriesData>[];
   //   json['data'].forEach((v) {
   //     data.add(new CategoriesData.fromJson(v));
   //   });
   // }
   return Data(
      currentPage: json['current_page'],
      data: (json['data'] as List).map((e) => CategoriesData.fromJson(e)).toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
     path: json['path'],
     perPage: json['per_page'],
     to: json['to'],
     total: json['total'],
     prevPageUrl: json['prev_page_url'],
   );
 }

}

class CategoriesData {
 final int id;
 final String name;
 final String image;

  CategoriesData({required this.id, required this.name, required this.image});

 factory CategoriesData.fromJson(Map<String, dynamic> json) {
  return CategoriesData(
    id: json['id'],
    name: json['name'],
    image: json['image'],
  );
  }
}
//*
// {
//     "status": true,
//     "message": null,
//     "data": {
//         "current_page": 1,
//         "data": [
//             {
//                 "id": 44,
//                 "name": "electrionic",
//                 "image": "https://student.valuxapps.com/storage/uploads/categories/16893929290QVM1.modern-devices-isometric-icons-collection-with-sixteen-isolated-images-computers-periphereals-variou.jpeg"
//             },
//             {
//                 "id": 43,
//                 "name": "Prevent Corona",
//                 "image": "https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg"
//             },
//             {
//                 "id": 42,
//                 "name": "sports",
//                 "image": "https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg"
//             },
//             {
//                 "id": 40,
//                 "name": "Lighting",
//                 "image": "https://student.valuxapps.com/storage/uploads/categories/16445230161CiW8.Light bulb-amico.png"
//             },
//             {
//                 "id": 46,
//                 "name": "Clothes",
//                 "image": "https://student.valuxapps.com/storage/uploads/categories/1644527120pTGA7.clothes.png"
//             },
//             {
//                 "id": 47,
//                 "name": "Groceries",
//                 "image": "https://student.valuxapps.com/storage/uploads/categories/1722697946gR5Og.Grocery-shop-basket-med.jpg"
//             }
//         ],
//         "first_page_url": "https://student.valuxapps.com/api/categories?page=1",
//         "from": 1,
//         "last_page": 1,
//         "last_page_url": "https://student.valuxapps.com/api/categories?page=1",
//         "next_page_url": null,
//         "path": "https://student.valuxapps.com/api/categories",
//         "per_page": 35,
//         "prev_page_url": null,
//         "to": 6,
//         "total": 6
//     }
// }
// *//