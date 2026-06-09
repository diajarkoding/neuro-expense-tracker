// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseDetailControllerHash() =>
    r'5584c76500a26467c49e44e9221c928fcc45db25';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ExpenseDetailController
    extends BuildlessAutoDisposeNotifier<ExpenseDetailState> {
  late final String id;

  ExpenseDetailState build(String id);
}

/// See also [ExpenseDetailController].
@ProviderFor(ExpenseDetailController)
const expenseDetailControllerProvider = ExpenseDetailControllerFamily();

/// See also [ExpenseDetailController].
class ExpenseDetailControllerFamily extends Family<ExpenseDetailState> {
  /// See also [ExpenseDetailController].
  const ExpenseDetailControllerFamily();

  /// See also [ExpenseDetailController].
  ExpenseDetailControllerProvider call(String id) {
    return ExpenseDetailControllerProvider(id);
  }

  @override
  ExpenseDetailControllerProvider getProviderOverride(
    covariant ExpenseDetailControllerProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'expenseDetailControllerProvider';
}

/// See also [ExpenseDetailController].
class ExpenseDetailControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          ExpenseDetailController,
          ExpenseDetailState
        > {
  /// See also [ExpenseDetailController].
  ExpenseDetailControllerProvider(String id)
    : this._internal(
        () => ExpenseDetailController()..id = id,
        from: expenseDetailControllerProvider,
        name: r'expenseDetailControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$expenseDetailControllerHash,
        dependencies: ExpenseDetailControllerFamily._dependencies,
        allTransitiveDependencies:
            ExpenseDetailControllerFamily._allTransitiveDependencies,
        id: id,
      );

  ExpenseDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  ExpenseDetailState runNotifierBuild(
    covariant ExpenseDetailController notifier,
  ) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(ExpenseDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExpenseDetailControllerProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    ExpenseDetailController,
    ExpenseDetailState
  >
  createElement() {
    return _ExpenseDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseDetailControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExpenseDetailControllerRef
    on AutoDisposeNotifierProviderRef<ExpenseDetailState> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ExpenseDetailControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          ExpenseDetailController,
          ExpenseDetailState
        >
    with ExpenseDetailControllerRef {
  _ExpenseDetailControllerProviderElement(super.provider);

  @override
  String get id => (origin as ExpenseDetailControllerProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
