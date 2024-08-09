// dummy_data.dart

final List<Map<String, String>> categories = [
  {'ct_idx': '1', 'img': 'http://bground.api.dmonster.kr/api/upload/category/cate_ic01.svg', 'ct_name': '아우터'},
  {'ct_idx': '2', 'img': 'http://bground.api.dmonster.kr/api/upload/category/cate_ic02.svg', 'ct_name': '상의'},
  {'ct_idx': '3', 'img': 'http://bground.api.dmonster.kr/api/upload/category/cate_ic03.svg', 'ct_name': '하의'},
  {'ct_idx': '4', 'img': 'http://bground.api.dmonster.kr/api/upload/category/cate_ic04.svg', 'ct_name': '슈즈'},
  {'ct_idx': '5', 'img': 'http://bground.api.dmonster.kr/api/upload/category/cate_ic05.svg', 'ct_name': '세트/한벌옷'},
  {'ct_idx': '6', 'img': 'http://bground.api.dmonster.kr/api/upload/category/cate_ic06.svg', 'ct_name': '언더웨어/홈웨어'},
  {'ct_idx': '7', 'img': 'http://bground.api.dmonster.kr/api/upload/category/cate_ic07.svg', 'ct_name': '악세서리'},
  {'ct_idx': '8', 'img': 'http://bground.api.dmonster.kr/api/upload/category/cate_ic08.svg', 'ct_name': '베이비 잡화'},
];

final Map<int, List<String>> subCategories = {
  1: ['자켓', '가디건/베스트', '코트', '후드집업'],
  2: ['긴팔티셔츠', '반팔/민소매티셔츠', '블라우스/셔츠', '니트/스웨터'],
  3: ['긴바지', '반바지', '스커트', '레깅스'],
  4: ['스니커즈', '구두', '부츠', '샌들/슬리퍼'],
  5: ['상의의 세트', '바디수트/우주복', '점프수트', '수영복'],
  6: ['언더웨어', '파자마', '내의', '실내복'],
  7: ['주얼리', '모자', '가방', '헤어액세서리'],
  8: ['양말/덧신', '손싸개/발싸개', '겉싸개/속싸개', '턱받이'],
};
