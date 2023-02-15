import 'package:dt_money/src/home/widgets/logo.dart';
import 'package:dt_money/src/home/widgets/new_transaction_button.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 720) {
          return const _TabletOrBiggerHeader();
        }
        return const _MobileHeader();
      },
    );
  }
}

class _TabletOrBiggerHeader extends StatelessWidget {
  const _TabletOrBiggerHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 120,
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Logo(),
            NewTransactionButton(),
          ],
        ),
      ),
    );
  }
}

class _MobileHeader extends StatelessWidget {
  const _MobileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Logo(isMobileSize: true),
          NewTransactionButton(),
        ],
      ),
    );
  }
}
