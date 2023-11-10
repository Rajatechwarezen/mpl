import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mplpro/screen/wallet/walletHestory.dart';

class AllHestory extends StatefulWidget {
  const AllHestory({super.key});

  @override
  State<AllHestory> createState() => _AllHestoryState();
}

class _AllHestoryState extends State<AllHestory> {
  @override
  Widget build(BuildContext context) {
    return  Myhestory(data: [],);
  }
}