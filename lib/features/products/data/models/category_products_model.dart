class CategoryProductModel {
 final bool status;
 final dynamic message;
 final ProductDataModel data;

  CategoryProductModel({required this.status, this.message, required this.data});

 factory CategoryProductModel.fromJson(Map<String, dynamic> json) {
  return CategoryProductModel(
    status: json['status'],
    message: json['message'],
    data: ProductDataModel.fromJson(json['data'],),
  );
  }
}

class ProductDataModel {
  final int currentPage;
  final List<ProductModel> data;

  ProductDataModel({required this.currentPage, required this.data});

 factory ProductDataModel.fromJson(Map<String, dynamic> json) {
  return ProductDataModel(
    currentPage: json['current_page'],
    data: List<ProductModel>.from(json['data'].map((x) => ProductModel.fromJson(x))),
  );
  }
}

class ProductModel {
  final int id;
  final num price;
  final num oldPrice;
  final num discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  ProductModel(
      {
        required this.id,
        required this.price,
        required this.oldPrice,
        required this.discount,
        required this.image,
        required this.name,
        required this.description,
        required this.images,
        required this.inFavorites,
        required this.inCart});

 factory ProductModel.fromJson(Map<String, dynamic> json) {
   return ProductModel(
     id: json['id'],
     price: json['price'],
     oldPrice: json['old_price'],
     discount: json['discount'],
     image: json['image'],
     name: json['name'],
     description: json['description'],
     images: List<String>.from(json['images'].map((x) => x)),
     inFavorites: json['in_favorites'],
     inCart: json['in_cart'],
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
//                 "id": 52,
//                 "price": 25000,
//                 "old_price": 25000,
//                 "discount": 0,
//                 "image": "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg",
//                 "name": "ابل ايفون 12 برو ماكس - 256جيجابيت, ازرق",
//                 "description": "الحجم: ٦.٧ بوصة\r\nالدقة: 2778 × 1284 بكسل ، 458 نقطة في البوصة\r\nالتكنولوجيا: OLED\r\nالشاشة للجسم: 87.45٪\r\nسطوع الذروة: 1200 شمعة / م 2 (نيت)\r\nالميزات: دعم فيديو HDR ، طلاء مقاوم للزيوت ، زجاج مقاوم للخدش (درع سيراميك) ، مستشعر الإضاءة المحيطة ، مستشعر القرب\r\nالمعدات\r\nشريحة النظام: Apple A14 Bionic\r\nالمعالج: Hexa-core، 64-bit، 5 nm\r\nوحدة معالجة الرسومات: نعم\r\nذاكرة الوصول العشوائي: 6 جيجابايت LPDDR5\r\nالتخزين الداخلي: 128 جيجا بايت (NVMe) ، غير قابلة للتوسيع\r\nنوع الجهاز: هاتف ذكي\r\nنظام التشغيل: iOS (14.x)\r\nالبطارية\r\nالنوع: Li-Ion ، غير قابل للاستبدال بواسطة المستخدم\r\nالشحن: توصيل طاقة USB ، شحن لاسلكي Qi ، شحن لاسلكي MagSafe\r\nسرعة الشحن القصوى: لاسلكي: 15.0 واط\r\nكاميرا\r\nالخلفية: كاميرا ثلاثية\r\nالكاميرا الرئيسية: 12 ميجابكسل (OIS ، PDAF)\r\nالمواصفات: حجم الفتحة: F1.6 ؛ الطول البؤري: 26 مم ؛ حجم البكسل: 1.7 ميكرومتر\r\nكاميرا ثانية: 12 ميجا بيكسل (Telephoto، OIS، PDAF)\r\nالمواصفات: تقريب بصري: 2x؛ حجم الفتحة: F2.2 ؛ الطول البؤري: 65 مم\r\nالكاميرا الثالثة: 12 ميجابكسل (فائقة الاتساع)\r\nالمواصفات: حجم الفتحة: F2.4 ؛ الطول البؤري: 13 ملم\r\nتسجيل الفيديو: 3840 × 2160 (4K UHD) (60 إطارًا في الثانية) ، 1920 × 1080 (Full HD) (240 إطارًا في الثانية) ، 1280 × 720 (HD) (30 إطارًا في الثانية)\r\nالميزات: OIS ، HDR ، فيديو الفاصل الزمني ، ضبط تلقائي للصورة مستمر ، التقاط الصور أثناء تسجيل الفيديو ، إضاءة الفيديو\r\nالأمامية: 12 ميجابكسل (وقت الطيران (ToF) ، EIS ، HDR ، مقاطع فيديو بطيئة الحركة)\r\nالتقاط الفيديو: 3840 × 2160 (4K UHD) (60 إطارًا في الثانية)\r\nالتصميم\r\nالأبعاد: 6.33 × 3.07 × 0.29 بوصة (160.84 × 78.09 × 7.39 ملم)\r\nالوزن: 8.03 أوقية (228.0 جم)\r\nالمواد: الظهر: زجاج ؛ الإطار: ستانلس ستيل\r\nالمواد والألوان: الأزرق الباسيفيكي\r\nالمقاومة: ماء ، رذاذ ، غبار. IP68\r\nالقياسات الحيوية: فتح الوجه ثلاثي الأبعاد\r\nالمفاتيح: اليسار: التحكم في مستوى الصوت ، أخرى ؛ اليمين: مفتاح القفل / فتح القفل\r\nخلوي\r\n5G: n1، n2، n3، n5، n7، n8، n12، n20، n25، n28، n38، n40، n41، n66، n71، n77، n78، n79، n260، n261، Sub-6، mmWave\r\nLTE (FDD): النطاقات 1 (2100) ، 2 (1900) ، 3 (1800) ، 4 (AWS-1) ، 5 (850) ، 7 (2600) ، 8 (900) ، 12 (700 أ) ، 13 (700 ج) ، 14 (700 بس) ، 17 (700 ب) ، 18 (800 أقل) ، 19 (800 علوي) ، 20 (800 دد) ، 25 (1900+) ، 26 (850+) ، 28 (700) APT) ، 29 (700 د) ، 30 (2300 واط) ، 32 (1500 نطاق L) ، 66 (AWS-3) ، 71 (600)\r\nLTE (TDD): النطاقات 34 (2000) ، 38 (2600) ، 39 (1900+) ، 40 (2300) ، 41 (2600+) ، 42 (3500) ، 46 ، 48 (3600)\r\nUMTS: 850 ، 900 ، 1700/2100 ، 1900 ، 2100 ميجا هرتز\r\nسرعة البيانات: LTE-A ، HSDPA + (4G) 42.2 ميجابت / ثانية ، HSUPA 5.76 ميجابت / ثانية ، UMTS\r\nبطاقتي SIM: نعم\r\nنوع بطاقة SIM: Nano SIM ، eSIM\r\nصوت عالي الدقة: نعم\r\nVoLTE: نعم\r\nالوسائط المتعددة\r\nسماعات الرأس: لا يوجد مقبس 3.5 ملم\r\nمكبرات الصوت: سماعة أذن ، مكبر صوت\r\nالميزات: Dolby Atmos\r\nانعكاس الشاشة: مشاركة الشاشة لاسلكيًا\r\nميكروفون (مكبرات) إضافية: لإلغاء الضوضاء\r\nالاتصال والميزات\r\nالبلوتوث: 5.0\r\nشبكة Wi-Fi: 802.11 a ، b ، g ، n ، ac ، ax (Wi-Fi 6) ، ثنائي النطاق ؛ تقنية MIMO و Wi-Fi Direct و Hotspot\r\nUSB: لايتنينج\r\nالميزات: الشحن ، منفذ سماعات الرأس\r\nالموقع: GPS ، A-GPS ، Glonass ، Galileo ، BeiDou ، QZSS ، معرف الخلية ، تحديد المواقع عبر Wi-Fi\r\nالمستشعرات: مقياس تسارع ، جيروسكوب ، بوصلة ، بارومتر ، ماسح ضوئي ليدار\r\nأخرى: NFC ، UMA (اتصال Wi-Fi)\r\nمتوافقة مع المعينات السمعية: M3 ، T4\r\nالماركة: آبل\r\nاللون: أزرق\r\nنوع نظام التشغيل: iOS\r\nسعة التخزين: 128 جيجابايت\r\nعدد مداخل ال SIM: شريحة واحدة و E-SIM\r\nدقة الكاميرا الخلفية: 12 ميجابكسل\r\nنوع الهاتف المحمول: Mobile Phone\r\nتقنية الشبكة الخلوية: 5G\r\nالشركة المصنعة للشرائح: Apple\r\nحجم الشاشة (انش): 6.7 انش\r\nرقم الموديل: iPhone 12 Pro Max\r\nسعة البطارية بالمللي امبير: 3687 مللي امبير\r\nالشحن السريع: نعم\r\nذاكرة الرام: 6 جيجا بايت",
//                 "images": [
//                     "https://student.valuxapps.com/storage/uploads/products/1615440322UAwSF.81KcqNGQIsL._SL1500_.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615440322UjY4o.71DVgBTdyLL._SL1500_.jpg"
//                 ],
//                 "in_favorites": false,
//                 "in_cart": false
//             },
//             {
//                 "id": 53,
//                 "price": 5599,
//                 "old_price": 10230,
//                 "discount": 45,
//                 "image": "https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg",
//                 "name": "مكبر صوت بلوتوث مقاوم للمياه ومحمول اكستريم 2 من جيه بي ال JBLXTREME2BLUAM - ازرق",
//                 "description": "مدة تشغيل الموسيقى: 15 ساعة\r\nالطاقة المخرجة (وات): 2 × 20\r\nالأبعاد: 13.6 × 28.8 × 13.2 سنتيمتر\r\nالوزن: 2.39 كيلوجرام\r\nاصدار البلوتوث: 4.2\r\nسعة البطارية: 10000 مللي امبير في الساعة\r\nمدة الشحن: 3 ساعات ونصف\r\nمدخل كابل صوت 3.5 ملم: متاح\r\nخاصية إيقاف التشغيل التلقائي: متاحة\r\nتقنية البلوتوث: متاحة\r\nيدعم تطبيق جيه بي ال كونيكت+: نعم \r\nشاحن باور بانك: متاح\r\nمكبر صوت خارجي: متاح\r\nخاصية المساعد الصوتي: متاحة\r\nمقاوم للمياه: نعم",
//                 "images": [
//                     "https://student.valuxapps.com/storage/uploads/products/1615440689Oojt6.item_XXL_36330138_142814947.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/16154406895ynKU.item_XXL_36330138_142814944.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615440689MjvIY.item_XXL_36330138_142814940.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615440689QITsu.item_XXL_36330138_142814934.jpeg"
//                 ],
//                 "in_favorites": false,
//                 "in_cart": false
//             },
//             {
//                 "id": 54,
//                 "price": 11499,
//                 "old_price": 12499,
//                 "discount": 8,
//                 "image": "https://student.valuxapps.com/storage/uploads/products/1615441020ydvqD.item_XXL_51889566_32a329591e022.jpeg",
//                 "name": "تليفزيون سمارت 65 بوصة 4K الترا اتش دي منحني من سامسونج UA65RU7300RXUM",
//                 "description": "العلامة التجارية: سامسونج\r\nاللون: اسود\r\nالموديل: UA65RU7300\r\nالنوع: منحني\r\nالحجم: 65 بوصة\r\nمنفذ اتش دي ام اي: 3\r\nمنفذ يو اس بي: 2\r\nتليفزيون سمارت: نعم\r\nجهاز تحكم عن بعد واحد: نعم\r\nالدقة: 3,840 × 2,160\r\nالوزن: 25.0 كجم\r\nالابعاد (عرض × طول × عمق): 145.27 × 83.81 × 12.09 سم\r\nتقنية الذكاء الاصطناعي المحسّنة للصورة (AI Upscale): لا يوجد\r\nتقنية العرض الذكي (سمارت فيو): نعم",
//                 "images": [
//                     "https://student.valuxapps.com/storage/uploads/products/1615441020SnVry.item_XXL_51889566_32a329591e022.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615441020mgFw2.item_XXL_51889566_8dbac7d5b2039.jpeg"
//                 ],
//                 "in_favorites": false,
//                 "in_cart": false
//             },
//             {
//                 "id": 55,
//                 "price": 44500,
//                 "old_price": 44500,
//                 "discount": 0,
//                 "image": "https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg",
//                 "name": "لاب توب ابل ماك بوك برو",
//                 "description": "يمكنك التمتع بتجربة الحوسبة بطريقة لم يسبق لها مثيل عندما تقوم باقتناء لاب توب ابل ماك بوك برو. يتميز هذا اللاب توب بمعالج انتل كور i5 من الجيل الثامن بتردد 2.3 جيجاهرتز والذي يضمن لك استمرار أداء النظام بكفاءة عالية. استمتع بتجربة تعدد المهام على نحو سلس وسريع باستخدام ذاكرة الوصول العشوائي بسعة 8 جيجا. يقدم لك معالج الرسومات الجرافيكية انتل ايريس بلس Intel Iris Plus Graphics صور بجودة عالية ويجعل تجربة اللعب الخاصة بك سلسة وممتعة بشكل لم يسبق له مثيل. يوفر نظام التشغيل ماك او اس macOS العديد من الميزات سهلة الاستخدام. قم بتخزين الأفلام المفضلة لديك، والتسجيلات الصوتية، والملفات الهامة الأخرى الخاصة بك بشكل مريح على الذاكرة اس اس دي SSD سعة 512 جيجا. تسمح لك شاشة العرض الرائعة حجم 13.3 انش بعرض الافلام المفضلة لديك والمحتويات الاخرى بجودة عالية. تتميز شاشة ريتينا Retina بإضاءة خلفية ال اي دي زاهية ونسبة تباين عالية تعزز تجربة المشاهدة الخاصة بك. توفر تقنية ترو تون True Tone تجربة مشاهدة طبيعية عن طريق ضبط توازن اللون الأبيض للشاشة حسب درجة حرارة لون الضوء من حولك. يتميز هذا اللاب توب بمخرجات صوتية متوازنة، وعالية الدقة، ونابضة بالحياة، ويوفر لك تجربة صوتية غامرة. تسمح لك شريحة ابل تي Apple T2 بتخزين البيانات الخاصة بك بتنسيق مشفر بمساعدة المعالج الثانوي سيكيور انكليف Secure Enclave. وعلاوة على ذلك، تعمل هذه الشريحة المتطورة على تعزيز وتشديد الحماية والامان لبياناتك بمساعدة من مستشعر التعرف على الهوية عن طريق اللمس Touch ID. يسمح لك هذا المستشعر المتقدم بإلغاء قفل الكمبيوتر المحمول باستخدام بصمات أصابعك فقط. تعمل عناصر التحكم بالشريط اللمسي Touchbar على تبسيط الأنشطة المختلفة مثل إرسال بريد إلكتروني أو تنسيق مستند معين. يمكن حمل لاب توب ابل ماك بوك برو خفيف الوزن بسهولة في حقيبة الظهر الخاصة بك. يتميز هذا اللاب توب باللون الرمادي والذي يضفي عليه مظهراً مميزاً وجميلاً.",
//                 "images": [
//                     "https://student.valuxapps.com/storage/uploads/products/1615442168ijV8V.item_XXL_36581132_143760083.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/161544216881jxI.item_XXL_36581132_143760084.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615442168uZNcz.item_XXL_36581132_143760087.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615442168VnIxG.item_XXL_36581132_143760088.jpeg"
//                 ],
//                 "in_favorites": false,
//                 "in_cart": false
//             },
//             {
//                 "id": 56,
//                 "price": 32860,
//                 "old_price": 35000,
//                 "discount": 6,
//                 "image": "https://student.valuxapps.com/storage/uploads/products/1615450256e0bZk.item_XXL_7582156_7501823.jpeg",
//                 "name": "نيكون FX-format D750 - 24.3 ميجابيكسيل,كاميرا اس ال ار , عدسه 24-120 ملم, اسود",
//                 "description": "كاميرا نيكون FX-format D750 تأتي محملة بخصائص متطورة تمنحك التحكم الكامل لتتمكن من التقاط الصور الواضحة للحظات حياتك. هذه الكاميرا صغيرة الحجم تأتي مع عدسة NIKKOR 24 - 120 ملم المثالية لالتقاط صور شخصية و صور للمناظر الطبيعية و صور حفلات الزفاف. على الرغم من ان هذا الجهاز صغير وخفيف الوزن لكنه يمنحك اداء ممتاز. استشعار CMOS بعدسة 24.3 ميغا بكسل و محرك EXPEED 4 يمنحانك القدرة على التقاط صور و مقاطع فيديو ممتازة حتى في ظروف الاضاءة المحيطة الخافتة. لهذه الكاميرا السوداء قائمة تصوير افلام مع إعدادات تحكم لتتمكن من تسجيل افلام 1080/60بكسل بوضوح فل اتش دي مع الحد الادنى من التموّج و التشويش. و تضم كاميرا نيكون FX-format D750 شاشة تي اف تي ال سي دي حجمها 3.2 انش و تعمل بدقة 1229K نقطة، لتتمكن من التقاط صور من زوايا مختلفة او اعادة عرض ما قمت بتصويره. واي فاي المدمج بهذه الكاميرا يمكنك من مشاركة الصور التي تلتقطها و الفيديوهات مع العالم. كل هذه الخصائص و اكثر تجعل كاميرا نيكون FX-format D750 مثالية للمصورين المحترفين و الشبه محترفين.",
//                 "images": [
//                     "https://student.valuxapps.com/storage/uploads/products/1615450256RlWor.item_XXL_7582156_7501823.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615450256gJZZG.item_XXL_7582156_7501825.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615450256R7y4x.item_XXL_7582156_7501827.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615450256NMmZ7.item_XXL_7582156_7501828.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615450256zSjsY.item_XXL_7582156_7501830.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615450256CbCNI.item_XXL_7582156_7501832.jpeg"
//                 ],
//                 "in_favorites": false,
//                 "in_cart": false
//             },
//             {
//                 "id": 57,
//                 "price": 530,
//                 "old_price": 530,
//                 "discount": 0,
//                 "image": "https://student.valuxapps.com/storage/uploads/products/1615451352LMOAF.item_XXL_23705724_34135503.jpeg",
//                 "name": "هارد اس اس دي داخلي 240 جيجابايت A400 ساتا 3 من كينجستون - 2.5 بوصة - SA400S37/240G",
//                 "description": "العلامة التجارية : كينغستون\r\nسعة التخزين : 240 جيجابايت\r\nأنظمة التشغيل المتوافقة : ويندوز\r\nنوعية الوصل : ساتا\r\nصنف قرص التخزين : اس اس دي\r\nطبيعة قرص التخرين : داخلي لابتوب",
//                 "images": [
//                     "https://student.valuxapps.com/storage/uploads/products/16154513529ml4b.item_XXL_23705724_34135503.jpeg",
//                     "https://student.valuxapps.com/storage/uploads/products/1615451352LKVSq.item_XXL_23705724_34135507.jpeg"
//                 ],
//                 "in_favorites": false,
//                 "in_cart": false
//             },
//             {
//                 "id": 82,
//                 "price": 3075.260000000000218278728425502777099609375,
//                 "old_price": 3075.260000000000218278728425502777099609375,
//                 "discount": 0,
//                 "image": "https://student.valuxapps.com/storage/uploads/products/1638734961565J3.11.jpg",
//                 "name": "موبايل شاومي ريدمي 10 بشريحتي اتصال - 6.53 بوصة فل اتش دي ، 64 جيجا ، 4 جيجا رام ، شبكة الجيل الرابع ال تي اي - رمادي كربوني",
//                 "description": "اسم الطراز\tXiaomi Redmi 10\r\nالناقل اللاسلكي\tجميع الناقلين\r\nالعلامة التجارية\tXiaomi\r\nعامل الشكل\tFoldable Screen\r\nسعة تخزين الذاكرة\t4 غيغابايت\r\nنظام التشغيل\tAndroid 11.0\r\nاللون\tرمادي كربون\r\nالتكنولوجيا الخلوية\tLTE\r\nعدد فتحات بطاقة SIM\tبشريحتين\r\nالسنة\t2021\r\n--------------------\r\nكاميرا رباعية مزودة بتقنية الذكاء الاصطناعي AI، وحدة معالجة مركزية للألعاب\r\nشاشة 90 هرتز FHD+\r\nبطارية 5000 ميلي أمبير في الساعة\r\nشحن سريع\r\nالوزن: 181 جرام\r\nمعالج Helio G88 ثماني النواة\r\nالكاميرا الخلفية: 50 ميجابيكسل\r\nالكاميرا الأمامية: 8 ميجابيكسل\r\nالأبعاد: 161.95 ملم × 75.53 ملم × 8.92 ملم\r\nعملية تصنيع 12 نانومتر",
//                 "images": [
//                     "https://student.valuxapps.com/storage/uploads/products/163873496133DmC.11.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638734961lq9NM.12.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638734961JJsUU.13.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638734961M75SS.14.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638734961oRfP5.15.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/16387349613Ufwq.16.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638734961xdhWc.17.jpg"
//                 ],
//                 "in_favorites": false,
//                 "in_cart": false
//             },
//             {
//                 "id": 83,
//                 "price": 444,
//                 "old_price": 656,
//                 "discount": 32,
//                 "image": "https://student.valuxapps.com/storage/uploads/products/1638735246ToPmP.21.jpg",
//                 "name": "سوار شاومي مي الذكي 5 - اسود",
//                 "description": "العلامة التجارية\tشاومي\r\nمعيار الاتصالات اللاسلكية\tبلوتوث\r\nاللون\tأسود\r\nالأجهزة المتوافقة\tمتعدد\r\nمدخل واجهة المستخدم\tشاشة لمس\r\nحجم الشاشة\t3 بوصة\r\nعرض الشريط\t15 مليمترات\r\nالناقل اللاسلكي\t3\r\n---------------\r\nحول هذه السلعة\r\nتصميم خفيف الوزن\r\nمصنوع من مواد عالية الجودة\r\nمقاوم للماء",
//                 "images": [
//                     "https://student.valuxapps.com/storage/uploads/products/163873524655oou.21.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638735246umUmo.22.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638735246fXBko.23.jpg"
//                 ],
//                 "in_favorites": false,
//                 "in_cart": false
//             },
//             {
//                 "id": 86,
//                 "price": 1596.920000000000072759576141834259033203125,
//                 "old_price": 2659.0500000000001818989403545856475830078125,
//                 "discount": 40,
//                 "image": "https://student.valuxapps.com/storage/uploads/products/16387377980g2kx.11.jpg",
//                 "name": "سماعات العاب لاسلكية لبلاي ستيشن 5 Pulse 3D من سوني",
//                 "description": "العلامة التجارية\tسوني\r\nاللون\tابيض واسود\r\nتقنية الاتصال\tWireless\r\nوزن السلعة\t1.5 رطل\r\nالأجهزة المتوافقة\tمتعدد\r\nتكنولوجيا الاتصالات اللاسلكية\tلا سلكي\r\n---------------\r\nحول هذه السلعة\r\nبنيت لجيل جديد\r\nضبط دقيق للصوت ثلاثي الأبعاد على وحدات تحكم PS5 1.\r\nاستمتع بألعاب مريحة مع وسادات أذن محسّنة وحزام عقال.\r\nالعب بأناقة مع تصميم أنيق يكمل وحدة تحكم PS5.\r\nمصممة للاعبين. الدردشة مع الأصدقاء من خلال ميكروفونات إلغاء الضوضاء المخفية 2.\r\nاضبط إعدادات الصوت والدردشة بسرعة باستخدام عناصر تحكم يسهل الوصول إليها.",
//                 "images": [
//                     "https://student.valuxapps.com/storage/uploads/products/1638737798SfPxq.11.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638737798ZJ4C4.12.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638737798EGD9X.13.jpg"
//                 ],
//                 "in_favorites": false,
//                 "in_cart": false
//             },
//             {
//                 "id": 87,
//                 "price": 499,
//                 "old_price": 999,
//                 "discount": 50,
//                 "image": "https://student.valuxapps.com/storage/uploads/products/1638737964KFEyZ.21.jpg",
//                 "name": "سماعات رأس لاسلكية من سوني WI-C200 - اسود",
//                 "description": "العلامة التجارية\tسوني\r\nاللون\tاسود\r\nتقنية الاتصال\tWireless\r\nوزن السلعة\t0.01 كيلوجرام\r\nالأجهزة المتوافقة\tكافة الاجهزة\r\nتكنولوجيا الاتصالات اللاسلكية\tلاسلكي\r\nالنمط\tClosed-back\r\n-----------\r\nحول هذه السلعة\r\nمتوافقة مع اجهزة متعددة وسهلة الاستخدام.\r\nصوت نقي ومتوازن\r\nسماعات مصممة ومختبرة لضمان الاستخدام الآمن.",
//                 "images": [
//                     "https://student.valuxapps.com/storage/uploads/products/1638737964rr3wr.21.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638737964AyYrU.22.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638737964rwKIT.23.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/16387379645kCy3.24.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638737964wD6NE.25.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638737964O81Zm.26.jpg",
//                     "https://student.valuxapps.com/storage/uploads/products/1638737965f9T5b.27.jpg"
//                 ],
//                 "in_favorites": false,
//                 "in_cart": false
//             }
//         ],
//         "first_page_url": "https://student.valuxapps.com/api/categories/44?page=1",
//         "from": 1,
//         "last_page": 1,
//         "last_page_url": "https://student.valuxapps.com/api/categories/44?page=1",
//         "next_page_url": null,
//         "path": "https://student.valuxapps.com/api/categories/44",
//         "per_page": 35,
//         "prev_page_url": null,
//         "to": 10,
//         "total": 10
//     }
// }
// *//