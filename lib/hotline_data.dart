import 'package:flutter/material.dart';

class HotlineEntry {
  const HotlineEntry({
    required this.name,
    required this.number,
    required this.assetPath,
  });

  final String name;
  final String number;
  final String? assetPath;
}

class HotlineCategory {
  const HotlineCategory({
    required this.title,
    required this.subtitle,
    required this.bannerPath,
    required this.icon,
    required this.entries,
  });

  final String title;
  final String subtitle;
  final String bannerPath;
  final IconData icon;
  final List<HotlineEntry> entries;
}

HotlineEntry _entry(
  String category,
  int? imageIndex,
  String name,
  String number,
) => HotlineEntry(
  name: name,
  number: number,
  assetPath: imageIndex == null
      ? null
      : 'assets/resource/images/$category/${switch (category) {
          'emergency' => 'emg',
          'pubutil' => 'pub',
          _ => category,
        }}_$imageIndex.png',
);

final travelCategory = HotlineCategory(
  title: 'สายด่วนการเดินทาง',
  subtitle: 'ติดต่อหน่วยงานด้านการเดินทางและคมนาคม',
  bannerPath: 'assets/resource/images/travel/travel_0.png',
  icon: Icons.train_rounded,
  entries: [
    _entry('travel', 1, 'กรมทางหลวงชนบท', '1146'),
    _entry('travel', 2, 'ตำรวจท่องเที่ยว', '1155'),
    _entry('travel', 3, 'ตำรวจทางหลวง', '1193'),
    _entry('travel', 4, 'สายด่วนจราจร', '1197'),
    _entry('travel', 5, 'องค์การขนส่งมวลชนกรุงเทพ (ขสมก.)', '1348'),
    _entry('travel', 6, 'บริษัท ขนส่ง จำกัด (บขส.)', '1490'),
    _entry('travel', 7, 'การทางพิเศษแห่งประเทศไทย', '1543'),
    _entry('travel', 8, 'กรมทางหลวง', '1586'),
    _entry('travel', 9, 'กรมการขนส่งทางบก', '1584'),
  ],
);

final emergencyCategory = HotlineCategory(
  title: 'สายด่วนอุบัติเหตุ-ฉุกเฉิน',
  subtitle: 'ขอความช่วยเหลือเมื่อเกิดเหตุฉุกเฉิน',
  bannerPath: 'assets/resource/images/emergency/emg_0.png',
  icon: Icons.emergency_rounded,
  entries: [
    _entry('emergency', 1, 'เหตุด่วนเหตุร้าย / ตำรวจ', '191'),
    _entry('emergency', 3, 'กรมสอบสวนคดีพิเศษ (DSI)', '1202'),
    _entry('emergency', 2, 'แจ้งเหตุเพลิงไหม้และกู้ภัย', '199'),
    _entry('emergency', 3, 'กองปราบปราม', '1195'),
    _entry('emergency', 4, 'ตำรวจน้ำ / อุบัติเหตุทางน้ำ', '1196'),
    _entry('emergency', 5, 'ศูนย์ช่วยเหลือสังคม', '1300'),
    _entry('emergency', 6, 'กรมป้องกันและบรรเทาสาธารณภัย', '1784'),
    _entry('emergency', 7, 'หน่วยแพทย์กู้ชีวิต โรงพยาบาลวชิรพยาบาล', '1554'),
    _entry('emergency', 8, 'ศูนย์เอราวัณ กรุงเทพมหานคร', '1646'),
    _entry('emergency', 9, 'สถาบันการแพทย์ฉุกเฉินแห่งชาติ', '1669'),
  ],
);

final bankCategory = HotlineCategory(
  title: 'สายด่วนธนาคาร',
  subtitle: 'ติดต่อศูนย์บริการลูกค้าของธนาคาร',
  bannerPath: 'assets/resource/images/bank/bank_0.png',
  icon: Icons.account_balance_rounded,
  entries: [
    _entry('bank', 1, 'ธนาคารกรุงเทพ', '1333'),
    _entry('bank', 2, 'ธนาคารออมสิน', '1115'),
    _entry('bank', 3, 'ธนาคารกสิกรไทย', '02-888-8888'),
    _entry('bank', 4, 'ธนาคารกรุงไทย', '02-111-1111'),
    _entry('bank', 5, 'ธนาคารกรุงศรีอยุธยา', '1572'),
    _entry('bank', 6, 'ธนาคารทหารไทยธนชาต', '1428'),
    _entry('bank', 7, 'ซิตี้แบงก์ (บริการผ่าน UOB)', '02-285-1555'),
    _entry('bank', 8, 'ธนาคารแลนด์ แอนด์ เฮ้าส์', '02-359-0000'),
    _entry('bank', 9, 'ธนาคารอาคารสงเคราะห์', '02-645-9000'),
    _entry('bank', 10, 'ธนาคารไทยพาณิชย์', '02-777-7777'),
    _entry('bank', 11, 'ธนาคารเกียรตินาคินภัทร', '02-165-5555'),
    _entry('bank', 12, 'ธนาคารไทยเครดิต', '02-697-5454'),
    _entry('bank', 13, 'ธนาคารยูโอบี ประเทศไทย', '02-285-1555'),
    _entry('bank', 14, 'ธนาคารทิสโก้', '02-633-6000'),
    _entry('bank', 15, 'ธนาคารอิสลามแห่งประเทศไทย', '1302'),
    _entry('bank', 16, 'ธนาคารซีไอเอ็มบี ไทย', '02-626-7777'),
  ],
);

final utilityCategory = HotlineCategory(
  title: 'สายด่วนสาธารณูปโภค',
  subtitle: 'แจ้งเหตุขัดข้องและสอบถามบริการสาธารณะ',
  bannerPath: 'assets/resource/images/pubutil/pub_0.png',
  icon: Icons.electrical_services_rounded,
  entries: [
    _entry('pubutil', 1, 'การไฟฟ้านครหลวง (MEA)', '1130'),
    _entry('pubutil', 2, 'การไฟฟ้าส่วนภูมิภาค (PEA)', '1129'),
    _entry('pubutil', 3, 'บริษัท โทรคมนาคมแห่งชาติ (CAT เดิม)', '1888'),
    _entry('pubutil', 4, 'การประปานครหลวง (MWA)', '1125'),
    _entry('pubutil', 5, 'การประปาส่วนภูมิภาค (PWA)', '1662'),
    _entry('pubutil', 6, 'True Call Center', '1242'),
    _entry('pubutil', 7, 'dtac Call Center', '1678'),
    _entry('pubutil', 8, 'AIS Call Center', '1175'),
  ],
);

final hotlineCategories = [
  travelCategory,
  emergencyCategory,
  bankCategory,
  utilityCategory,
];
