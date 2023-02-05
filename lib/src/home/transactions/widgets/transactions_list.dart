// import 'package:dt_money/src/home/transactions/bloc/transaction_bloc.dart';
// import 'package:dt_money/src/home/transactions/widgets/transaction_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

// import '../../../../shared/widgets/column_builder.dart';

// class TransactionsList extends StatefulWidget {
//   const TransactionsList({super.key});

//   @override
//   State<TransactionsList> createState() => _TransactionsListState();
// }

// class _TransactionsListState extends State<TransactionsList> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TransactionBloc, TransactionsState>(
//       builder: (context, state) {
//         if (state.status == TransactionsStatus.loading) {
//           return const SizedBox();
//         }

//         if (state.status == TransactionsStatus.failure) {
//           return const Text('Error fetching');
//         }

//         if (state.status == TransactionsStatus.success) {
//           return ColumnBuilder(
//             itemCount: state.transactions!.length,
//             itemBuilder: (context, i) {
//               return Column(
//                 children: [
//                   TransactionTile(
//                     transaction: state.transactions![i],
//                     isMobile: false,
//                   ),
//                   const SizedBox(height: 8),
//                 ],
//               );
//             },
//           );
//         }

//         return const SizedBox();
//       },
//     );
//     // return Column(
//     //   children: [
//     // const TransactionsHeader(),
//     // const SearchTransactions(),
//     // LayoutBuilder(builder: (context, constraints) {
//     //   if (constraints.isDesktop) {
//     //     if (store.queriedTransactions.isEmpty) {
//     //       return Align(
//     //         alignment: Alignment.center,
//     //         child: Container(
//     //           constraints: const BoxConstraints(maxWidth: 1168),
//     //           child: ColumnBuilder(
//     //             itemCount: state.transactions.length,
//     //             itemBuilder: (context, i) {
//     //               return Column(
//     //                 children: [
//     //                   Transaction(
//     //                     transaction: state.transactions[i],
//     //                     isMobile: false,
//     //                   ),
//     //                   const SizedBox(height: 8),
//     //                 ],
//     //               );
//     //             },
//     //           ),
//     //         ),
//     //       );
//     //     } else {
//     //       return Align(
//     //         alignment: Alignment.center,
//     //         child: Container(
//     //           constraints: const BoxConstraints(maxWidth: 1168),
//     //           child: ColumnBuilder(
//     //             itemCount: state.queriedTransactions.length,
//     //             itemBuilder: (context, i) {
//     //               return Column(
//     //                 children: [
//     //                   Transaction(
//     //                     transaction: state.queriedTransactions[i],
//     //                     isMobile: false,
//     //                   ),
//     //                   const SizedBox(height: 8),
//     //                 ],
//     //               );
//     //             },
//     //           ),
//     //         ),
//     //       );
//     //     }
//     //   }
//     //   if (store.queriedTransactions.isEmpty) {
//     //     return ColumnBuilder(
//     //       itemCount: state.transactions.length,
//     //       verticalDirection: VerticalDirection.up,
//     //       itemBuilder: (context, i) {
//     //         return Column(
//     //           children: [
//     //             Transaction(transaction: state.transactions[i]),
//     //             const SizedBox(height: 12),
//     //           ],
//     //         );
//     //       },
//     //     );
//     //   } else {
//     //           return ColumnBuilder(
//     //             itemCount: state.queriedTransactions.length,
//     //             verticalDirection: VerticalDirection.up,
//     //             itemBuilder: (context, i) {
//     //               return Column(
//     //                 children: [
//     //                   Transaction(transaction: state.queriedTransactions[i]),
//     //                   const SizedBox(height: 12),
//     //                 ],
//     //               );
//     //             },
//     //           );
//     //         }
//     //       }),
//     //     ],
//     //   );
//     // }

//     // return const CircularProgressIndicator.adaptive();
//   }
// }
