import '../../domain/account_source.dart';

class AccountSourceMapper {
  AccountSourceMapper._();

  static String toDisplayName(AccountSource source) {
    return switch (source) {
      AccountSource.cash => 'Cash',
      AccountSource.bank => 'Bank',
      AccountSource.eWallet => 'E-wallet',
    };
  }

  static AccountSource fromDisplayName(String displayName) {
    return switch (displayName) {
      'Cash' => AccountSource.cash,
      'Bank' => AccountSource.bank,
      'E-wallet' => AccountSource.eWallet,
      _ => AccountSource.cash,
    };
  }
}
