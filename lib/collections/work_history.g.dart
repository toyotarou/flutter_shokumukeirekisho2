// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkHistoryCollection on Isar {
  IsarCollection<WorkHistory> get workHistorys => this.collection();
}

const WorkHistorySchema = CollectionSchema(
  name: r'WorkHistory',
  id: 1156323439076079268,
  properties: {
    r'endDate': PropertySchema(
      id: 0,
      name: r'endDate',
      type: IsarType.string,
    ),
    r'factAgentId': PropertySchema(
      id: 1,
      name: r'factAgentId',
      type: IsarType.long,
    ),
    r'factFake': PropertySchema(
      id: 2,
      name: r'factFake',
      type: IsarType.long,
    ),
    r'factSite': PropertySchema(
      id: 3,
      name: r'factSite',
      type: IsarType.string,
    ),
    r'fakeAgentId': PropertySchema(
      id: 4,
      name: r'fakeAgentId',
      type: IsarType.long,
    ),
    r'fakeSite': PropertySchema(
      id: 5,
      name: r'fakeSite',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 6,
      name: r'startDate',
      type: IsarType.string,
    )
  },
  estimateSize: _workHistoryEstimateSize,
  serialize: _workHistorySerialize,
  deserialize: _workHistoryDeserialize,
  deserializeProp: _workHistoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _workHistoryGetId,
  getLinks: _workHistoryGetLinks,
  attach: _workHistoryAttach,
  version: '3.1.0+1',
);

int _workHistoryEstimateSize(
  WorkHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.endDate.length * 3;
  bytesCount += 3 + object.factSite.length * 3;
  bytesCount += 3 + object.fakeSite.length * 3;
  bytesCount += 3 + object.startDate.length * 3;
  return bytesCount;
}

void _workHistorySerialize(
  WorkHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.endDate);
  writer.writeLong(offsets[1], object.factAgentId);
  writer.writeLong(offsets[2], object.factFake);
  writer.writeString(offsets[3], object.factSite);
  writer.writeLong(offsets[4], object.fakeAgentId);
  writer.writeString(offsets[5], object.fakeSite);
  writer.writeString(offsets[6], object.startDate);
}

WorkHistory _workHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkHistory();
  object.endDate = reader.readString(offsets[0]);
  object.factAgentId = reader.readLong(offsets[1]);
  object.factFake = reader.readLong(offsets[2]);
  object.factSite = reader.readString(offsets[3]);
  object.fakeAgentId = reader.readLong(offsets[4]);
  object.fakeSite = reader.readString(offsets[5]);
  object.id = id;
  object.startDate = reader.readString(offsets[6]);
  return object;
}

P _workHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workHistoryGetId(WorkHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workHistoryGetLinks(WorkHistory object) {
  return [];
}

void _workHistoryAttach(
    IsarCollection<dynamic> col, Id id, WorkHistory object) {
  object.id = id;
}

extension WorkHistoryQueryWhereSort
    on QueryBuilder<WorkHistory, WorkHistory, QWhere> {
  QueryBuilder<WorkHistory, WorkHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkHistoryQueryWhere
    on QueryBuilder<WorkHistory, WorkHistory, QWhereClause> {
  QueryBuilder<WorkHistory, WorkHistory, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WorkHistoryQueryFilter
    on QueryBuilder<WorkHistory, WorkHistory, QFilterCondition> {
  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> endDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      endDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> endDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> endDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      endDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> endDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> endDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> endDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      endDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      endDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endDate',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'factAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'factAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'factAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'factAgentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> factFakeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'factFake',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factFakeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'factFake',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factFakeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'factFake',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> factFakeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'factFake',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> factSiteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'factSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factSiteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'factSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factSiteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'factSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> factSiteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'factSite',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factSiteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'factSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factSiteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'factSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factSiteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'factSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> factSiteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'factSite',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factSiteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'factSite',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factSiteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'factSite',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      fakeAgentIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fakeAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      fakeAgentIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fakeAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      fakeAgentIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fakeAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      fakeAgentIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fakeAgentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> fakeSiteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fakeSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      fakeSiteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fakeSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      fakeSiteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fakeSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> fakeSiteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fakeSite',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      fakeSiteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fakeSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      fakeSiteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fakeSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      fakeSiteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fakeSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> fakeSiteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fakeSite',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      fakeSiteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fakeSite',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      fakeSiteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fakeSite',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      startDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      startDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      startDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      startDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      startDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      startDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      startDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'startDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      startDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'startDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      startDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      startDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'startDate',
        value: '',
      ));
    });
  }
}

extension WorkHistoryQueryObject
    on QueryBuilder<WorkHistory, WorkHistory, QFilterCondition> {}

extension WorkHistoryQueryLinks
    on QueryBuilder<WorkHistory, WorkHistory, QFilterCondition> {}

extension WorkHistoryQuerySortBy
    on QueryBuilder<WorkHistory, WorkHistory, QSortBy> {
  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByFactAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factAgentId', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByFactAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factAgentId', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByFactFake() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factFake', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByFactFakeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factFake', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByFactSite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factSite', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByFactSiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factSite', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByFakeAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fakeAgentId', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByFakeAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fakeAgentId', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByFakeSite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fakeSite', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByFakeSiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fakeSite', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension WorkHistoryQuerySortThenBy
    on QueryBuilder<WorkHistory, WorkHistory, QSortThenBy> {
  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByFactAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factAgentId', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByFactAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factAgentId', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByFactFake() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factFake', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByFactFakeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factFake', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByFactSite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factSite', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByFactSiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factSite', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByFakeAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fakeAgentId', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByFakeAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fakeAgentId', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByFakeSite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fakeSite', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByFakeSiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fakeSite', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension WorkHistoryQueryWhereDistinct
    on QueryBuilder<WorkHistory, WorkHistory, QDistinct> {
  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByEndDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByFactAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factAgentId');
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByFactFake() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factFake');
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByFactSite(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factSite', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByFakeAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fakeAgentId');
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByFakeSite(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fakeSite', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByStartDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate', caseSensitive: caseSensitive);
    });
  }
}

extension WorkHistoryQueryProperty
    on QueryBuilder<WorkHistory, WorkHistory, QQueryProperty> {
  QueryBuilder<WorkHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkHistory, String, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<WorkHistory, int, QQueryOperations> factAgentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factAgentId');
    });
  }

  QueryBuilder<WorkHistory, int, QQueryOperations> factFakeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factFake');
    });
  }

  QueryBuilder<WorkHistory, String, QQueryOperations> factSiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factSite');
    });
  }

  QueryBuilder<WorkHistory, int, QQueryOperations> fakeAgentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fakeAgentId');
    });
  }

  QueryBuilder<WorkHistory, String, QQueryOperations> fakeSiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fakeSite');
    });
  }

  QueryBuilder<WorkHistory, String, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }
}
