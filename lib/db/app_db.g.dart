// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $CustomerTable extends Customer
    with TableInfo<$CustomerTable, CustomerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
      'customer_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hairColorMeta =
      const VerificationMeta('hairColor');
  @override
  late final GeneratedColumn<String> hairColor = GeneratedColumn<String>(
      'hair_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, customerName, hairColor];
  @override
  String get aliasedName => _alias ?? 'customer';
  @override
  String get actualTableName => 'customer';
  @override
  VerificationContext validateIntegrity(Insertable<CustomerData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    } else if (isInserting) {
      context.missing(_customerNameMeta);
    }
    if (data.containsKey('hair_color')) {
      context.handle(_hairColorMeta,
          hairColor.isAcceptableOrUnknown(data['hair_color']!, _hairColorMeta));
    } else if (isInserting) {
      context.missing(_hairColorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      customerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_name'])!,
      hairColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hair_color'])!,
    );
  }

  @override
  $CustomerTable createAlias(String alias) {
    return $CustomerTable(attachedDatabase, alias);
  }
}

class CustomerData extends DataClass implements Insertable<CustomerData> {
  final int id;
  final String customerName;
  final String hairColor;
  const CustomerData(
      {required this.id, required this.customerName, required this.hairColor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_name'] = Variable<String>(customerName);
    map['hair_color'] = Variable<String>(hairColor);
    return map;
  }

  CustomerCompanion toCompanion(bool nullToAbsent) {
    return CustomerCompanion(
      id: Value(id),
      customerName: Value(customerName),
      hairColor: Value(hairColor),
    );
  }

  factory CustomerData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerData(
      id: serializer.fromJson<int>(json['id']),
      customerName: serializer.fromJson<String>(json['customerName']),
      hairColor: serializer.fromJson<String>(json['hairColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerName': serializer.toJson<String>(customerName),
      'hairColor': serializer.toJson<String>(hairColor),
    };
  }

  CustomerData copyWith({int? id, String? customerName, String? hairColor}) =>
      CustomerData(
        id: id ?? this.id,
        customerName: customerName ?? this.customerName,
        hairColor: hairColor ?? this.hairColor,
      );
  @override
  String toString() {
    return (StringBuffer('CustomerData(')
          ..write('id: $id, ')
          ..write('customerName: $customerName, ')
          ..write('hairColor: $hairColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, customerName, hairColor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerData &&
          other.id == this.id &&
          other.customerName == this.customerName &&
          other.hairColor == this.hairColor);
}

class CustomerCompanion extends UpdateCompanion<CustomerData> {
  final Value<int> id;
  final Value<String> customerName;
  final Value<String> hairColor;
  const CustomerCompanion({
    this.id = const Value.absent(),
    this.customerName = const Value.absent(),
    this.hairColor = const Value.absent(),
  });
  CustomerCompanion.insert({
    this.id = const Value.absent(),
    required String customerName,
    required String hairColor,
  })  : customerName = Value(customerName),
        hairColor = Value(hairColor);
  static Insertable<CustomerData> custom({
    Expression<int>? id,
    Expression<String>? customerName,
    Expression<String>? hairColor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerName != null) 'customer_name': customerName,
      if (hairColor != null) 'hair_color': hairColor,
    });
  }

  CustomerCompanion copyWith(
      {Value<int>? id, Value<String>? customerName, Value<String>? hairColor}) {
    return CustomerCompanion(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      hairColor: hairColor ?? this.hairColor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (hairColor.present) {
      map['hair_color'] = Variable<String>(hairColor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerCompanion(')
          ..write('id: $id, ')
          ..write('customerName: $customerName, ')
          ..write('hairColor: $hairColor')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $CustomerTable customer = $CustomerTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [customer];
}
