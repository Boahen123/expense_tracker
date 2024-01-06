import 'package:currency_picker/currency_picker.dart';
import 'package:expense_tracker/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/illustrations/settings.svg',
                height: size.height * 0.3,
              ),
            ),
            ListTile(
              title: const Text('Change Currency'),
              trailing: Consumer(
                builder: (context, ref, child) {
                  return Text(
                    ref.read(currencyProvider).currencyName,
                  );
                },
              ),
              onTap: () {
                var value = ref.watch(currencyProvider);
                showCurrencyPicker(
                  context: context,
                  showFlag: true,
                  showCurrencyName: true,
                  showCurrencyCode: true,
                  onSelect: (Currency currency) {
                    value.changeName(currency.name, currency.symbol);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
