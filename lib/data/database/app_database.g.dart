// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CrlTableTable extends CrlTable
    with TableInfo<$CrlTableTable, CrlTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CrlTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _crlIdMeta = const VerificationMeta('crlId');
  @override
  late final GeneratedColumn<String> crlId = GeneratedColumn<String>(
    'crl_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  @override
  late final GeneratedColumn<String> roleId = GeneratedColumn<String>(
    'role_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roleNameMeta = const VerificationMeta(
    'roleName',
  );
  @override
  late final GeneratedColumn<String> roleName = GeneratedColumn<String>(
    'role_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _programIdMeta = const VerificationMeta(
    'programId',
  );
  @override
  late final GeneratedColumn<String> programId = GeneratedColumn<String>(
    'program_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _programNameMeta = const VerificationMeta(
    'programName',
  );
  @override
  late final GeneratedColumn<String> programName = GeneratedColumn<String>(
    'program_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  @override
  late final GeneratedColumn<String> mobile = GeneratedColumn<String>(
    'mobile',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _blockMeta = const VerificationMeta('block');
  @override
  late final GeneratedColumn<String> block = GeneratedColumn<String>(
    'block',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _districtMeta = const VerificationMeta(
    'district',
  );
  @override
  late final GeneratedColumn<String> district = GeneratedColumn<String>(
    'district',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userNameMeta = const VerificationMeta(
    'userName',
  );
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
    'user_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    crlId,
    roleId,
    roleName,
    programId,
    programName,
    state,
    firstName,
    lastName,
    mobile,
    email,
    block,
    district,
    userName,
    password,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'crl_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CrlTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('crl_id')) {
      context.handle(
        _crlIdMeta,
        crlId.isAcceptableOrUnknown(data['crl_id']!, _crlIdMeta),
      );
    } else if (isInserting) {
      context.missing(_crlIdMeta);
    }
    if (data.containsKey('role_id')) {
      context.handle(
        _roleIdMeta,
        roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta),
      );
    }
    if (data.containsKey('role_name')) {
      context.handle(
        _roleNameMeta,
        roleName.isAcceptableOrUnknown(data['role_name']!, _roleNameMeta),
      );
    }
    if (data.containsKey('program_id')) {
      context.handle(
        _programIdMeta,
        programId.isAcceptableOrUnknown(data['program_id']!, _programIdMeta),
      );
    }
    if (data.containsKey('program_name')) {
      context.handle(
        _programNameMeta,
        programName.isAcceptableOrUnknown(
          data['program_name']!,
          _programNameMeta,
        ),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    }
    if (data.containsKey('mobile')) {
      context.handle(
        _mobileMeta,
        mobile.isAcceptableOrUnknown(data['mobile']!, _mobileMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('block')) {
      context.handle(
        _blockMeta,
        block.isAcceptableOrUnknown(data['block']!, _blockMeta),
      );
    }
    if (data.containsKey('district')) {
      context.handle(
        _districtMeta,
        district.isAcceptableOrUnknown(data['district']!, _districtMeta),
      );
    }
    if (data.containsKey('user_name')) {
      context.handle(
        _userNameMeta,
        userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta),
      );
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {crlId};
  @override
  CrlTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CrlTableData(
      crlId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}crl_id'],
      )!,
      roleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role_id'],
      ),
      roleName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role_name'],
      ),
      programId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}program_id'],
      ),
      programName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}program_name'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      ),
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      ),
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      ),
      mobile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      block: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}block'],
      ),
      district: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}district'],
      ),
      userName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_name'],
      ),
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      ),
    );
  }

  @override
  $CrlTableTable createAlias(String alias) {
    return $CrlTableTable(attachedDatabase, alias);
  }
}

class CrlTableData extends DataClass implements Insertable<CrlTableData> {
  final String crlId;
  final String? roleId;
  final String? roleName;
  final String? programId;
  final String? programName;
  final String? state;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? email;
  final String? block;
  final String? district;
  final String? userName;
  final String? password;
  const CrlTableData({
    required this.crlId,
    this.roleId,
    this.roleName,
    this.programId,
    this.programName,
    this.state,
    this.firstName,
    this.lastName,
    this.mobile,
    this.email,
    this.block,
    this.district,
    this.userName,
    this.password,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['crl_id'] = Variable<String>(crlId);
    if (!nullToAbsent || roleId != null) {
      map['role_id'] = Variable<String>(roleId);
    }
    if (!nullToAbsent || roleName != null) {
      map['role_name'] = Variable<String>(roleName);
    }
    if (!nullToAbsent || programId != null) {
      map['program_id'] = Variable<String>(programId);
    }
    if (!nullToAbsent || programName != null) {
      map['program_name'] = Variable<String>(programName);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || mobile != null) {
      map['mobile'] = Variable<String>(mobile);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || block != null) {
      map['block'] = Variable<String>(block);
    }
    if (!nullToAbsent || district != null) {
      map['district'] = Variable<String>(district);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    return map;
  }

  CrlTableCompanion toCompanion(bool nullToAbsent) {
    return CrlTableCompanion(
      crlId: Value(crlId),
      roleId: roleId == null && nullToAbsent
          ? const Value.absent()
          : Value(roleId),
      roleName: roleName == null && nullToAbsent
          ? const Value.absent()
          : Value(roleName),
      programId: programId == null && nullToAbsent
          ? const Value.absent()
          : Value(programId),
      programName: programName == null && nullToAbsent
          ? const Value.absent()
          : Value(programName),
      state: state == null && nullToAbsent
          ? const Value.absent()
          : Value(state),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      mobile: mobile == null && nullToAbsent
          ? const Value.absent()
          : Value(mobile),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      block: block == null && nullToAbsent
          ? const Value.absent()
          : Value(block),
      district: district == null && nullToAbsent
          ? const Value.absent()
          : Value(district),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
    );
  }

  factory CrlTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CrlTableData(
      crlId: serializer.fromJson<String>(json['crlId']),
      roleId: serializer.fromJson<String?>(json['roleId']),
      roleName: serializer.fromJson<String?>(json['roleName']),
      programId: serializer.fromJson<String?>(json['programId']),
      programName: serializer.fromJson<String?>(json['programName']),
      state: serializer.fromJson<String?>(json['state']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      mobile: serializer.fromJson<String?>(json['mobile']),
      email: serializer.fromJson<String?>(json['email']),
      block: serializer.fromJson<String?>(json['block']),
      district: serializer.fromJson<String?>(json['district']),
      userName: serializer.fromJson<String?>(json['userName']),
      password: serializer.fromJson<String?>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'crlId': serializer.toJson<String>(crlId),
      'roleId': serializer.toJson<String?>(roleId),
      'roleName': serializer.toJson<String?>(roleName),
      'programId': serializer.toJson<String?>(programId),
      'programName': serializer.toJson<String?>(programName),
      'state': serializer.toJson<String?>(state),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'mobile': serializer.toJson<String?>(mobile),
      'email': serializer.toJson<String?>(email),
      'block': serializer.toJson<String?>(block),
      'district': serializer.toJson<String?>(district),
      'userName': serializer.toJson<String?>(userName),
      'password': serializer.toJson<String?>(password),
    };
  }

  CrlTableData copyWith({
    String? crlId,
    Value<String?> roleId = const Value.absent(),
    Value<String?> roleName = const Value.absent(),
    Value<String?> programId = const Value.absent(),
    Value<String?> programName = const Value.absent(),
    Value<String?> state = const Value.absent(),
    Value<String?> firstName = const Value.absent(),
    Value<String?> lastName = const Value.absent(),
    Value<String?> mobile = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> block = const Value.absent(),
    Value<String?> district = const Value.absent(),
    Value<String?> userName = const Value.absent(),
    Value<String?> password = const Value.absent(),
  }) => CrlTableData(
    crlId: crlId ?? this.crlId,
    roleId: roleId.present ? roleId.value : this.roleId,
    roleName: roleName.present ? roleName.value : this.roleName,
    programId: programId.present ? programId.value : this.programId,
    programName: programName.present ? programName.value : this.programName,
    state: state.present ? state.value : this.state,
    firstName: firstName.present ? firstName.value : this.firstName,
    lastName: lastName.present ? lastName.value : this.lastName,
    mobile: mobile.present ? mobile.value : this.mobile,
    email: email.present ? email.value : this.email,
    block: block.present ? block.value : this.block,
    district: district.present ? district.value : this.district,
    userName: userName.present ? userName.value : this.userName,
    password: password.present ? password.value : this.password,
  );
  CrlTableData copyWithCompanion(CrlTableCompanion data) {
    return CrlTableData(
      crlId: data.crlId.present ? data.crlId.value : this.crlId,
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
      roleName: data.roleName.present ? data.roleName.value : this.roleName,
      programId: data.programId.present ? data.programId.value : this.programId,
      programName: data.programName.present
          ? data.programName.value
          : this.programName,
      state: data.state.present ? data.state.value : this.state,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      mobile: data.mobile.present ? data.mobile.value : this.mobile,
      email: data.email.present ? data.email.value : this.email,
      block: data.block.present ? data.block.value : this.block,
      district: data.district.present ? data.district.value : this.district,
      userName: data.userName.present ? data.userName.value : this.userName,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CrlTableData(')
          ..write('crlId: $crlId, ')
          ..write('roleId: $roleId, ')
          ..write('roleName: $roleName, ')
          ..write('programId: $programId, ')
          ..write('programName: $programName, ')
          ..write('state: $state, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('mobile: $mobile, ')
          ..write('email: $email, ')
          ..write('block: $block, ')
          ..write('district: $district, ')
          ..write('userName: $userName, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    crlId,
    roleId,
    roleName,
    programId,
    programName,
    state,
    firstName,
    lastName,
    mobile,
    email,
    block,
    district,
    userName,
    password,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CrlTableData &&
          other.crlId == this.crlId &&
          other.roleId == this.roleId &&
          other.roleName == this.roleName &&
          other.programId == this.programId &&
          other.programName == this.programName &&
          other.state == this.state &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.mobile == this.mobile &&
          other.email == this.email &&
          other.block == this.block &&
          other.district == this.district &&
          other.userName == this.userName &&
          other.password == this.password);
}

class CrlTableCompanion extends UpdateCompanion<CrlTableData> {
  final Value<String> crlId;
  final Value<String?> roleId;
  final Value<String?> roleName;
  final Value<String?> programId;
  final Value<String?> programName;
  final Value<String?> state;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> mobile;
  final Value<String?> email;
  final Value<String?> block;
  final Value<String?> district;
  final Value<String?> userName;
  final Value<String?> password;
  final Value<int> rowid;
  const CrlTableCompanion({
    this.crlId = const Value.absent(),
    this.roleId = const Value.absent(),
    this.roleName = const Value.absent(),
    this.programId = const Value.absent(),
    this.programName = const Value.absent(),
    this.state = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.email = const Value.absent(),
    this.block = const Value.absent(),
    this.district = const Value.absent(),
    this.userName = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CrlTableCompanion.insert({
    required String crlId,
    this.roleId = const Value.absent(),
    this.roleName = const Value.absent(),
    this.programId = const Value.absent(),
    this.programName = const Value.absent(),
    this.state = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.email = const Value.absent(),
    this.block = const Value.absent(),
    this.district = const Value.absent(),
    this.userName = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : crlId = Value(crlId);
  static Insertable<CrlTableData> custom({
    Expression<String>? crlId,
    Expression<String>? roleId,
    Expression<String>? roleName,
    Expression<String>? programId,
    Expression<String>? programName,
    Expression<String>? state,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? mobile,
    Expression<String>? email,
    Expression<String>? block,
    Expression<String>? district,
    Expression<String>? userName,
    Expression<String>? password,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (crlId != null) 'crl_id': crlId,
      if (roleId != null) 'role_id': roleId,
      if (roleName != null) 'role_name': roleName,
      if (programId != null) 'program_id': programId,
      if (programName != null) 'program_name': programName,
      if (state != null) 'state': state,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (mobile != null) 'mobile': mobile,
      if (email != null) 'email': email,
      if (block != null) 'block': block,
      if (district != null) 'district': district,
      if (userName != null) 'user_name': userName,
      if (password != null) 'password': password,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CrlTableCompanion copyWith({
    Value<String>? crlId,
    Value<String?>? roleId,
    Value<String?>? roleName,
    Value<String?>? programId,
    Value<String?>? programName,
    Value<String?>? state,
    Value<String?>? firstName,
    Value<String?>? lastName,
    Value<String?>? mobile,
    Value<String?>? email,
    Value<String?>? block,
    Value<String?>? district,
    Value<String?>? userName,
    Value<String?>? password,
    Value<int>? rowid,
  }) {
    return CrlTableCompanion(
      crlId: crlId ?? this.crlId,
      roleId: roleId ?? this.roleId,
      roleName: roleName ?? this.roleName,
      programId: programId ?? this.programId,
      programName: programName ?? this.programName,
      state: state ?? this.state,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      block: block ?? this.block,
      district: district ?? this.district,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (crlId.present) {
      map['crl_id'] = Variable<String>(crlId.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<String>(roleId.value);
    }
    if (roleName.present) {
      map['role_name'] = Variable<String>(roleName.value);
    }
    if (programId.present) {
      map['program_id'] = Variable<String>(programId.value);
    }
    if (programName.present) {
      map['program_name'] = Variable<String>(programName.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (block.present) {
      map['block'] = Variable<String>(block.value);
    }
    if (district.present) {
      map['district'] = Variable<String>(district.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CrlTableCompanion(')
          ..write('crlId: $crlId, ')
          ..write('roleId: $roleId, ')
          ..write('roleName: $roleName, ')
          ..write('programId: $programId, ')
          ..write('programName: $programName, ')
          ..write('state: $state, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('mobile: $mobile, ')
          ..write('email: $email, ')
          ..write('block: $block, ')
          ..write('district: $district, ')
          ..write('userName: $userName, ')
          ..write('password: $password, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MunicipalityTableTable extends MunicipalityTable
    with TableInfo<$MunicipalityTableTable, MunicipalityTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MunicipalityTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _municipalityIdMeta = const VerificationMeta(
    'municipalityId',
  );
  @override
  late final GeneratedColumn<String> municipalityId = GeneratedColumn<String>(
    'municipality_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _municipalityNameMeta = const VerificationMeta(
    'municipalityName',
  );
  @override
  late final GeneratedColumn<String> municipalityName = GeneratedColumn<String>(
    'municipality_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _departmentIdMeta = const VerificationMeta(
    'departmentId',
  );
  @override
  late final GeneratedColumn<String> departmentId = GeneratedColumn<String>(
    'department_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    municipalityId,
    municipalityName,
    departmentId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'municipality_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MunicipalityTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('municipality_id')) {
      context.handle(
        _municipalityIdMeta,
        municipalityId.isAcceptableOrUnknown(
          data['municipality_id']!,
          _municipalityIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_municipalityIdMeta);
    }
    if (data.containsKey('municipality_name')) {
      context.handle(
        _municipalityNameMeta,
        municipalityName.isAcceptableOrUnknown(
          data['municipality_name']!,
          _municipalityNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_municipalityNameMeta);
    }
    if (data.containsKey('department_id')) {
      context.handle(
        _departmentIdMeta,
        departmentId.isAcceptableOrUnknown(
          data['department_id']!,
          _departmentIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {municipalityId};
  @override
  MunicipalityTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MunicipalityTableData(
      municipalityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}municipality_id'],
      )!,
      municipalityName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}municipality_name'],
      )!,
      departmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}department_id'],
      ),
    );
  }

  @override
  $MunicipalityTableTable createAlias(String alias) {
    return $MunicipalityTableTable(attachedDatabase, alias);
  }
}

class MunicipalityTableData extends DataClass
    implements Insertable<MunicipalityTableData> {
  final String municipalityId;
  final String municipalityName;
  final String? departmentId;
  const MunicipalityTableData({
    required this.municipalityId,
    required this.municipalityName,
    this.departmentId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['municipality_id'] = Variable<String>(municipalityId);
    map['municipality_name'] = Variable<String>(municipalityName);
    if (!nullToAbsent || departmentId != null) {
      map['department_id'] = Variable<String>(departmentId);
    }
    return map;
  }

  MunicipalityTableCompanion toCompanion(bool nullToAbsent) {
    return MunicipalityTableCompanion(
      municipalityId: Value(municipalityId),
      municipalityName: Value(municipalityName),
      departmentId: departmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(departmentId),
    );
  }

  factory MunicipalityTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MunicipalityTableData(
      municipalityId: serializer.fromJson<String>(json['municipalityId']),
      municipalityName: serializer.fromJson<String>(json['municipalityName']),
      departmentId: serializer.fromJson<String?>(json['departmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'municipalityId': serializer.toJson<String>(municipalityId),
      'municipalityName': serializer.toJson<String>(municipalityName),
      'departmentId': serializer.toJson<String?>(departmentId),
    };
  }

  MunicipalityTableData copyWith({
    String? municipalityId,
    String? municipalityName,
    Value<String?> departmentId = const Value.absent(),
  }) => MunicipalityTableData(
    municipalityId: municipalityId ?? this.municipalityId,
    municipalityName: municipalityName ?? this.municipalityName,
    departmentId: departmentId.present ? departmentId.value : this.departmentId,
  );
  MunicipalityTableData copyWithCompanion(MunicipalityTableCompanion data) {
    return MunicipalityTableData(
      municipalityId: data.municipalityId.present
          ? data.municipalityId.value
          : this.municipalityId,
      municipalityName: data.municipalityName.present
          ? data.municipalityName.value
          : this.municipalityName,
      departmentId: data.departmentId.present
          ? data.departmentId.value
          : this.departmentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MunicipalityTableData(')
          ..write('municipalityId: $municipalityId, ')
          ..write('municipalityName: $municipalityName, ')
          ..write('departmentId: $departmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(municipalityId, municipalityName, departmentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MunicipalityTableData &&
          other.municipalityId == this.municipalityId &&
          other.municipalityName == this.municipalityName &&
          other.departmentId == this.departmentId);
}

class MunicipalityTableCompanion
    extends UpdateCompanion<MunicipalityTableData> {
  final Value<String> municipalityId;
  final Value<String> municipalityName;
  final Value<String?> departmentId;
  final Value<int> rowid;
  const MunicipalityTableCompanion({
    this.municipalityId = const Value.absent(),
    this.municipalityName = const Value.absent(),
    this.departmentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MunicipalityTableCompanion.insert({
    required String municipalityId,
    required String municipalityName,
    this.departmentId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : municipalityId = Value(municipalityId),
       municipalityName = Value(municipalityName);
  static Insertable<MunicipalityTableData> custom({
    Expression<String>? municipalityId,
    Expression<String>? municipalityName,
    Expression<String>? departmentId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (municipalityId != null) 'municipality_id': municipalityId,
      if (municipalityName != null) 'municipality_name': municipalityName,
      if (departmentId != null) 'department_id': departmentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MunicipalityTableCompanion copyWith({
    Value<String>? municipalityId,
    Value<String>? municipalityName,
    Value<String?>? departmentId,
    Value<int>? rowid,
  }) {
    return MunicipalityTableCompanion(
      municipalityId: municipalityId ?? this.municipalityId,
      municipalityName: municipalityName ?? this.municipalityName,
      departmentId: departmentId ?? this.departmentId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (municipalityId.present) {
      map['municipality_id'] = Variable<String>(municipalityId.value);
    }
    if (municipalityName.present) {
      map['municipality_name'] = Variable<String>(municipalityName.value);
    }
    if (departmentId.present) {
      map['department_id'] = Variable<String>(departmentId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MunicipalityTableCompanion(')
          ..write('municipalityId: $municipalityId, ')
          ..write('municipalityName: $municipalityName, ')
          ..write('departmentId: $departmentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InstituteTableTable extends InstituteTable
    with TableInfo<$InstituteTableTable, InstituteTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InstituteTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _instituteIdMeta = const VerificationMeta(
    'instituteId',
  );
  @override
  late final GeneratedColumn<String> instituteId = GeneratedColumn<String>(
    'institute_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _instituteNameMeta = const VerificationMeta(
    'instituteName',
  );
  @override
  late final GeneratedColumn<String> instituteName = GeneratedColumn<String>(
    'institute_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _municipalityIdMeta = const VerificationMeta(
    'municipalityId',
  );
  @override
  late final GeneratedColumn<String> municipalityId = GeneratedColumn<String>(
    'municipality_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pushFlagMeta = const VerificationMeta(
    'pushFlag',
  );
  @override
  late final GeneratedColumn<int> pushFlag = GeneratedColumn<int>(
    'push_flag',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _createdDateMeta = const VerificationMeta(
    'createdDate',
  );
  @override
  late final GeneratedColumn<String> createdDate = GeneratedColumn<String>(
    'created_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    instituteId,
    instituteName,
    municipalityId,
    pushFlag,
    createdDate,
    createdBy,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'institute_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<InstituteTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('institute_id')) {
      context.handle(
        _instituteIdMeta,
        instituteId.isAcceptableOrUnknown(
          data['institute_id']!,
          _instituteIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_instituteIdMeta);
    }
    if (data.containsKey('institute_name')) {
      context.handle(
        _instituteNameMeta,
        instituteName.isAcceptableOrUnknown(
          data['institute_name']!,
          _instituteNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_instituteNameMeta);
    }
    if (data.containsKey('municipality_id')) {
      context.handle(
        _municipalityIdMeta,
        municipalityId.isAcceptableOrUnknown(
          data['municipality_id']!,
          _municipalityIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_municipalityIdMeta);
    }
    if (data.containsKey('push_flag')) {
      context.handle(
        _pushFlagMeta,
        pushFlag.isAcceptableOrUnknown(data['push_flag']!, _pushFlagMeta),
      );
    }
    if (data.containsKey('created_date')) {
      context.handle(
        _createdDateMeta,
        createdDate.isAcceptableOrUnknown(
          data['created_date']!,
          _createdDateMeta,
        ),
      );
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {instituteId};
  @override
  InstituteTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InstituteTableData(
      instituteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institute_id'],
      )!,
      instituteName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institute_name'],
      )!,
      municipalityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}municipality_id'],
      )!,
      pushFlag: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}push_flag'],
      )!,
      createdDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_date'],
      ),
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
    );
  }

  @override
  $InstituteTableTable createAlias(String alias) {
    return $InstituteTableTable(attachedDatabase, alias);
  }
}

class InstituteTableData extends DataClass
    implements Insertable<InstituteTableData> {
  final String instituteId;
  final String instituteName;
  final String municipalityId;
  final int pushFlag;
  final String? createdDate;
  final String? createdBy;
  const InstituteTableData({
    required this.instituteId,
    required this.instituteName,
    required this.municipalityId,
    required this.pushFlag,
    this.createdDate,
    this.createdBy,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['institute_id'] = Variable<String>(instituteId);
    map['institute_name'] = Variable<String>(instituteName);
    map['municipality_id'] = Variable<String>(municipalityId);
    map['push_flag'] = Variable<int>(pushFlag);
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<String>(createdDate);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    return map;
  }

  InstituteTableCompanion toCompanion(bool nullToAbsent) {
    return InstituteTableCompanion(
      instituteId: Value(instituteId),
      instituteName: Value(instituteName),
      municipalityId: Value(municipalityId),
      pushFlag: Value(pushFlag),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
    );
  }

  factory InstituteTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InstituteTableData(
      instituteId: serializer.fromJson<String>(json['instituteId']),
      instituteName: serializer.fromJson<String>(json['instituteName']),
      municipalityId: serializer.fromJson<String>(json['municipalityId']),
      pushFlag: serializer.fromJson<int>(json['pushFlag']),
      createdDate: serializer.fromJson<String?>(json['createdDate']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'instituteId': serializer.toJson<String>(instituteId),
      'instituteName': serializer.toJson<String>(instituteName),
      'municipalityId': serializer.toJson<String>(municipalityId),
      'pushFlag': serializer.toJson<int>(pushFlag),
      'createdDate': serializer.toJson<String?>(createdDate),
      'createdBy': serializer.toJson<String?>(createdBy),
    };
  }

  InstituteTableData copyWith({
    String? instituteId,
    String? instituteName,
    String? municipalityId,
    int? pushFlag,
    Value<String?> createdDate = const Value.absent(),
    Value<String?> createdBy = const Value.absent(),
  }) => InstituteTableData(
    instituteId: instituteId ?? this.instituteId,
    instituteName: instituteName ?? this.instituteName,
    municipalityId: municipalityId ?? this.municipalityId,
    pushFlag: pushFlag ?? this.pushFlag,
    createdDate: createdDate.present ? createdDate.value : this.createdDate,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
  );
  InstituteTableData copyWithCompanion(InstituteTableCompanion data) {
    return InstituteTableData(
      instituteId: data.instituteId.present
          ? data.instituteId.value
          : this.instituteId,
      instituteName: data.instituteName.present
          ? data.instituteName.value
          : this.instituteName,
      municipalityId: data.municipalityId.present
          ? data.municipalityId.value
          : this.municipalityId,
      pushFlag: data.pushFlag.present ? data.pushFlag.value : this.pushFlag,
      createdDate: data.createdDate.present
          ? data.createdDate.value
          : this.createdDate,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InstituteTableData(')
          ..write('instituteId: $instituteId, ')
          ..write('instituteName: $instituteName, ')
          ..write('municipalityId: $municipalityId, ')
          ..write('pushFlag: $pushFlag, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    instituteId,
    instituteName,
    municipalityId,
    pushFlag,
    createdDate,
    createdBy,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstituteTableData &&
          other.instituteId == this.instituteId &&
          other.instituteName == this.instituteName &&
          other.municipalityId == this.municipalityId &&
          other.pushFlag == this.pushFlag &&
          other.createdDate == this.createdDate &&
          other.createdBy == this.createdBy);
}

class InstituteTableCompanion extends UpdateCompanion<InstituteTableData> {
  final Value<String> instituteId;
  final Value<String> instituteName;
  final Value<String> municipalityId;
  final Value<int> pushFlag;
  final Value<String?> createdDate;
  final Value<String?> createdBy;
  final Value<int> rowid;
  const InstituteTableCompanion({
    this.instituteId = const Value.absent(),
    this.instituteName = const Value.absent(),
    this.municipalityId = const Value.absent(),
    this.pushFlag = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InstituteTableCompanion.insert({
    required String instituteId,
    required String instituteName,
    required String municipalityId,
    this.pushFlag = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : instituteId = Value(instituteId),
       instituteName = Value(instituteName),
       municipalityId = Value(municipalityId);
  static Insertable<InstituteTableData> custom({
    Expression<String>? instituteId,
    Expression<String>? instituteName,
    Expression<String>? municipalityId,
    Expression<int>? pushFlag,
    Expression<String>? createdDate,
    Expression<String>? createdBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (instituteId != null) 'institute_id': instituteId,
      if (instituteName != null) 'institute_name': instituteName,
      if (municipalityId != null) 'municipality_id': municipalityId,
      if (pushFlag != null) 'push_flag': pushFlag,
      if (createdDate != null) 'created_date': createdDate,
      if (createdBy != null) 'created_by': createdBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InstituteTableCompanion copyWith({
    Value<String>? instituteId,
    Value<String>? instituteName,
    Value<String>? municipalityId,
    Value<int>? pushFlag,
    Value<String?>? createdDate,
    Value<String?>? createdBy,
    Value<int>? rowid,
  }) {
    return InstituteTableCompanion(
      instituteId: instituteId ?? this.instituteId,
      instituteName: instituteName ?? this.instituteName,
      municipalityId: municipalityId ?? this.municipalityId,
      pushFlag: pushFlag ?? this.pushFlag,
      createdDate: createdDate ?? this.createdDate,
      createdBy: createdBy ?? this.createdBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (instituteId.present) {
      map['institute_id'] = Variable<String>(instituteId.value);
    }
    if (instituteName.present) {
      map['institute_name'] = Variable<String>(instituteName.value);
    }
    if (municipalityId.present) {
      map['municipality_id'] = Variable<String>(municipalityId.value);
    }
    if (pushFlag.present) {
      map['push_flag'] = Variable<int>(pushFlag.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<String>(createdDate.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InstituteTableCompanion(')
          ..write('instituteId: $instituteId, ')
          ..write('instituteName: $instituteName, ')
          ..write('municipalityId: $municipalityId, ')
          ..write('pushFlag: $pushFlag, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdBy: $createdBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SchoolTableTable extends SchoolTable
    with TableInfo<$SchoolTableTable, SchoolTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchoolTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _schoolIdMeta = const VerificationMeta(
    'schoolId',
  );
  @override
  late final GeneratedColumn<String> schoolId = GeneratedColumn<String>(
    'school_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schoolNameMeta = const VerificationMeta(
    'schoolName',
  );
  @override
  late final GeneratedColumn<String> schoolName = GeneratedColumn<String>(
    'school_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _instituteIdMeta = const VerificationMeta(
    'instituteId',
  );
  @override
  late final GeneratedColumn<String> instituteId = GeneratedColumn<String>(
    'institute_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pushFlagMeta = const VerificationMeta(
    'pushFlag',
  );
  @override
  late final GeneratedColumn<int> pushFlag = GeneratedColumn<int>(
    'push_flag',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _createdDateMeta = const VerificationMeta(
    'createdDate',
  );
  @override
  late final GeneratedColumn<String> createdDate = GeneratedColumn<String>(
    'created_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    schoolId,
    schoolName,
    instituteId,
    pushFlag,
    createdDate,
    createdBy,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'school_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SchoolTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
    }
    if (data.containsKey('school_name')) {
      context.handle(
        _schoolNameMeta,
        schoolName.isAcceptableOrUnknown(data['school_name']!, _schoolNameMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolNameMeta);
    }
    if (data.containsKey('institute_id')) {
      context.handle(
        _instituteIdMeta,
        instituteId.isAcceptableOrUnknown(
          data['institute_id']!,
          _instituteIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_instituteIdMeta);
    }
    if (data.containsKey('push_flag')) {
      context.handle(
        _pushFlagMeta,
        pushFlag.isAcceptableOrUnknown(data['push_flag']!, _pushFlagMeta),
      );
    }
    if (data.containsKey('created_date')) {
      context.handle(
        _createdDateMeta,
        createdDate.isAcceptableOrUnknown(
          data['created_date']!,
          _createdDateMeta,
        ),
      );
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {schoolId};
  @override
  SchoolTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchoolTableData(
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_id'],
      )!,
      schoolName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_name'],
      )!,
      instituteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institute_id'],
      )!,
      pushFlag: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}push_flag'],
      )!,
      createdDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_date'],
      ),
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
    );
  }

  @override
  $SchoolTableTable createAlias(String alias) {
    return $SchoolTableTable(attachedDatabase, alias);
  }
}

class SchoolTableData extends DataClass implements Insertable<SchoolTableData> {
  final String schoolId;
  final String schoolName;
  final String instituteId;
  final int pushFlag;
  final String? createdDate;
  final String? createdBy;
  const SchoolTableData({
    required this.schoolId,
    required this.schoolName,
    required this.instituteId,
    required this.pushFlag,
    this.createdDate,
    this.createdBy,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['school_id'] = Variable<String>(schoolId);
    map['school_name'] = Variable<String>(schoolName);
    map['institute_id'] = Variable<String>(instituteId);
    map['push_flag'] = Variable<int>(pushFlag);
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<String>(createdDate);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    return map;
  }

  SchoolTableCompanion toCompanion(bool nullToAbsent) {
    return SchoolTableCompanion(
      schoolId: Value(schoolId),
      schoolName: Value(schoolName),
      instituteId: Value(instituteId),
      pushFlag: Value(pushFlag),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
    );
  }

  factory SchoolTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchoolTableData(
      schoolId: serializer.fromJson<String>(json['schoolId']),
      schoolName: serializer.fromJson<String>(json['schoolName']),
      instituteId: serializer.fromJson<String>(json['instituteId']),
      pushFlag: serializer.fromJson<int>(json['pushFlag']),
      createdDate: serializer.fromJson<String?>(json['createdDate']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'schoolId': serializer.toJson<String>(schoolId),
      'schoolName': serializer.toJson<String>(schoolName),
      'instituteId': serializer.toJson<String>(instituteId),
      'pushFlag': serializer.toJson<int>(pushFlag),
      'createdDate': serializer.toJson<String?>(createdDate),
      'createdBy': serializer.toJson<String?>(createdBy),
    };
  }

  SchoolTableData copyWith({
    String? schoolId,
    String? schoolName,
    String? instituteId,
    int? pushFlag,
    Value<String?> createdDate = const Value.absent(),
    Value<String?> createdBy = const Value.absent(),
  }) => SchoolTableData(
    schoolId: schoolId ?? this.schoolId,
    schoolName: schoolName ?? this.schoolName,
    instituteId: instituteId ?? this.instituteId,
    pushFlag: pushFlag ?? this.pushFlag,
    createdDate: createdDate.present ? createdDate.value : this.createdDate,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
  );
  SchoolTableData copyWithCompanion(SchoolTableCompanion data) {
    return SchoolTableData(
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      schoolName: data.schoolName.present
          ? data.schoolName.value
          : this.schoolName,
      instituteId: data.instituteId.present
          ? data.instituteId.value
          : this.instituteId,
      pushFlag: data.pushFlag.present ? data.pushFlag.value : this.pushFlag,
      createdDate: data.createdDate.present
          ? data.createdDate.value
          : this.createdDate,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SchoolTableData(')
          ..write('schoolId: $schoolId, ')
          ..write('schoolName: $schoolName, ')
          ..write('instituteId: $instituteId, ')
          ..write('pushFlag: $pushFlag, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    schoolId,
    schoolName,
    instituteId,
    pushFlag,
    createdDate,
    createdBy,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchoolTableData &&
          other.schoolId == this.schoolId &&
          other.schoolName == this.schoolName &&
          other.instituteId == this.instituteId &&
          other.pushFlag == this.pushFlag &&
          other.createdDate == this.createdDate &&
          other.createdBy == this.createdBy);
}

class SchoolTableCompanion extends UpdateCompanion<SchoolTableData> {
  final Value<String> schoolId;
  final Value<String> schoolName;
  final Value<String> instituteId;
  final Value<int> pushFlag;
  final Value<String?> createdDate;
  final Value<String?> createdBy;
  final Value<int> rowid;
  const SchoolTableCompanion({
    this.schoolId = const Value.absent(),
    this.schoolName = const Value.absent(),
    this.instituteId = const Value.absent(),
    this.pushFlag = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SchoolTableCompanion.insert({
    required String schoolId,
    required String schoolName,
    required String instituteId,
    this.pushFlag = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : schoolId = Value(schoolId),
       schoolName = Value(schoolName),
       instituteId = Value(instituteId);
  static Insertable<SchoolTableData> custom({
    Expression<String>? schoolId,
    Expression<String>? schoolName,
    Expression<String>? instituteId,
    Expression<int>? pushFlag,
    Expression<String>? createdDate,
    Expression<String>? createdBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (schoolId != null) 'school_id': schoolId,
      if (schoolName != null) 'school_name': schoolName,
      if (instituteId != null) 'institute_id': instituteId,
      if (pushFlag != null) 'push_flag': pushFlag,
      if (createdDate != null) 'created_date': createdDate,
      if (createdBy != null) 'created_by': createdBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SchoolTableCompanion copyWith({
    Value<String>? schoolId,
    Value<String>? schoolName,
    Value<String>? instituteId,
    Value<int>? pushFlag,
    Value<String?>? createdDate,
    Value<String?>? createdBy,
    Value<int>? rowid,
  }) {
    return SchoolTableCompanion(
      schoolId: schoolId ?? this.schoolId,
      schoolName: schoolName ?? this.schoolName,
      instituteId: instituteId ?? this.instituteId,
      pushFlag: pushFlag ?? this.pushFlag,
      createdDate: createdDate ?? this.createdDate,
      createdBy: createdBy ?? this.createdBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (schoolId.present) {
      map['school_id'] = Variable<String>(schoolId.value);
    }
    if (schoolName.present) {
      map['school_name'] = Variable<String>(schoolName.value);
    }
    if (instituteId.present) {
      map['institute_id'] = Variable<String>(instituteId.value);
    }
    if (pushFlag.present) {
      map['push_flag'] = Variable<int>(pushFlag.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<String>(createdDate.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchoolTableCompanion(')
          ..write('schoolId: $schoolId, ')
          ..write('schoolName: $schoolName, ')
          ..write('instituteId: $instituteId, ')
          ..write('pushFlag: $pushFlag, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdBy: $createdBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChildSurveyTableTable extends ChildSurveyTable
    with TableInfo<$ChildSurveyTableTable, ChildSurveyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChildSurveyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _studentNameMeta = const VerificationMeta(
    'studentName',
  );
  @override
  late final GeneratedColumn<String> studentName = GeneratedColumn<String>(
    'student_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<String> age = GeneratedColumn<String>(
    'age',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _instituteIdMeta = const VerificationMeta(
    'instituteId',
  );
  @override
  late final GeneratedColumn<String> instituteId = GeneratedColumn<String>(
    'institute_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _schoolIdMeta = const VerificationMeta(
    'schoolId',
  );
  @override
  late final GeneratedColumn<String> schoolId = GeneratedColumn<String>(
    'school_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pushFlagMeta = const VerificationMeta(
    'pushFlag',
  );
  @override
  late final GeneratedColumn<int> pushFlag = GeneratedColumn<int>(
    'push_flag',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _createdDateMeta = const VerificationMeta(
    'createdDate',
  );
  @override
  late final GeneratedColumn<String> createdDate = GeneratedColumn<String>(
    'created_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isTestCompletedMeta = const VerificationMeta(
    'isTestCompleted',
  );
  @override
  late final GeneratedColumn<bool> isTestCompleted = GeneratedColumn<bool>(
    'is_test_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_test_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    studentId,
    studentName,
    age,
    gender,
    instituteId,
    schoolId,
    pushFlag,
    createdDate,
    createdBy,
    isTestCompleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'child_survey_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChildSurveyTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('student_name')) {
      context.handle(
        _studentNameMeta,
        studentName.isAcceptableOrUnknown(
          data['student_name']!,
          _studentNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_studentNameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('institute_id')) {
      context.handle(
        _instituteIdMeta,
        instituteId.isAcceptableOrUnknown(
          data['institute_id']!,
          _instituteIdMeta,
        ),
      );
    }
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
    }
    if (data.containsKey('push_flag')) {
      context.handle(
        _pushFlagMeta,
        pushFlag.isAcceptableOrUnknown(data['push_flag']!, _pushFlagMeta),
      );
    }
    if (data.containsKey('created_date')) {
      context.handle(
        _createdDateMeta,
        createdDate.isAcceptableOrUnknown(
          data['created_date']!,
          _createdDateMeta,
        ),
      );
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('is_test_completed')) {
      context.handle(
        _isTestCompletedMeta,
        isTestCompleted.isAcceptableOrUnknown(
          data['is_test_completed']!,
          _isTestCompletedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {studentId};
  @override
  ChildSurveyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChildSurveyTableData(
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}student_id'],
      )!,
      studentName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}student_name'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      instituteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institute_id'],
      ),
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_id'],
      )!,
      pushFlag: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}push_flag'],
      )!,
      createdDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_date'],
      ),
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
      isTestCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_test_completed'],
      )!,
    );
  }

  @override
  $ChildSurveyTableTable createAlias(String alias) {
    return $ChildSurveyTableTable(attachedDatabase, alias);
  }
}

class ChildSurveyTableData extends DataClass
    implements Insertable<ChildSurveyTableData> {
  final String studentId;
  final String studentName;
  final String? age;
  final String? gender;
  final String? instituteId;
  final String schoolId;
  final int pushFlag;
  final String? createdDate;
  final String? createdBy;
  final bool isTestCompleted;
  const ChildSurveyTableData({
    required this.studentId,
    required this.studentName,
    this.age,
    this.gender,
    this.instituteId,
    required this.schoolId,
    required this.pushFlag,
    this.createdDate,
    this.createdBy,
    required this.isTestCompleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['student_id'] = Variable<String>(studentId);
    map['student_name'] = Variable<String>(studentName);
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<String>(age);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || instituteId != null) {
      map['institute_id'] = Variable<String>(instituteId);
    }
    map['school_id'] = Variable<String>(schoolId);
    map['push_flag'] = Variable<int>(pushFlag);
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<String>(createdDate);
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    map['is_test_completed'] = Variable<bool>(isTestCompleted);
    return map;
  }

  ChildSurveyTableCompanion toCompanion(bool nullToAbsent) {
    return ChildSurveyTableCompanion(
      studentId: Value(studentId),
      studentName: Value(studentName),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      instituteId: instituteId == null && nullToAbsent
          ? const Value.absent()
          : Value(instituteId),
      schoolId: Value(schoolId),
      pushFlag: Value(pushFlag),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      isTestCompleted: Value(isTestCompleted),
    );
  }

  factory ChildSurveyTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChildSurveyTableData(
      studentId: serializer.fromJson<String>(json['studentId']),
      studentName: serializer.fromJson<String>(json['studentName']),
      age: serializer.fromJson<String?>(json['age']),
      gender: serializer.fromJson<String?>(json['gender']),
      instituteId: serializer.fromJson<String?>(json['instituteId']),
      schoolId: serializer.fromJson<String>(json['schoolId']),
      pushFlag: serializer.fromJson<int>(json['pushFlag']),
      createdDate: serializer.fromJson<String?>(json['createdDate']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      isTestCompleted: serializer.fromJson<bool>(json['isTestCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'studentId': serializer.toJson<String>(studentId),
      'studentName': serializer.toJson<String>(studentName),
      'age': serializer.toJson<String?>(age),
      'gender': serializer.toJson<String?>(gender),
      'instituteId': serializer.toJson<String?>(instituteId),
      'schoolId': serializer.toJson<String>(schoolId),
      'pushFlag': serializer.toJson<int>(pushFlag),
      'createdDate': serializer.toJson<String?>(createdDate),
      'createdBy': serializer.toJson<String?>(createdBy),
      'isTestCompleted': serializer.toJson<bool>(isTestCompleted),
    };
  }

  ChildSurveyTableData copyWith({
    String? studentId,
    String? studentName,
    Value<String?> age = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<String?> instituteId = const Value.absent(),
    String? schoolId,
    int? pushFlag,
    Value<String?> createdDate = const Value.absent(),
    Value<String?> createdBy = const Value.absent(),
    bool? isTestCompleted,
  }) => ChildSurveyTableData(
    studentId: studentId ?? this.studentId,
    studentName: studentName ?? this.studentName,
    age: age.present ? age.value : this.age,
    gender: gender.present ? gender.value : this.gender,
    instituteId: instituteId.present ? instituteId.value : this.instituteId,
    schoolId: schoolId ?? this.schoolId,
    pushFlag: pushFlag ?? this.pushFlag,
    createdDate: createdDate.present ? createdDate.value : this.createdDate,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
    isTestCompleted: isTestCompleted ?? this.isTestCompleted,
  );
  ChildSurveyTableData copyWithCompanion(ChildSurveyTableCompanion data) {
    return ChildSurveyTableData(
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      studentName: data.studentName.present
          ? data.studentName.value
          : this.studentName,
      age: data.age.present ? data.age.value : this.age,
      gender: data.gender.present ? data.gender.value : this.gender,
      instituteId: data.instituteId.present
          ? data.instituteId.value
          : this.instituteId,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      pushFlag: data.pushFlag.present ? data.pushFlag.value : this.pushFlag,
      createdDate: data.createdDate.present
          ? data.createdDate.value
          : this.createdDate,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      isTestCompleted: data.isTestCompleted.present
          ? data.isTestCompleted.value
          : this.isTestCompleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChildSurveyTableData(')
          ..write('studentId: $studentId, ')
          ..write('studentName: $studentName, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('instituteId: $instituteId, ')
          ..write('schoolId: $schoolId, ')
          ..write('pushFlag: $pushFlag, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdBy: $createdBy, ')
          ..write('isTestCompleted: $isTestCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    studentId,
    studentName,
    age,
    gender,
    instituteId,
    schoolId,
    pushFlag,
    createdDate,
    createdBy,
    isTestCompleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChildSurveyTableData &&
          other.studentId == this.studentId &&
          other.studentName == this.studentName &&
          other.age == this.age &&
          other.gender == this.gender &&
          other.instituteId == this.instituteId &&
          other.schoolId == this.schoolId &&
          other.pushFlag == this.pushFlag &&
          other.createdDate == this.createdDate &&
          other.createdBy == this.createdBy &&
          other.isTestCompleted == this.isTestCompleted);
}

class ChildSurveyTableCompanion extends UpdateCompanion<ChildSurveyTableData> {
  final Value<String> studentId;
  final Value<String> studentName;
  final Value<String?> age;
  final Value<String?> gender;
  final Value<String?> instituteId;
  final Value<String> schoolId;
  final Value<int> pushFlag;
  final Value<String?> createdDate;
  final Value<String?> createdBy;
  final Value<bool> isTestCompleted;
  final Value<int> rowid;
  const ChildSurveyTableCompanion({
    this.studentId = const Value.absent(),
    this.studentName = const Value.absent(),
    this.age = const Value.absent(),
    this.gender = const Value.absent(),
    this.instituteId = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.pushFlag = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.isTestCompleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChildSurveyTableCompanion.insert({
    required String studentId,
    required String studentName,
    this.age = const Value.absent(),
    this.gender = const Value.absent(),
    this.instituteId = const Value.absent(),
    required String schoolId,
    this.pushFlag = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.isTestCompleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : studentId = Value(studentId),
       studentName = Value(studentName),
       schoolId = Value(schoolId);
  static Insertable<ChildSurveyTableData> custom({
    Expression<String>? studentId,
    Expression<String>? studentName,
    Expression<String>? age,
    Expression<String>? gender,
    Expression<String>? instituteId,
    Expression<String>? schoolId,
    Expression<int>? pushFlag,
    Expression<String>? createdDate,
    Expression<String>? createdBy,
    Expression<bool>? isTestCompleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (studentId != null) 'student_id': studentId,
      if (studentName != null) 'student_name': studentName,
      if (age != null) 'age': age,
      if (gender != null) 'gender': gender,
      if (instituteId != null) 'institute_id': instituteId,
      if (schoolId != null) 'school_id': schoolId,
      if (pushFlag != null) 'push_flag': pushFlag,
      if (createdDate != null) 'created_date': createdDate,
      if (createdBy != null) 'created_by': createdBy,
      if (isTestCompleted != null) 'is_test_completed': isTestCompleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChildSurveyTableCompanion copyWith({
    Value<String>? studentId,
    Value<String>? studentName,
    Value<String?>? age,
    Value<String?>? gender,
    Value<String?>? instituteId,
    Value<String>? schoolId,
    Value<int>? pushFlag,
    Value<String?>? createdDate,
    Value<String?>? createdBy,
    Value<bool>? isTestCompleted,
    Value<int>? rowid,
  }) {
    return ChildSurveyTableCompanion(
      studentId: studentId ?? this.studentId,
      studentName: studentName ?? this.studentName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      instituteId: instituteId ?? this.instituteId,
      schoolId: schoolId ?? this.schoolId,
      pushFlag: pushFlag ?? this.pushFlag,
      createdDate: createdDate ?? this.createdDate,
      createdBy: createdBy ?? this.createdBy,
      isTestCompleted: isTestCompleted ?? this.isTestCompleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (studentName.present) {
      map['student_name'] = Variable<String>(studentName.value);
    }
    if (age.present) {
      map['age'] = Variable<String>(age.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (instituteId.present) {
      map['institute_id'] = Variable<String>(instituteId.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<String>(schoolId.value);
    }
    if (pushFlag.present) {
      map['push_flag'] = Variable<int>(pushFlag.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<String>(createdDate.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (isTestCompleted.present) {
      map['is_test_completed'] = Variable<bool>(isTestCompleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChildSurveyTableCompanion(')
          ..write('studentId: $studentId, ')
          ..write('studentName: $studentName, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('instituteId: $instituteId, ')
          ..write('schoolId: $schoolId, ')
          ..write('pushFlag: $pushFlag, ')
          ..write('createdDate: $createdDate, ')
          ..write('createdBy: $createdBy, ')
          ..write('isTestCompleted: $isTestCompleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AserToolTableTable extends AserToolTable
    with TableInfo<$AserToolTableTable, AserToolTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AserToolTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sampleNumberMeta = const VerificationMeta(
    'sampleNumber',
  );
  @override
  late final GeneratedColumn<int> sampleNumber = GeneratedColumn<int>(
    'sample_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<String> year = GeneratedColumn<String>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('2024'),
  );
  static const VerificationMeta _isAttemptedMeta = const VerificationMeta(
    'isAttempted',
  );
  @override
  late final GeneratedColumn<bool> isAttempted = GeneratedColumn<bool>(
    'is_attempted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_attempted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    data,
    type,
    language,
    sampleNumber,
    year,
    isAttempted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'aser_tool_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AserToolTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('sample_number')) {
      context.handle(
        _sampleNumberMeta,
        sampleNumber.isAcceptableOrUnknown(
          data['sample_number']!,
          _sampleNumberMeta,
        ),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('is_attempted')) {
      context.handle(
        _isAttemptedMeta,
        isAttempted.isAcceptableOrUnknown(
          data['is_attempted']!,
          _isAttemptedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AserToolTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AserToolTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      sampleNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sample_number'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}year'],
      )!,
      isAttempted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_attempted'],
      )!,
    );
  }

  @override
  $AserToolTableTable createAlias(String alias) {
    return $AserToolTableTable(attachedDatabase, alias);
  }
}

class AserToolTableData extends DataClass
    implements Insertable<AserToolTableData> {
  final String id;
  final String data;
  final String type;
  final String language;
  final int sampleNumber;
  final String year;
  final bool isAttempted;
  const AserToolTableData({
    required this.id,
    required this.data,
    required this.type,
    required this.language,
    required this.sampleNumber,
    required this.year,
    required this.isAttempted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['data'] = Variable<String>(data);
    map['type'] = Variable<String>(type);
    map['language'] = Variable<String>(language);
    map['sample_number'] = Variable<int>(sampleNumber);
    map['year'] = Variable<String>(year);
    map['is_attempted'] = Variable<bool>(isAttempted);
    return map;
  }

  AserToolTableCompanion toCompanion(bool nullToAbsent) {
    return AserToolTableCompanion(
      id: Value(id),
      data: Value(data),
      type: Value(type),
      language: Value(language),
      sampleNumber: Value(sampleNumber),
      year: Value(year),
      isAttempted: Value(isAttempted),
    );
  }

  factory AserToolTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AserToolTableData(
      id: serializer.fromJson<String>(json['id']),
      data: serializer.fromJson<String>(json['data']),
      type: serializer.fromJson<String>(json['type']),
      language: serializer.fromJson<String>(json['language']),
      sampleNumber: serializer.fromJson<int>(json['sampleNumber']),
      year: serializer.fromJson<String>(json['year']),
      isAttempted: serializer.fromJson<bool>(json['isAttempted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'data': serializer.toJson<String>(data),
      'type': serializer.toJson<String>(type),
      'language': serializer.toJson<String>(language),
      'sampleNumber': serializer.toJson<int>(sampleNumber),
      'year': serializer.toJson<String>(year),
      'isAttempted': serializer.toJson<bool>(isAttempted),
    };
  }

  AserToolTableData copyWith({
    String? id,
    String? data,
    String? type,
    String? language,
    int? sampleNumber,
    String? year,
    bool? isAttempted,
  }) => AserToolTableData(
    id: id ?? this.id,
    data: data ?? this.data,
    type: type ?? this.type,
    language: language ?? this.language,
    sampleNumber: sampleNumber ?? this.sampleNumber,
    year: year ?? this.year,
    isAttempted: isAttempted ?? this.isAttempted,
  );
  AserToolTableData copyWithCompanion(AserToolTableCompanion data) {
    return AserToolTableData(
      id: data.id.present ? data.id.value : this.id,
      data: data.data.present ? data.data.value : this.data,
      type: data.type.present ? data.type.value : this.type,
      language: data.language.present ? data.language.value : this.language,
      sampleNumber: data.sampleNumber.present
          ? data.sampleNumber.value
          : this.sampleNumber,
      year: data.year.present ? data.year.value : this.year,
      isAttempted: data.isAttempted.present
          ? data.isAttempted.value
          : this.isAttempted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AserToolTableData(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('type: $type, ')
          ..write('language: $language, ')
          ..write('sampleNumber: $sampleNumber, ')
          ..write('year: $year, ')
          ..write('isAttempted: $isAttempted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, data, type, language, sampleNumber, year, isAttempted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AserToolTableData &&
          other.id == this.id &&
          other.data == this.data &&
          other.type == this.type &&
          other.language == this.language &&
          other.sampleNumber == this.sampleNumber &&
          other.year == this.year &&
          other.isAttempted == this.isAttempted);
}

class AserToolTableCompanion extends UpdateCompanion<AserToolTableData> {
  final Value<String> id;
  final Value<String> data;
  final Value<String> type;
  final Value<String> language;
  final Value<int> sampleNumber;
  final Value<String> year;
  final Value<bool> isAttempted;
  final Value<int> rowid;
  const AserToolTableCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.type = const Value.absent(),
    this.language = const Value.absent(),
    this.sampleNumber = const Value.absent(),
    this.year = const Value.absent(),
    this.isAttempted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AserToolTableCompanion.insert({
    required String id,
    required String data,
    required String type,
    required String language,
    this.sampleNumber = const Value.absent(),
    this.year = const Value.absent(),
    this.isAttempted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       data = Value(data),
       type = Value(type),
       language = Value(language);
  static Insertable<AserToolTableData> custom({
    Expression<String>? id,
    Expression<String>? data,
    Expression<String>? type,
    Expression<String>? language,
    Expression<int>? sampleNumber,
    Expression<String>? year,
    Expression<bool>? isAttempted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (type != null) 'type': type,
      if (language != null) 'language': language,
      if (sampleNumber != null) 'sample_number': sampleNumber,
      if (year != null) 'year': year,
      if (isAttempted != null) 'is_attempted': isAttempted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AserToolTableCompanion copyWith({
    Value<String>? id,
    Value<String>? data,
    Value<String>? type,
    Value<String>? language,
    Value<int>? sampleNumber,
    Value<String>? year,
    Value<bool>? isAttempted,
    Value<int>? rowid,
  }) {
    return AserToolTableCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      type: type ?? this.type,
      language: language ?? this.language,
      sampleNumber: sampleNumber ?? this.sampleNumber,
      year: year ?? this.year,
      isAttempted: isAttempted ?? this.isAttempted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (sampleNumber.present) {
      map['sample_number'] = Variable<int>(sampleNumber.value);
    }
    if (year.present) {
      map['year'] = Variable<String>(year.value);
    }
    if (isAttempted.present) {
      map['is_attempted'] = Variable<bool>(isAttempted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AserToolTableCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('type: $type, ')
          ..write('language: $language, ')
          ..write('sampleNumber: $sampleNumber, ')
          ..write('year: $year, ')
          ..write('isAttempted: $isAttempted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AserToolAnswersTableTable extends AserToolAnswersTable
    with TableInfo<$AserToolAnswersTableTable, AserToolAnswersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AserToolAnswersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _examIdMeta = const VerificationMeta('examId');
  @override
  late final GeneratedColumn<String> examId = GeneratedColumn<String>(
    'exam_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _queIdMeta = const VerificationMeta('queId');
  @override
  late final GeneratedColumn<String> queId = GeneratedColumn<String>(
    'que_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _queTextMeta = const VerificationMeta(
    'queText',
  );
  @override
  late final GeneratedColumn<String> queText = GeneratedColumn<String>(
    'que_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sampleNumberMeta = const VerificationMeta(
    'sampleNumber',
  );
  @override
  late final GeneratedColumn<int> sampleNumber = GeneratedColumn<int>(
    'sample_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumn<int> grade = GeneratedColumn<int>(
    'grade',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(-1),
  );
  static const VerificationMeta _isAttemptedMeta = const VerificationMeta(
    'isAttempted',
  );
  @override
  late final GeneratedColumn<bool> isAttempted = GeneratedColumn<bool>(
    'is_attempted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_attempted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _recordingNameMeta = const VerificationMeta(
    'recordingName',
  );
  @override
  late final GeneratedColumn<String> recordingName = GeneratedColumn<String>(
    'recording_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    examId,
    queId,
    queText,
    type,
    sampleNumber,
    grade,
    isAttempted,
    recordingName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'aser_tool_answers_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AserToolAnswersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('exam_id')) {
      context.handle(
        _examIdMeta,
        examId.isAcceptableOrUnknown(data['exam_id']!, _examIdMeta),
      );
    } else if (isInserting) {
      context.missing(_examIdMeta);
    }
    if (data.containsKey('que_id')) {
      context.handle(
        _queIdMeta,
        queId.isAcceptableOrUnknown(data['que_id']!, _queIdMeta),
      );
    } else if (isInserting) {
      context.missing(_queIdMeta);
    }
    if (data.containsKey('que_text')) {
      context.handle(
        _queTextMeta,
        queText.isAcceptableOrUnknown(data['que_text']!, _queTextMeta),
      );
    } else if (isInserting) {
      context.missing(_queTextMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('sample_number')) {
      context.handle(
        _sampleNumberMeta,
        sampleNumber.isAcceptableOrUnknown(
          data['sample_number']!,
          _sampleNumberMeta,
        ),
      );
    }
    if (data.containsKey('grade')) {
      context.handle(
        _gradeMeta,
        grade.isAcceptableOrUnknown(data['grade']!, _gradeMeta),
      );
    }
    if (data.containsKey('is_attempted')) {
      context.handle(
        _isAttemptedMeta,
        isAttempted.isAcceptableOrUnknown(
          data['is_attempted']!,
          _isAttemptedMeta,
        ),
      );
    }
    if (data.containsKey('recording_name')) {
      context.handle(
        _recordingNameMeta,
        recordingName.isAcceptableOrUnknown(
          data['recording_name']!,
          _recordingNameMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AserToolAnswersTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AserToolAnswersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      examId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exam_id'],
      )!,
      queId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}que_id'],
      )!,
      queText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}que_text'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      sampleNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sample_number'],
      )!,
      grade: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}grade'],
      )!,
      isAttempted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_attempted'],
      )!,
      recordingName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recording_name'],
      ),
    );
  }

  @override
  $AserToolAnswersTableTable createAlias(String alias) {
    return $AserToolAnswersTableTable(attachedDatabase, alias);
  }
}

class AserToolAnswersTableData extends DataClass
    implements Insertable<AserToolAnswersTableData> {
  final int id;
  final String examId;
  final String queId;
  final String queText;
  final String type;
  final int sampleNumber;
  final int grade;
  final bool isAttempted;
  final String? recordingName;
  const AserToolAnswersTableData({
    required this.id,
    required this.examId,
    required this.queId,
    required this.queText,
    required this.type,
    required this.sampleNumber,
    required this.grade,
    required this.isAttempted,
    this.recordingName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['exam_id'] = Variable<String>(examId);
    map['que_id'] = Variable<String>(queId);
    map['que_text'] = Variable<String>(queText);
    map['type'] = Variable<String>(type);
    map['sample_number'] = Variable<int>(sampleNumber);
    map['grade'] = Variable<int>(grade);
    map['is_attempted'] = Variable<bool>(isAttempted);
    if (!nullToAbsent || recordingName != null) {
      map['recording_name'] = Variable<String>(recordingName);
    }
    return map;
  }

  AserToolAnswersTableCompanion toCompanion(bool nullToAbsent) {
    return AserToolAnswersTableCompanion(
      id: Value(id),
      examId: Value(examId),
      queId: Value(queId),
      queText: Value(queText),
      type: Value(type),
      sampleNumber: Value(sampleNumber),
      grade: Value(grade),
      isAttempted: Value(isAttempted),
      recordingName: recordingName == null && nullToAbsent
          ? const Value.absent()
          : Value(recordingName),
    );
  }

  factory AserToolAnswersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AserToolAnswersTableData(
      id: serializer.fromJson<int>(json['id']),
      examId: serializer.fromJson<String>(json['examId']),
      queId: serializer.fromJson<String>(json['queId']),
      queText: serializer.fromJson<String>(json['queText']),
      type: serializer.fromJson<String>(json['type']),
      sampleNumber: serializer.fromJson<int>(json['sampleNumber']),
      grade: serializer.fromJson<int>(json['grade']),
      isAttempted: serializer.fromJson<bool>(json['isAttempted']),
      recordingName: serializer.fromJson<String?>(json['recordingName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'examId': serializer.toJson<String>(examId),
      'queId': serializer.toJson<String>(queId),
      'queText': serializer.toJson<String>(queText),
      'type': serializer.toJson<String>(type),
      'sampleNumber': serializer.toJson<int>(sampleNumber),
      'grade': serializer.toJson<int>(grade),
      'isAttempted': serializer.toJson<bool>(isAttempted),
      'recordingName': serializer.toJson<String?>(recordingName),
    };
  }

  AserToolAnswersTableData copyWith({
    int? id,
    String? examId,
    String? queId,
    String? queText,
    String? type,
    int? sampleNumber,
    int? grade,
    bool? isAttempted,
    Value<String?> recordingName = const Value.absent(),
  }) => AserToolAnswersTableData(
    id: id ?? this.id,
    examId: examId ?? this.examId,
    queId: queId ?? this.queId,
    queText: queText ?? this.queText,
    type: type ?? this.type,
    sampleNumber: sampleNumber ?? this.sampleNumber,
    grade: grade ?? this.grade,
    isAttempted: isAttempted ?? this.isAttempted,
    recordingName: recordingName.present
        ? recordingName.value
        : this.recordingName,
  );
  AserToolAnswersTableData copyWithCompanion(
    AserToolAnswersTableCompanion data,
  ) {
    return AserToolAnswersTableData(
      id: data.id.present ? data.id.value : this.id,
      examId: data.examId.present ? data.examId.value : this.examId,
      queId: data.queId.present ? data.queId.value : this.queId,
      queText: data.queText.present ? data.queText.value : this.queText,
      type: data.type.present ? data.type.value : this.type,
      sampleNumber: data.sampleNumber.present
          ? data.sampleNumber.value
          : this.sampleNumber,
      grade: data.grade.present ? data.grade.value : this.grade,
      isAttempted: data.isAttempted.present
          ? data.isAttempted.value
          : this.isAttempted,
      recordingName: data.recordingName.present
          ? data.recordingName.value
          : this.recordingName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AserToolAnswersTableData(')
          ..write('id: $id, ')
          ..write('examId: $examId, ')
          ..write('queId: $queId, ')
          ..write('queText: $queText, ')
          ..write('type: $type, ')
          ..write('sampleNumber: $sampleNumber, ')
          ..write('grade: $grade, ')
          ..write('isAttempted: $isAttempted, ')
          ..write('recordingName: $recordingName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    examId,
    queId,
    queText,
    type,
    sampleNumber,
    grade,
    isAttempted,
    recordingName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AserToolAnswersTableData &&
          other.id == this.id &&
          other.examId == this.examId &&
          other.queId == this.queId &&
          other.queText == this.queText &&
          other.type == this.type &&
          other.sampleNumber == this.sampleNumber &&
          other.grade == this.grade &&
          other.isAttempted == this.isAttempted &&
          other.recordingName == this.recordingName);
}

class AserToolAnswersTableCompanion
    extends UpdateCompanion<AserToolAnswersTableData> {
  final Value<int> id;
  final Value<String> examId;
  final Value<String> queId;
  final Value<String> queText;
  final Value<String> type;
  final Value<int> sampleNumber;
  final Value<int> grade;
  final Value<bool> isAttempted;
  final Value<String?> recordingName;
  const AserToolAnswersTableCompanion({
    this.id = const Value.absent(),
    this.examId = const Value.absent(),
    this.queId = const Value.absent(),
    this.queText = const Value.absent(),
    this.type = const Value.absent(),
    this.sampleNumber = const Value.absent(),
    this.grade = const Value.absent(),
    this.isAttempted = const Value.absent(),
    this.recordingName = const Value.absent(),
  });
  AserToolAnswersTableCompanion.insert({
    this.id = const Value.absent(),
    required String examId,
    required String queId,
    required String queText,
    required String type,
    this.sampleNumber = const Value.absent(),
    this.grade = const Value.absent(),
    this.isAttempted = const Value.absent(),
    this.recordingName = const Value.absent(),
  }) : examId = Value(examId),
       queId = Value(queId),
       queText = Value(queText),
       type = Value(type);
  static Insertable<AserToolAnswersTableData> custom({
    Expression<int>? id,
    Expression<String>? examId,
    Expression<String>? queId,
    Expression<String>? queText,
    Expression<String>? type,
    Expression<int>? sampleNumber,
    Expression<int>? grade,
    Expression<bool>? isAttempted,
    Expression<String>? recordingName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (examId != null) 'exam_id': examId,
      if (queId != null) 'que_id': queId,
      if (queText != null) 'que_text': queText,
      if (type != null) 'type': type,
      if (sampleNumber != null) 'sample_number': sampleNumber,
      if (grade != null) 'grade': grade,
      if (isAttempted != null) 'is_attempted': isAttempted,
      if (recordingName != null) 'recording_name': recordingName,
    });
  }

  AserToolAnswersTableCompanion copyWith({
    Value<int>? id,
    Value<String>? examId,
    Value<String>? queId,
    Value<String>? queText,
    Value<String>? type,
    Value<int>? sampleNumber,
    Value<int>? grade,
    Value<bool>? isAttempted,
    Value<String?>? recordingName,
  }) {
    return AserToolAnswersTableCompanion(
      id: id ?? this.id,
      examId: examId ?? this.examId,
      queId: queId ?? this.queId,
      queText: queText ?? this.queText,
      type: type ?? this.type,
      sampleNumber: sampleNumber ?? this.sampleNumber,
      grade: grade ?? this.grade,
      isAttempted: isAttempted ?? this.isAttempted,
      recordingName: recordingName ?? this.recordingName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (examId.present) {
      map['exam_id'] = Variable<String>(examId.value);
    }
    if (queId.present) {
      map['que_id'] = Variable<String>(queId.value);
    }
    if (queText.present) {
      map['que_text'] = Variable<String>(queText.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (sampleNumber.present) {
      map['sample_number'] = Variable<int>(sampleNumber.value);
    }
    if (grade.present) {
      map['grade'] = Variable<int>(grade.value);
    }
    if (isAttempted.present) {
      map['is_attempted'] = Variable<bool>(isAttempted.value);
    }
    if (recordingName.present) {
      map['recording_name'] = Variable<String>(recordingName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AserToolAnswersTableCompanion(')
          ..write('id: $id, ')
          ..write('examId: $examId, ')
          ..write('queId: $queId, ')
          ..write('queText: $queText, ')
          ..write('type: $type, ')
          ..write('sampleNumber: $sampleNumber, ')
          ..write('grade: $grade, ')
          ..write('isAttempted: $isAttempted, ')
          ..write('recordingName: $recordingName')
          ..write(')'))
        .toString();
  }
}

class $StudentSessionTableTable extends StudentSessionTable
    with TableInfo<$StudentSessionTableTable, StudentSessionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentSessionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _examIdMeta = const VerificationMeta('examId');
  @override
  late final GeneratedColumn<String> examId = GeneratedColumn<String>(
    'exam_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _studIdMeta = const VerificationMeta('studId');
  @override
  late final GeneratedColumn<String> studId = GeneratedColumn<String>(
    'stud_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _crlIdMeta = const VerificationMeta('crlId');
  @override
  late final GeneratedColumn<String> crlId = GeneratedColumn<String>(
    'crl_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sampleNumberMeta = const VerificationMeta(
    'sampleNumber',
  );
  @override
  late final GeneratedColumn<int> sampleNumber = GeneratedColumn<int>(
    'sample_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _childFullNameMeta = const VerificationMeta(
    'childFullName',
  );
  @override
  late final GeneratedColumn<String> childFullName = GeneratedColumn<String>(
    'child_full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proficiencyMeta = const VerificationMeta(
    'proficiency',
  );
  @override
  late final GeneratedColumn<String> proficiency = GeneratedColumn<String>(
    'proficiency',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPushedMeta = const VerificationMeta(
    'isPushed',
  );
  @override
  late final GeneratedColumn<bool> isPushed = GeneratedColumn<bool>(
    'is_pushed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pushed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    examId,
    studId,
    crlId,
    sampleNumber,
    startTime,
    endTime,
    childFullName,
    language,
    proficiency,
    isPushed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student_session_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudentSessionTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('exam_id')) {
      context.handle(
        _examIdMeta,
        examId.isAcceptableOrUnknown(data['exam_id']!, _examIdMeta),
      );
    } else if (isInserting) {
      context.missing(_examIdMeta);
    }
    if (data.containsKey('stud_id')) {
      context.handle(
        _studIdMeta,
        studId.isAcceptableOrUnknown(data['stud_id']!, _studIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studIdMeta);
    }
    if (data.containsKey('crl_id')) {
      context.handle(
        _crlIdMeta,
        crlId.isAcceptableOrUnknown(data['crl_id']!, _crlIdMeta),
      );
    } else if (isInserting) {
      context.missing(_crlIdMeta);
    }
    if (data.containsKey('sample_number')) {
      context.handle(
        _sampleNumberMeta,
        sampleNumber.isAcceptableOrUnknown(
          data['sample_number']!,
          _sampleNumberMeta,
        ),
      );
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('child_full_name')) {
      context.handle(
        _childFullNameMeta,
        childFullName.isAcceptableOrUnknown(
          data['child_full_name']!,
          _childFullNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_childFullNameMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('proficiency')) {
      context.handle(
        _proficiencyMeta,
        proficiency.isAcceptableOrUnknown(
          data['proficiency']!,
          _proficiencyMeta,
        ),
      );
    }
    if (data.containsKey('is_pushed')) {
      context.handle(
        _isPushedMeta,
        isPushed.isAcceptableOrUnknown(data['is_pushed']!, _isPushedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {examId};
  @override
  StudentSessionTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentSessionTableData(
      examId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exam_id'],
      )!,
      studId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stud_id'],
      )!,
      crlId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}crl_id'],
      )!,
      sampleNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sample_number'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_time'],
      ),
      childFullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_full_name'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      proficiency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}proficiency'],
      ),
      isPushed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pushed'],
      )!,
    );
  }

  @override
  $StudentSessionTableTable createAlias(String alias) {
    return $StudentSessionTableTable(attachedDatabase, alias);
  }
}

class StudentSessionTableData extends DataClass
    implements Insertable<StudentSessionTableData> {
  final String examId;
  final String studId;
  final String crlId;
  final int sampleNumber;
  final String startTime;
  final String? endTime;
  final String childFullName;
  final String language;
  final String? proficiency;
  final bool isPushed;
  const StudentSessionTableData({
    required this.examId,
    required this.studId,
    required this.crlId,
    required this.sampleNumber,
    required this.startTime,
    this.endTime,
    required this.childFullName,
    required this.language,
    this.proficiency,
    required this.isPushed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['exam_id'] = Variable<String>(examId);
    map['stud_id'] = Variable<String>(studId);
    map['crl_id'] = Variable<String>(crlId);
    map['sample_number'] = Variable<int>(sampleNumber);
    map['start_time'] = Variable<String>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<String>(endTime);
    }
    map['child_full_name'] = Variable<String>(childFullName);
    map['language'] = Variable<String>(language);
    if (!nullToAbsent || proficiency != null) {
      map['proficiency'] = Variable<String>(proficiency);
    }
    map['is_pushed'] = Variable<bool>(isPushed);
    return map;
  }

  StudentSessionTableCompanion toCompanion(bool nullToAbsent) {
    return StudentSessionTableCompanion(
      examId: Value(examId),
      studId: Value(studId),
      crlId: Value(crlId),
      sampleNumber: Value(sampleNumber),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      childFullName: Value(childFullName),
      language: Value(language),
      proficiency: proficiency == null && nullToAbsent
          ? const Value.absent()
          : Value(proficiency),
      isPushed: Value(isPushed),
    );
  }

  factory StudentSessionTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentSessionTableData(
      examId: serializer.fromJson<String>(json['examId']),
      studId: serializer.fromJson<String>(json['studId']),
      crlId: serializer.fromJson<String>(json['crlId']),
      sampleNumber: serializer.fromJson<int>(json['sampleNumber']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String?>(json['endTime']),
      childFullName: serializer.fromJson<String>(json['childFullName']),
      language: serializer.fromJson<String>(json['language']),
      proficiency: serializer.fromJson<String?>(json['proficiency']),
      isPushed: serializer.fromJson<bool>(json['isPushed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'examId': serializer.toJson<String>(examId),
      'studId': serializer.toJson<String>(studId),
      'crlId': serializer.toJson<String>(crlId),
      'sampleNumber': serializer.toJson<int>(sampleNumber),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String?>(endTime),
      'childFullName': serializer.toJson<String>(childFullName),
      'language': serializer.toJson<String>(language),
      'proficiency': serializer.toJson<String?>(proficiency),
      'isPushed': serializer.toJson<bool>(isPushed),
    };
  }

  StudentSessionTableData copyWith({
    String? examId,
    String? studId,
    String? crlId,
    int? sampleNumber,
    String? startTime,
    Value<String?> endTime = const Value.absent(),
    String? childFullName,
    String? language,
    Value<String?> proficiency = const Value.absent(),
    bool? isPushed,
  }) => StudentSessionTableData(
    examId: examId ?? this.examId,
    studId: studId ?? this.studId,
    crlId: crlId ?? this.crlId,
    sampleNumber: sampleNumber ?? this.sampleNumber,
    startTime: startTime ?? this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    childFullName: childFullName ?? this.childFullName,
    language: language ?? this.language,
    proficiency: proficiency.present ? proficiency.value : this.proficiency,
    isPushed: isPushed ?? this.isPushed,
  );
  StudentSessionTableData copyWithCompanion(StudentSessionTableCompanion data) {
    return StudentSessionTableData(
      examId: data.examId.present ? data.examId.value : this.examId,
      studId: data.studId.present ? data.studId.value : this.studId,
      crlId: data.crlId.present ? data.crlId.value : this.crlId,
      sampleNumber: data.sampleNumber.present
          ? data.sampleNumber.value
          : this.sampleNumber,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      childFullName: data.childFullName.present
          ? data.childFullName.value
          : this.childFullName,
      language: data.language.present ? data.language.value : this.language,
      proficiency: data.proficiency.present
          ? data.proficiency.value
          : this.proficiency,
      isPushed: data.isPushed.present ? data.isPushed.value : this.isPushed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentSessionTableData(')
          ..write('examId: $examId, ')
          ..write('studId: $studId, ')
          ..write('crlId: $crlId, ')
          ..write('sampleNumber: $sampleNumber, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('childFullName: $childFullName, ')
          ..write('language: $language, ')
          ..write('proficiency: $proficiency, ')
          ..write('isPushed: $isPushed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    examId,
    studId,
    crlId,
    sampleNumber,
    startTime,
    endTime,
    childFullName,
    language,
    proficiency,
    isPushed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentSessionTableData &&
          other.examId == this.examId &&
          other.studId == this.studId &&
          other.crlId == this.crlId &&
          other.sampleNumber == this.sampleNumber &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.childFullName == this.childFullName &&
          other.language == this.language &&
          other.proficiency == this.proficiency &&
          other.isPushed == this.isPushed);
}

class StudentSessionTableCompanion
    extends UpdateCompanion<StudentSessionTableData> {
  final Value<String> examId;
  final Value<String> studId;
  final Value<String> crlId;
  final Value<int> sampleNumber;
  final Value<String> startTime;
  final Value<String?> endTime;
  final Value<String> childFullName;
  final Value<String> language;
  final Value<String?> proficiency;
  final Value<bool> isPushed;
  final Value<int> rowid;
  const StudentSessionTableCompanion({
    this.examId = const Value.absent(),
    this.studId = const Value.absent(),
    this.crlId = const Value.absent(),
    this.sampleNumber = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.childFullName = const Value.absent(),
    this.language = const Value.absent(),
    this.proficiency = const Value.absent(),
    this.isPushed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentSessionTableCompanion.insert({
    required String examId,
    required String studId,
    required String crlId,
    this.sampleNumber = const Value.absent(),
    required String startTime,
    this.endTime = const Value.absent(),
    required String childFullName,
    required String language,
    this.proficiency = const Value.absent(),
    this.isPushed = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : examId = Value(examId),
       studId = Value(studId),
       crlId = Value(crlId),
       startTime = Value(startTime),
       childFullName = Value(childFullName),
       language = Value(language);
  static Insertable<StudentSessionTableData> custom({
    Expression<String>? examId,
    Expression<String>? studId,
    Expression<String>? crlId,
    Expression<int>? sampleNumber,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<String>? childFullName,
    Expression<String>? language,
    Expression<String>? proficiency,
    Expression<bool>? isPushed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (examId != null) 'exam_id': examId,
      if (studId != null) 'stud_id': studId,
      if (crlId != null) 'crl_id': crlId,
      if (sampleNumber != null) 'sample_number': sampleNumber,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (childFullName != null) 'child_full_name': childFullName,
      if (language != null) 'language': language,
      if (proficiency != null) 'proficiency': proficiency,
      if (isPushed != null) 'is_pushed': isPushed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentSessionTableCompanion copyWith({
    Value<String>? examId,
    Value<String>? studId,
    Value<String>? crlId,
    Value<int>? sampleNumber,
    Value<String>? startTime,
    Value<String?>? endTime,
    Value<String>? childFullName,
    Value<String>? language,
    Value<String?>? proficiency,
    Value<bool>? isPushed,
    Value<int>? rowid,
  }) {
    return StudentSessionTableCompanion(
      examId: examId ?? this.examId,
      studId: studId ?? this.studId,
      crlId: crlId ?? this.crlId,
      sampleNumber: sampleNumber ?? this.sampleNumber,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      childFullName: childFullName ?? this.childFullName,
      language: language ?? this.language,
      proficiency: proficiency ?? this.proficiency,
      isPushed: isPushed ?? this.isPushed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (examId.present) {
      map['exam_id'] = Variable<String>(examId.value);
    }
    if (studId.present) {
      map['stud_id'] = Variable<String>(studId.value);
    }
    if (crlId.present) {
      map['crl_id'] = Variable<String>(crlId.value);
    }
    if (sampleNumber.present) {
      map['sample_number'] = Variable<int>(sampleNumber.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    if (childFullName.present) {
      map['child_full_name'] = Variable<String>(childFullName.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (proficiency.present) {
      map['proficiency'] = Variable<String>(proficiency.value);
    }
    if (isPushed.present) {
      map['is_pushed'] = Variable<bool>(isPushed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentSessionTableCompanion(')
          ..write('examId: $examId, ')
          ..write('studId: $studId, ')
          ..write('crlId: $crlId, ')
          ..write('sampleNumber: $sampleNumber, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('childFullName: $childFullName, ')
          ..write('language: $language, ')
          ..write('proficiency: $proficiency, ')
          ..write('isPushed: $isPushed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CrlTableTable crlTable = $CrlTableTable(this);
  late final $MunicipalityTableTable municipalityTable =
      $MunicipalityTableTable(this);
  late final $InstituteTableTable instituteTable = $InstituteTableTable(this);
  late final $SchoolTableTable schoolTable = $SchoolTableTable(this);
  late final $ChildSurveyTableTable childSurveyTable = $ChildSurveyTableTable(
    this,
  );
  late final $AserToolTableTable aserToolTable = $AserToolTableTable(this);
  late final $AserToolAnswersTableTable aserToolAnswersTable =
      $AserToolAnswersTableTable(this);
  late final $StudentSessionTableTable studentSessionTable =
      $StudentSessionTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    crlTable,
    municipalityTable,
    instituteTable,
    schoolTable,
    childSurveyTable,
    aserToolTable,
    aserToolAnswersTable,
    studentSessionTable,
  ];
}

typedef $$CrlTableTableCreateCompanionBuilder =
    CrlTableCompanion Function({
      required String crlId,
      Value<String?> roleId,
      Value<String?> roleName,
      Value<String?> programId,
      Value<String?> programName,
      Value<String?> state,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> mobile,
      Value<String?> email,
      Value<String?> block,
      Value<String?> district,
      Value<String?> userName,
      Value<String?> password,
      Value<int> rowid,
    });
typedef $$CrlTableTableUpdateCompanionBuilder =
    CrlTableCompanion Function({
      Value<String> crlId,
      Value<String?> roleId,
      Value<String?> roleName,
      Value<String?> programId,
      Value<String?> programName,
      Value<String?> state,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> mobile,
      Value<String?> email,
      Value<String?> block,
      Value<String?> district,
      Value<String?> userName,
      Value<String?> password,
      Value<int> rowid,
    });

class $$CrlTableTableFilterComposer
    extends Composer<_$AppDatabase, $CrlTableTable> {
  $$CrlTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get crlId => $composableBuilder(
    column: $table.crlId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roleId => $composableBuilder(
    column: $table.roleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roleName => $composableBuilder(
    column: $table.roleName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get programId => $composableBuilder(
    column: $table.programId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get programName => $composableBuilder(
    column: $table.programName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get block => $composableBuilder(
    column: $table.block,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get district => $composableBuilder(
    column: $table.district,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CrlTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CrlTableTable> {
  $$CrlTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get crlId => $composableBuilder(
    column: $table.crlId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roleId => $composableBuilder(
    column: $table.roleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roleName => $composableBuilder(
    column: $table.roleName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get programId => $composableBuilder(
    column: $table.programId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get programName => $composableBuilder(
    column: $table.programName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mobile => $composableBuilder(
    column: $table.mobile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get block => $composableBuilder(
    column: $table.block,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get district => $composableBuilder(
    column: $table.district,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CrlTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CrlTableTable> {
  $$CrlTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get crlId =>
      $composableBuilder(column: $table.crlId, builder: (column) => column);

  GeneratedColumn<String> get roleId =>
      $composableBuilder(column: $table.roleId, builder: (column) => column);

  GeneratedColumn<String> get roleName =>
      $composableBuilder(column: $table.roleName, builder: (column) => column);

  GeneratedColumn<String> get programId =>
      $composableBuilder(column: $table.programId, builder: (column) => column);

  GeneratedColumn<String> get programName => $composableBuilder(
    column: $table.programName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get mobile =>
      $composableBuilder(column: $table.mobile, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get block =>
      $composableBuilder(column: $table.block, builder: (column) => column);

  GeneratedColumn<String> get district =>
      $composableBuilder(column: $table.district, builder: (column) => column);

  GeneratedColumn<String> get userName =>
      $composableBuilder(column: $table.userName, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);
}

class $$CrlTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CrlTableTable,
          CrlTableData,
          $$CrlTableTableFilterComposer,
          $$CrlTableTableOrderingComposer,
          $$CrlTableTableAnnotationComposer,
          $$CrlTableTableCreateCompanionBuilder,
          $$CrlTableTableUpdateCompanionBuilder,
          (
            CrlTableData,
            BaseReferences<_$AppDatabase, $CrlTableTable, CrlTableData>,
          ),
          CrlTableData,
          PrefetchHooks Function()
        > {
  $$CrlTableTableTableManager(_$AppDatabase db, $CrlTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CrlTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CrlTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CrlTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> crlId = const Value.absent(),
                Value<String?> roleId = const Value.absent(),
                Value<String?> roleName = const Value.absent(),
                Value<String?> programId = const Value.absent(),
                Value<String?> programName = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> block = const Value.absent(),
                Value<String?> district = const Value.absent(),
                Value<String?> userName = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CrlTableCompanion(
                crlId: crlId,
                roleId: roleId,
                roleName: roleName,
                programId: programId,
                programName: programName,
                state: state,
                firstName: firstName,
                lastName: lastName,
                mobile: mobile,
                email: email,
                block: block,
                district: district,
                userName: userName,
                password: password,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String crlId,
                Value<String?> roleId = const Value.absent(),
                Value<String?> roleName = const Value.absent(),
                Value<String?> programId = const Value.absent(),
                Value<String?> programName = const Value.absent(),
                Value<String?> state = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> mobile = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> block = const Value.absent(),
                Value<String?> district = const Value.absent(),
                Value<String?> userName = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CrlTableCompanion.insert(
                crlId: crlId,
                roleId: roleId,
                roleName: roleName,
                programId: programId,
                programName: programName,
                state: state,
                firstName: firstName,
                lastName: lastName,
                mobile: mobile,
                email: email,
                block: block,
                district: district,
                userName: userName,
                password: password,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CrlTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CrlTableTable,
      CrlTableData,
      $$CrlTableTableFilterComposer,
      $$CrlTableTableOrderingComposer,
      $$CrlTableTableAnnotationComposer,
      $$CrlTableTableCreateCompanionBuilder,
      $$CrlTableTableUpdateCompanionBuilder,
      (
        CrlTableData,
        BaseReferences<_$AppDatabase, $CrlTableTable, CrlTableData>,
      ),
      CrlTableData,
      PrefetchHooks Function()
    >;
typedef $$MunicipalityTableTableCreateCompanionBuilder =
    MunicipalityTableCompanion Function({
      required String municipalityId,
      required String municipalityName,
      Value<String?> departmentId,
      Value<int> rowid,
    });
typedef $$MunicipalityTableTableUpdateCompanionBuilder =
    MunicipalityTableCompanion Function({
      Value<String> municipalityId,
      Value<String> municipalityName,
      Value<String?> departmentId,
      Value<int> rowid,
    });

class $$MunicipalityTableTableFilterComposer
    extends Composer<_$AppDatabase, $MunicipalityTableTable> {
  $$MunicipalityTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get municipalityId => $composableBuilder(
    column: $table.municipalityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get municipalityName => $composableBuilder(
    column: $table.municipalityName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get departmentId => $composableBuilder(
    column: $table.departmentId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MunicipalityTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MunicipalityTableTable> {
  $$MunicipalityTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get municipalityId => $composableBuilder(
    column: $table.municipalityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get municipalityName => $composableBuilder(
    column: $table.municipalityName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get departmentId => $composableBuilder(
    column: $table.departmentId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MunicipalityTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MunicipalityTableTable> {
  $$MunicipalityTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get municipalityId => $composableBuilder(
    column: $table.municipalityId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get municipalityName => $composableBuilder(
    column: $table.municipalityName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get departmentId => $composableBuilder(
    column: $table.departmentId,
    builder: (column) => column,
  );
}

class $$MunicipalityTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MunicipalityTableTable,
          MunicipalityTableData,
          $$MunicipalityTableTableFilterComposer,
          $$MunicipalityTableTableOrderingComposer,
          $$MunicipalityTableTableAnnotationComposer,
          $$MunicipalityTableTableCreateCompanionBuilder,
          $$MunicipalityTableTableUpdateCompanionBuilder,
          (
            MunicipalityTableData,
            BaseReferences<
              _$AppDatabase,
              $MunicipalityTableTable,
              MunicipalityTableData
            >,
          ),
          MunicipalityTableData,
          PrefetchHooks Function()
        > {
  $$MunicipalityTableTableTableManager(
    _$AppDatabase db,
    $MunicipalityTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MunicipalityTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MunicipalityTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MunicipalityTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> municipalityId = const Value.absent(),
                Value<String> municipalityName = const Value.absent(),
                Value<String?> departmentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MunicipalityTableCompanion(
                municipalityId: municipalityId,
                municipalityName: municipalityName,
                departmentId: departmentId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String municipalityId,
                required String municipalityName,
                Value<String?> departmentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MunicipalityTableCompanion.insert(
                municipalityId: municipalityId,
                municipalityName: municipalityName,
                departmentId: departmentId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MunicipalityTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MunicipalityTableTable,
      MunicipalityTableData,
      $$MunicipalityTableTableFilterComposer,
      $$MunicipalityTableTableOrderingComposer,
      $$MunicipalityTableTableAnnotationComposer,
      $$MunicipalityTableTableCreateCompanionBuilder,
      $$MunicipalityTableTableUpdateCompanionBuilder,
      (
        MunicipalityTableData,
        BaseReferences<
          _$AppDatabase,
          $MunicipalityTableTable,
          MunicipalityTableData
        >,
      ),
      MunicipalityTableData,
      PrefetchHooks Function()
    >;
typedef $$InstituteTableTableCreateCompanionBuilder =
    InstituteTableCompanion Function({
      required String instituteId,
      required String instituteName,
      required String municipalityId,
      Value<int> pushFlag,
      Value<String?> createdDate,
      Value<String?> createdBy,
      Value<int> rowid,
    });
typedef $$InstituteTableTableUpdateCompanionBuilder =
    InstituteTableCompanion Function({
      Value<String> instituteId,
      Value<String> instituteName,
      Value<String> municipalityId,
      Value<int> pushFlag,
      Value<String?> createdDate,
      Value<String?> createdBy,
      Value<int> rowid,
    });

class $$InstituteTableTableFilterComposer
    extends Composer<_$AppDatabase, $InstituteTableTable> {
  $$InstituteTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get instituteId => $composableBuilder(
    column: $table.instituteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instituteName => $composableBuilder(
    column: $table.instituteName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get municipalityId => $composableBuilder(
    column: $table.municipalityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pushFlag => $composableBuilder(
    column: $table.pushFlag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InstituteTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InstituteTableTable> {
  $$InstituteTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get instituteId => $composableBuilder(
    column: $table.instituteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instituteName => $composableBuilder(
    column: $table.instituteName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get municipalityId => $composableBuilder(
    column: $table.municipalityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pushFlag => $composableBuilder(
    column: $table.pushFlag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InstituteTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InstituteTableTable> {
  $$InstituteTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get instituteId => $composableBuilder(
    column: $table.instituteId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get instituteName => $composableBuilder(
    column: $table.instituteName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get municipalityId => $composableBuilder(
    column: $table.municipalityId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pushFlag =>
      $composableBuilder(column: $table.pushFlag, builder: (column) => column);

  GeneratedColumn<String> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);
}

class $$InstituteTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InstituteTableTable,
          InstituteTableData,
          $$InstituteTableTableFilterComposer,
          $$InstituteTableTableOrderingComposer,
          $$InstituteTableTableAnnotationComposer,
          $$InstituteTableTableCreateCompanionBuilder,
          $$InstituteTableTableUpdateCompanionBuilder,
          (
            InstituteTableData,
            BaseReferences<
              _$AppDatabase,
              $InstituteTableTable,
              InstituteTableData
            >,
          ),
          InstituteTableData,
          PrefetchHooks Function()
        > {
  $$InstituteTableTableTableManager(
    _$AppDatabase db,
    $InstituteTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InstituteTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InstituteTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InstituteTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> instituteId = const Value.absent(),
                Value<String> instituteName = const Value.absent(),
                Value<String> municipalityId = const Value.absent(),
                Value<int> pushFlag = const Value.absent(),
                Value<String?> createdDate = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InstituteTableCompanion(
                instituteId: instituteId,
                instituteName: instituteName,
                municipalityId: municipalityId,
                pushFlag: pushFlag,
                createdDate: createdDate,
                createdBy: createdBy,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String instituteId,
                required String instituteName,
                required String municipalityId,
                Value<int> pushFlag = const Value.absent(),
                Value<String?> createdDate = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InstituteTableCompanion.insert(
                instituteId: instituteId,
                instituteName: instituteName,
                municipalityId: municipalityId,
                pushFlag: pushFlag,
                createdDate: createdDate,
                createdBy: createdBy,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InstituteTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InstituteTableTable,
      InstituteTableData,
      $$InstituteTableTableFilterComposer,
      $$InstituteTableTableOrderingComposer,
      $$InstituteTableTableAnnotationComposer,
      $$InstituteTableTableCreateCompanionBuilder,
      $$InstituteTableTableUpdateCompanionBuilder,
      (
        InstituteTableData,
        BaseReferences<_$AppDatabase, $InstituteTableTable, InstituteTableData>,
      ),
      InstituteTableData,
      PrefetchHooks Function()
    >;
typedef $$SchoolTableTableCreateCompanionBuilder =
    SchoolTableCompanion Function({
      required String schoolId,
      required String schoolName,
      required String instituteId,
      Value<int> pushFlag,
      Value<String?> createdDate,
      Value<String?> createdBy,
      Value<int> rowid,
    });
typedef $$SchoolTableTableUpdateCompanionBuilder =
    SchoolTableCompanion Function({
      Value<String> schoolId,
      Value<String> schoolName,
      Value<String> instituteId,
      Value<int> pushFlag,
      Value<String?> createdDate,
      Value<String?> createdBy,
      Value<int> rowid,
    });

class $$SchoolTableTableFilterComposer
    extends Composer<_$AppDatabase, $SchoolTableTable> {
  $$SchoolTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolName => $composableBuilder(
    column: $table.schoolName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instituteId => $composableBuilder(
    column: $table.instituteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pushFlag => $composableBuilder(
    column: $table.pushFlag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SchoolTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SchoolTableTable> {
  $$SchoolTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolName => $composableBuilder(
    column: $table.schoolName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instituteId => $composableBuilder(
    column: $table.instituteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pushFlag => $composableBuilder(
    column: $table.pushFlag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SchoolTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SchoolTableTable> {
  $$SchoolTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get schoolId =>
      $composableBuilder(column: $table.schoolId, builder: (column) => column);

  GeneratedColumn<String> get schoolName => $composableBuilder(
    column: $table.schoolName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get instituteId => $composableBuilder(
    column: $table.instituteId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pushFlag =>
      $composableBuilder(column: $table.pushFlag, builder: (column) => column);

  GeneratedColumn<String> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);
}

class $$SchoolTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SchoolTableTable,
          SchoolTableData,
          $$SchoolTableTableFilterComposer,
          $$SchoolTableTableOrderingComposer,
          $$SchoolTableTableAnnotationComposer,
          $$SchoolTableTableCreateCompanionBuilder,
          $$SchoolTableTableUpdateCompanionBuilder,
          (
            SchoolTableData,
            BaseReferences<_$AppDatabase, $SchoolTableTable, SchoolTableData>,
          ),
          SchoolTableData,
          PrefetchHooks Function()
        > {
  $$SchoolTableTableTableManager(_$AppDatabase db, $SchoolTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchoolTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchoolTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchoolTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> schoolId = const Value.absent(),
                Value<String> schoolName = const Value.absent(),
                Value<String> instituteId = const Value.absent(),
                Value<int> pushFlag = const Value.absent(),
                Value<String?> createdDate = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SchoolTableCompanion(
                schoolId: schoolId,
                schoolName: schoolName,
                instituteId: instituteId,
                pushFlag: pushFlag,
                createdDate: createdDate,
                createdBy: createdBy,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String schoolId,
                required String schoolName,
                required String instituteId,
                Value<int> pushFlag = const Value.absent(),
                Value<String?> createdDate = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SchoolTableCompanion.insert(
                schoolId: schoolId,
                schoolName: schoolName,
                instituteId: instituteId,
                pushFlag: pushFlag,
                createdDate: createdDate,
                createdBy: createdBy,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SchoolTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SchoolTableTable,
      SchoolTableData,
      $$SchoolTableTableFilterComposer,
      $$SchoolTableTableOrderingComposer,
      $$SchoolTableTableAnnotationComposer,
      $$SchoolTableTableCreateCompanionBuilder,
      $$SchoolTableTableUpdateCompanionBuilder,
      (
        SchoolTableData,
        BaseReferences<_$AppDatabase, $SchoolTableTable, SchoolTableData>,
      ),
      SchoolTableData,
      PrefetchHooks Function()
    >;
typedef $$ChildSurveyTableTableCreateCompanionBuilder =
    ChildSurveyTableCompanion Function({
      required String studentId,
      required String studentName,
      Value<String?> age,
      Value<String?> gender,
      Value<String?> instituteId,
      required String schoolId,
      Value<int> pushFlag,
      Value<String?> createdDate,
      Value<String?> createdBy,
      Value<bool> isTestCompleted,
      Value<int> rowid,
    });
typedef $$ChildSurveyTableTableUpdateCompanionBuilder =
    ChildSurveyTableCompanion Function({
      Value<String> studentId,
      Value<String> studentName,
      Value<String?> age,
      Value<String?> gender,
      Value<String?> instituteId,
      Value<String> schoolId,
      Value<int> pushFlag,
      Value<String?> createdDate,
      Value<String?> createdBy,
      Value<bool> isTestCompleted,
      Value<int> rowid,
    });

class $$ChildSurveyTableTableFilterComposer
    extends Composer<_$AppDatabase, $ChildSurveyTableTable> {
  $$ChildSurveyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studentName => $composableBuilder(
    column: $table.studentName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instituteId => $composableBuilder(
    column: $table.instituteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pushFlag => $composableBuilder(
    column: $table.pushFlag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTestCompleted => $composableBuilder(
    column: $table.isTestCompleted,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChildSurveyTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ChildSurveyTableTable> {
  $$ChildSurveyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studentName => $composableBuilder(
    column: $table.studentName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instituteId => $composableBuilder(
    column: $table.instituteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pushFlag => $composableBuilder(
    column: $table.pushFlag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTestCompleted => $composableBuilder(
    column: $table.isTestCompleted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChildSurveyTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChildSurveyTableTable> {
  $$ChildSurveyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get studentName => $composableBuilder(
    column: $table.studentName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get instituteId => $composableBuilder(
    column: $table.instituteId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get schoolId =>
      $composableBuilder(column: $table.schoolId, builder: (column) => column);

  GeneratedColumn<int> get pushFlag =>
      $composableBuilder(column: $table.pushFlag, builder: (column) => column);

  GeneratedColumn<String> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<bool> get isTestCompleted => $composableBuilder(
    column: $table.isTestCompleted,
    builder: (column) => column,
  );
}

class $$ChildSurveyTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChildSurveyTableTable,
          ChildSurveyTableData,
          $$ChildSurveyTableTableFilterComposer,
          $$ChildSurveyTableTableOrderingComposer,
          $$ChildSurveyTableTableAnnotationComposer,
          $$ChildSurveyTableTableCreateCompanionBuilder,
          $$ChildSurveyTableTableUpdateCompanionBuilder,
          (
            ChildSurveyTableData,
            BaseReferences<
              _$AppDatabase,
              $ChildSurveyTableTable,
              ChildSurveyTableData
            >,
          ),
          ChildSurveyTableData,
          PrefetchHooks Function()
        > {
  $$ChildSurveyTableTableTableManager(
    _$AppDatabase db,
    $ChildSurveyTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChildSurveyTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChildSurveyTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChildSurveyTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> studentId = const Value.absent(),
                Value<String> studentName = const Value.absent(),
                Value<String?> age = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> instituteId = const Value.absent(),
                Value<String> schoolId = const Value.absent(),
                Value<int> pushFlag = const Value.absent(),
                Value<String?> createdDate = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<bool> isTestCompleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChildSurveyTableCompanion(
                studentId: studentId,
                studentName: studentName,
                age: age,
                gender: gender,
                instituteId: instituteId,
                schoolId: schoolId,
                pushFlag: pushFlag,
                createdDate: createdDate,
                createdBy: createdBy,
                isTestCompleted: isTestCompleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String studentId,
                required String studentName,
                Value<String?> age = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> instituteId = const Value.absent(),
                required String schoolId,
                Value<int> pushFlag = const Value.absent(),
                Value<String?> createdDate = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<bool> isTestCompleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChildSurveyTableCompanion.insert(
                studentId: studentId,
                studentName: studentName,
                age: age,
                gender: gender,
                instituteId: instituteId,
                schoolId: schoolId,
                pushFlag: pushFlag,
                createdDate: createdDate,
                createdBy: createdBy,
                isTestCompleted: isTestCompleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChildSurveyTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChildSurveyTableTable,
      ChildSurveyTableData,
      $$ChildSurveyTableTableFilterComposer,
      $$ChildSurveyTableTableOrderingComposer,
      $$ChildSurveyTableTableAnnotationComposer,
      $$ChildSurveyTableTableCreateCompanionBuilder,
      $$ChildSurveyTableTableUpdateCompanionBuilder,
      (
        ChildSurveyTableData,
        BaseReferences<
          _$AppDatabase,
          $ChildSurveyTableTable,
          ChildSurveyTableData
        >,
      ),
      ChildSurveyTableData,
      PrefetchHooks Function()
    >;
typedef $$AserToolTableTableCreateCompanionBuilder =
    AserToolTableCompanion Function({
      required String id,
      required String data,
      required String type,
      required String language,
      Value<int> sampleNumber,
      Value<String> year,
      Value<bool> isAttempted,
      Value<int> rowid,
    });
typedef $$AserToolTableTableUpdateCompanionBuilder =
    AserToolTableCompanion Function({
      Value<String> id,
      Value<String> data,
      Value<String> type,
      Value<String> language,
      Value<int> sampleNumber,
      Value<String> year,
      Value<bool> isAttempted,
      Value<int> rowid,
    });

class $$AserToolTableTableFilterComposer
    extends Composer<_$AppDatabase, $AserToolTableTable> {
  $$AserToolTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sampleNumber => $composableBuilder(
    column: $table.sampleNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAttempted => $composableBuilder(
    column: $table.isAttempted,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AserToolTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AserToolTableTable> {
  $$AserToolTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sampleNumber => $composableBuilder(
    column: $table.sampleNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAttempted => $composableBuilder(
    column: $table.isAttempted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AserToolTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AserToolTableTable> {
  $$AserToolTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<int> get sampleNumber => $composableBuilder(
    column: $table.sampleNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<bool> get isAttempted => $composableBuilder(
    column: $table.isAttempted,
    builder: (column) => column,
  );
}

class $$AserToolTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AserToolTableTable,
          AserToolTableData,
          $$AserToolTableTableFilterComposer,
          $$AserToolTableTableOrderingComposer,
          $$AserToolTableTableAnnotationComposer,
          $$AserToolTableTableCreateCompanionBuilder,
          $$AserToolTableTableUpdateCompanionBuilder,
          (
            AserToolTableData,
            BaseReferences<
              _$AppDatabase,
              $AserToolTableTable,
              AserToolTableData
            >,
          ),
          AserToolTableData,
          PrefetchHooks Function()
        > {
  $$AserToolTableTableTableManager(_$AppDatabase db, $AserToolTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AserToolTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AserToolTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AserToolTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<int> sampleNumber = const Value.absent(),
                Value<String> year = const Value.absent(),
                Value<bool> isAttempted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AserToolTableCompanion(
                id: id,
                data: data,
                type: type,
                language: language,
                sampleNumber: sampleNumber,
                year: year,
                isAttempted: isAttempted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String data,
                required String type,
                required String language,
                Value<int> sampleNumber = const Value.absent(),
                Value<String> year = const Value.absent(),
                Value<bool> isAttempted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AserToolTableCompanion.insert(
                id: id,
                data: data,
                type: type,
                language: language,
                sampleNumber: sampleNumber,
                year: year,
                isAttempted: isAttempted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AserToolTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AserToolTableTable,
      AserToolTableData,
      $$AserToolTableTableFilterComposer,
      $$AserToolTableTableOrderingComposer,
      $$AserToolTableTableAnnotationComposer,
      $$AserToolTableTableCreateCompanionBuilder,
      $$AserToolTableTableUpdateCompanionBuilder,
      (
        AserToolTableData,
        BaseReferences<_$AppDatabase, $AserToolTableTable, AserToolTableData>,
      ),
      AserToolTableData,
      PrefetchHooks Function()
    >;
typedef $$AserToolAnswersTableTableCreateCompanionBuilder =
    AserToolAnswersTableCompanion Function({
      Value<int> id,
      required String examId,
      required String queId,
      required String queText,
      required String type,
      Value<int> sampleNumber,
      Value<int> grade,
      Value<bool> isAttempted,
      Value<String?> recordingName,
    });
typedef $$AserToolAnswersTableTableUpdateCompanionBuilder =
    AserToolAnswersTableCompanion Function({
      Value<int> id,
      Value<String> examId,
      Value<String> queId,
      Value<String> queText,
      Value<String> type,
      Value<int> sampleNumber,
      Value<int> grade,
      Value<bool> isAttempted,
      Value<String?> recordingName,
    });

class $$AserToolAnswersTableTableFilterComposer
    extends Composer<_$AppDatabase, $AserToolAnswersTableTable> {
  $$AserToolAnswersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get examId => $composableBuilder(
    column: $table.examId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get queId => $composableBuilder(
    column: $table.queId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get queText => $composableBuilder(
    column: $table.queText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sampleNumber => $composableBuilder(
    column: $table.sampleNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get grade => $composableBuilder(
    column: $table.grade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAttempted => $composableBuilder(
    column: $table.isAttempted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordingName => $composableBuilder(
    column: $table.recordingName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AserToolAnswersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AserToolAnswersTableTable> {
  $$AserToolAnswersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get examId => $composableBuilder(
    column: $table.examId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get queId => $composableBuilder(
    column: $table.queId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get queText => $composableBuilder(
    column: $table.queText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sampleNumber => $composableBuilder(
    column: $table.sampleNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get grade => $composableBuilder(
    column: $table.grade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAttempted => $composableBuilder(
    column: $table.isAttempted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordingName => $composableBuilder(
    column: $table.recordingName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AserToolAnswersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AserToolAnswersTableTable> {
  $$AserToolAnswersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get examId =>
      $composableBuilder(column: $table.examId, builder: (column) => column);

  GeneratedColumn<String> get queId =>
      $composableBuilder(column: $table.queId, builder: (column) => column);

  GeneratedColumn<String> get queText =>
      $composableBuilder(column: $table.queText, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get sampleNumber => $composableBuilder(
    column: $table.sampleNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get grade =>
      $composableBuilder(column: $table.grade, builder: (column) => column);

  GeneratedColumn<bool> get isAttempted => $composableBuilder(
    column: $table.isAttempted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordingName => $composableBuilder(
    column: $table.recordingName,
    builder: (column) => column,
  );
}

class $$AserToolAnswersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AserToolAnswersTableTable,
          AserToolAnswersTableData,
          $$AserToolAnswersTableTableFilterComposer,
          $$AserToolAnswersTableTableOrderingComposer,
          $$AserToolAnswersTableTableAnnotationComposer,
          $$AserToolAnswersTableTableCreateCompanionBuilder,
          $$AserToolAnswersTableTableUpdateCompanionBuilder,
          (
            AserToolAnswersTableData,
            BaseReferences<
              _$AppDatabase,
              $AserToolAnswersTableTable,
              AserToolAnswersTableData
            >,
          ),
          AserToolAnswersTableData,
          PrefetchHooks Function()
        > {
  $$AserToolAnswersTableTableTableManager(
    _$AppDatabase db,
    $AserToolAnswersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AserToolAnswersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AserToolAnswersTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AserToolAnswersTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> examId = const Value.absent(),
                Value<String> queId = const Value.absent(),
                Value<String> queText = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> sampleNumber = const Value.absent(),
                Value<int> grade = const Value.absent(),
                Value<bool> isAttempted = const Value.absent(),
                Value<String?> recordingName = const Value.absent(),
              }) => AserToolAnswersTableCompanion(
                id: id,
                examId: examId,
                queId: queId,
                queText: queText,
                type: type,
                sampleNumber: sampleNumber,
                grade: grade,
                isAttempted: isAttempted,
                recordingName: recordingName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String examId,
                required String queId,
                required String queText,
                required String type,
                Value<int> sampleNumber = const Value.absent(),
                Value<int> grade = const Value.absent(),
                Value<bool> isAttempted = const Value.absent(),
                Value<String?> recordingName = const Value.absent(),
              }) => AserToolAnswersTableCompanion.insert(
                id: id,
                examId: examId,
                queId: queId,
                queText: queText,
                type: type,
                sampleNumber: sampleNumber,
                grade: grade,
                isAttempted: isAttempted,
                recordingName: recordingName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AserToolAnswersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AserToolAnswersTableTable,
      AserToolAnswersTableData,
      $$AserToolAnswersTableTableFilterComposer,
      $$AserToolAnswersTableTableOrderingComposer,
      $$AserToolAnswersTableTableAnnotationComposer,
      $$AserToolAnswersTableTableCreateCompanionBuilder,
      $$AserToolAnswersTableTableUpdateCompanionBuilder,
      (
        AserToolAnswersTableData,
        BaseReferences<
          _$AppDatabase,
          $AserToolAnswersTableTable,
          AserToolAnswersTableData
        >,
      ),
      AserToolAnswersTableData,
      PrefetchHooks Function()
    >;
typedef $$StudentSessionTableTableCreateCompanionBuilder =
    StudentSessionTableCompanion Function({
      required String examId,
      required String studId,
      required String crlId,
      Value<int> sampleNumber,
      required String startTime,
      Value<String?> endTime,
      required String childFullName,
      required String language,
      Value<String?> proficiency,
      Value<bool> isPushed,
      Value<int> rowid,
    });
typedef $$StudentSessionTableTableUpdateCompanionBuilder =
    StudentSessionTableCompanion Function({
      Value<String> examId,
      Value<String> studId,
      Value<String> crlId,
      Value<int> sampleNumber,
      Value<String> startTime,
      Value<String?> endTime,
      Value<String> childFullName,
      Value<String> language,
      Value<String?> proficiency,
      Value<bool> isPushed,
      Value<int> rowid,
    });

class $$StudentSessionTableTableFilterComposer
    extends Composer<_$AppDatabase, $StudentSessionTableTable> {
  $$StudentSessionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get examId => $composableBuilder(
    column: $table.examId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studId => $composableBuilder(
    column: $table.studId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get crlId => $composableBuilder(
    column: $table.crlId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sampleNumber => $composableBuilder(
    column: $table.sampleNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childFullName => $composableBuilder(
    column: $table.childFullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get proficiency => $composableBuilder(
    column: $table.proficiency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPushed => $composableBuilder(
    column: $table.isPushed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudentSessionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentSessionTableTable> {
  $$StudentSessionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get examId => $composableBuilder(
    column: $table.examId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studId => $composableBuilder(
    column: $table.studId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get crlId => $composableBuilder(
    column: $table.crlId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sampleNumber => $composableBuilder(
    column: $table.sampleNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childFullName => $composableBuilder(
    column: $table.childFullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get proficiency => $composableBuilder(
    column: $table.proficiency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPushed => $composableBuilder(
    column: $table.isPushed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudentSessionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentSessionTableTable> {
  $$StudentSessionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get examId =>
      $composableBuilder(column: $table.examId, builder: (column) => column);

  GeneratedColumn<String> get studId =>
      $composableBuilder(column: $table.studId, builder: (column) => column);

  GeneratedColumn<String> get crlId =>
      $composableBuilder(column: $table.crlId, builder: (column) => column);

  GeneratedColumn<int> get sampleNumber => $composableBuilder(
    column: $table.sampleNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get childFullName => $composableBuilder(
    column: $table.childFullName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get proficiency => $composableBuilder(
    column: $table.proficiency,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPushed =>
      $composableBuilder(column: $table.isPushed, builder: (column) => column);
}

class $$StudentSessionTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentSessionTableTable,
          StudentSessionTableData,
          $$StudentSessionTableTableFilterComposer,
          $$StudentSessionTableTableOrderingComposer,
          $$StudentSessionTableTableAnnotationComposer,
          $$StudentSessionTableTableCreateCompanionBuilder,
          $$StudentSessionTableTableUpdateCompanionBuilder,
          (
            StudentSessionTableData,
            BaseReferences<
              _$AppDatabase,
              $StudentSessionTableTable,
              StudentSessionTableData
            >,
          ),
          StudentSessionTableData,
          PrefetchHooks Function()
        > {
  $$StudentSessionTableTableTableManager(
    _$AppDatabase db,
    $StudentSessionTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentSessionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentSessionTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$StudentSessionTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> examId = const Value.absent(),
                Value<String> studId = const Value.absent(),
                Value<String> crlId = const Value.absent(),
                Value<int> sampleNumber = const Value.absent(),
                Value<String> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<String> childFullName = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String?> proficiency = const Value.absent(),
                Value<bool> isPushed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentSessionTableCompanion(
                examId: examId,
                studId: studId,
                crlId: crlId,
                sampleNumber: sampleNumber,
                startTime: startTime,
                endTime: endTime,
                childFullName: childFullName,
                language: language,
                proficiency: proficiency,
                isPushed: isPushed,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String examId,
                required String studId,
                required String crlId,
                Value<int> sampleNumber = const Value.absent(),
                required String startTime,
                Value<String?> endTime = const Value.absent(),
                required String childFullName,
                required String language,
                Value<String?> proficiency = const Value.absent(),
                Value<bool> isPushed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentSessionTableCompanion.insert(
                examId: examId,
                studId: studId,
                crlId: crlId,
                sampleNumber: sampleNumber,
                startTime: startTime,
                endTime: endTime,
                childFullName: childFullName,
                language: language,
                proficiency: proficiency,
                isPushed: isPushed,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudentSessionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentSessionTableTable,
      StudentSessionTableData,
      $$StudentSessionTableTableFilterComposer,
      $$StudentSessionTableTableOrderingComposer,
      $$StudentSessionTableTableAnnotationComposer,
      $$StudentSessionTableTableCreateCompanionBuilder,
      $$StudentSessionTableTableUpdateCompanionBuilder,
      (
        StudentSessionTableData,
        BaseReferences<
          _$AppDatabase,
          $StudentSessionTableTable,
          StudentSessionTableData
        >,
      ),
      StudentSessionTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CrlTableTableTableManager get crlTable =>
      $$CrlTableTableTableManager(_db, _db.crlTable);
  $$MunicipalityTableTableTableManager get municipalityTable =>
      $$MunicipalityTableTableTableManager(_db, _db.municipalityTable);
  $$InstituteTableTableTableManager get instituteTable =>
      $$InstituteTableTableTableManager(_db, _db.instituteTable);
  $$SchoolTableTableTableManager get schoolTable =>
      $$SchoolTableTableTableManager(_db, _db.schoolTable);
  $$ChildSurveyTableTableTableManager get childSurveyTable =>
      $$ChildSurveyTableTableTableManager(_db, _db.childSurveyTable);
  $$AserToolTableTableTableManager get aserToolTable =>
      $$AserToolTableTableTableManager(_db, _db.aserToolTable);
  $$AserToolAnswersTableTableTableManager get aserToolAnswersTable =>
      $$AserToolAnswersTableTableTableManager(_db, _db.aserToolAnswersTable);
  $$StudentSessionTableTableTableManager get studentSessionTable =>
      $$StudentSessionTableTableTableManager(_db, _db.studentSessionTable);
}
