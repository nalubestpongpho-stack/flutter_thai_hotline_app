import 'package:flutter/material.dart';

import 'hotline_data.dart';
import 'hotline_list_ui.dart';

class BankUI extends StatelessWidget {
  const BankUI({super.key});

  @override
  Widget build(BuildContext context) => HotlineListUI(category: bankCategory);
}
