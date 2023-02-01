// import 'dart:math';
// // import 'package:card_scanner_example/scan_option_configure_widget/scan_option_configure_widget.dart';
// import 'package:credit_card_scanner/credit_card_scanner.dart';
// import 'package:credit_card_scanner/models/card_details.dart';
// import 'package:credit_card_scanner/models/card_scan_options.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// // import 'package:card_scanner/card_scanner.dart';
//
// class ScanCard extends StatefulWidget {
//   const ScanCard({Key? key}) : super(key: key);
//
//   @override
//   State<ScanCard> createState() => _ScanCardState();
// }
//
// class _ScanCardState extends State<ScanCard> {
//
//   CardDetails? _cardDetails;
//   CardScanOptions scanOptions = CardScanOptions(
//     scanCardHolderName: true,
//     // enableDebugLogs: true,
//     validCardsToScanBeforeFinishingScan: 5,
//     possibleCardHolderNamePositions: [
//       CardHolderNameScanPosition.aboveCardNumber,
//     ],
//   );
//
//   Future<void> scanCard() async {
//     var cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
//     if (!mounted) return;
//
//     debugPrint(cardDetails.toString());
//     setState(() {
//       _cardDetails = cardDetails;
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('card_scanner app'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 scanCard();
//               },
//               child: Text('scan card'),
//             ),
//             Text('$_cardDetails'),
//             // Expanded(
//             //   child: OptionConfigureWidget(
//             //     initialOptions: scanOptions,
//             //     onScanOptionChanged: (newOptions) => scanOptions = newOptions,
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
