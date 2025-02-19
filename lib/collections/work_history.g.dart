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
    r'factAgentId': PropertySchema(
      id: 0,
      name: r'factAgentId',
      type: IsarType.string,
    ),
    r'factSite': PropertySchema(
      id: 1,
      name: r'factSite',
      type: IsarType.string,
    ),
    r'fakeSite': PropertySchema(
      id: 2,
      name: r'fakeSite',
      type: IsarType.string,
    ),
    r'month': PropertySchema(
      id: 3,
      name: r'month',
      type: IsarType.string,
    ),
    r'year': PropertySchema(
      id: 4,
      name: r'year',
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
  bytesCount += 3 + object.factAgentId.length * 3;
  bytesCount += 3 + object.factSite.length * 3;
  bytesCount += 3 + object.fakeSite.length * 3;
  bytesCount += 3 + object.month.length * 3;
  bytesCount += 3 + object.year.length * 3;
  return bytesCount;
}

void _workHistorySerialize(
  WorkHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.factAgentId);
  writer.writeString(offsets[1], object.factSite);
  writer.writeString(offsets[2], object.fakeSite);
  writer.writeString(offsets[3], object.month);
  writer.writeString(offsets[4], object.year);
}

WorkHistory _workHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkHistory();
  object.factAgentId = reader.readString(offsets[0]);
  object.factSite = reader.readString(offsets[1]);
  object.fakeSite = reader.readString(offsets[2]);
  object.id = id;
  object.month = reader.readString(offsets[3]);
  object.year = reader.readString(offsets[4]);
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
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
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
  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'factAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'factAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'factAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'factAgentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'factAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'factAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'factAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'factAgentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'factAgentId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      factAgentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'factAgentId',
        value: '',
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

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> monthEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      monthGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'month',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> monthLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'month',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> monthBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> monthStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'month',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> monthEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'month',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> monthContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'month',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> monthMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'month',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> monthIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      monthIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'month',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> yearEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> yearGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> yearLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> yearBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> yearStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> yearEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> yearContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> yearMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'year',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition> yearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterFilterCondition>
      yearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'year',
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

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension WorkHistoryQuerySortThenBy
    on QueryBuilder<WorkHistory, WorkHistory, QSortThenBy> {
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

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension WorkHistoryQueryWhereDistinct
    on QueryBuilder<WorkHistory, WorkHistory, QDistinct> {
  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByFactAgentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factAgentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByFactSite(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factSite', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByFakeSite(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fakeSite', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByMonth(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkHistory, WorkHistory, QDistinct> distinctByYear(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year', caseSensitive: caseSensitive);
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

  QueryBuilder<WorkHistory, String, QQueryOperations> factAgentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factAgentId');
    });
  }

  QueryBuilder<WorkHistory, String, QQueryOperations> factSiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factSite');
    });
  }

  QueryBuilder<WorkHistory, String, QQueryOperations> fakeSiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fakeSite');
    });
  }

  QueryBuilder<WorkHistory, String, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<WorkHistory, String, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
