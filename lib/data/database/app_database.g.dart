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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CrlTableTable crlTable = $CrlTableTable(this);
  late final $MunicipalityTableTable municipalityTable =
      $MunicipalityTableTable(this);
  late final $InstituteTableTable instituteTable = $InstituteTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    crlTable,
    municipalityTable,
    instituteTable,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CrlTableTableTableManager get crlTable =>
      $$CrlTableTableTableManager(_db, _db.crlTable);
  $$MunicipalityTableTableTableManager get municipalityTable =>
      $$MunicipalityTableTableTableManager(_db, _db.municipalityTable);
  $$InstituteTableTableTableManager get instituteTable =>
      $$InstituteTableTableTableManager(_db, _db.instituteTable);
}
