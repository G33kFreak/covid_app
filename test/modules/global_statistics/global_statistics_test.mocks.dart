// Mocks generated by Mockito 5.0.17 from annotations
// in covid_app/test/modules/global_statistics/global_statistics_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:covid_app/repositories/statistics/abstract_statistics_repository.dart'
    as _i5;
import 'package:covid_app/repositories/statistics/models/global_range_stat.dart'
    as _i3;
import 'package:covid_app/repositories/statistics/models/global_statistics.dart'
    as _i2;
import 'package:dio/dio.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGlobalStatistics_0 extends _i1.Fake implements _i2.GlobalStatistics {
}

class _FakeGlobalRangeStat_1 extends _i1.Fake implements _i3.GlobalRangeStat {}

class _FakeBaseOptions_2 extends _i1.Fake implements _i4.BaseOptions {}

class _FakeHttpClientAdapter_3 extends _i1.Fake
    implements _i4.HttpClientAdapter {}

class _FakeTransformer_4 extends _i1.Fake implements _i4.Transformer {}

class _FakeInterceptors_5 extends _i1.Fake implements _i4.Interceptors {}

class _FakeResponse_6<T> extends _i1.Fake implements _i4.Response<T> {}

/// A class which mocks [IStatisticsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIStatisticsRepository extends _i1.Mock
    implements _i5.IStatisticsRepository {
  MockIStatisticsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.GlobalStatistics> getGlobalStatistics(_i4.Dio? client) =>
      (super.noSuchMethod(Invocation.method(#getGlobalStatistics, [client]),
              returnValue:
                  Future<_i2.GlobalStatistics>.value(_FakeGlobalStatistics_0()))
          as _i6.Future<_i2.GlobalStatistics>);
  @override
  _i6.Future<_i3.GlobalRangeStat> getGlobalRangeStat(_i4.Dio? client,
          {DateTime? from, DateTime? to}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getGlobalRangeStat, [client], {#from: from, #to: to}),
              returnValue:
                  Future<_i3.GlobalRangeStat>.value(_FakeGlobalRangeStat_1()))
          as _i6.Future<_i3.GlobalRangeStat>);
}

/// A class which mocks [Dio].
///
/// See the documentation for Mockito's code generation for more information.
class MockDio extends _i1.Mock implements _i4.Dio {
  MockDio() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.BaseOptions get options =>
      (super.noSuchMethod(Invocation.getter(#options),
          returnValue: _FakeBaseOptions_2()) as _i4.BaseOptions);
  @override
  set options(_i4.BaseOptions? _options) =>
      super.noSuchMethod(Invocation.setter(#options, _options),
          returnValueForMissingStub: null);
  @override
  _i4.HttpClientAdapter get httpClientAdapter =>
      (super.noSuchMethod(Invocation.getter(#httpClientAdapter),
          returnValue: _FakeHttpClientAdapter_3()) as _i4.HttpClientAdapter);
  @override
  set httpClientAdapter(_i4.HttpClientAdapter? _httpClientAdapter) => super
      .noSuchMethod(Invocation.setter(#httpClientAdapter, _httpClientAdapter),
          returnValueForMissingStub: null);
  @override
  _i4.Transformer get transformer =>
      (super.noSuchMethod(Invocation.getter(#transformer),
          returnValue: _FakeTransformer_4()) as _i4.Transformer);
  @override
  set transformer(_i4.Transformer? _transformer) =>
      super.noSuchMethod(Invocation.setter(#transformer, _transformer),
          returnValueForMissingStub: null);
  @override
  _i4.Interceptors get interceptors =>
      (super.noSuchMethod(Invocation.getter(#interceptors),
          returnValue: _FakeInterceptors_5()) as _i4.Interceptors);
  @override
  void close({bool? force = false}) =>
      super.noSuchMethod(Invocation.method(#close, [], {#force: force}),
          returnValueForMissingStub: null);
  @override
  _i6.Future<_i4.Response<T>> get<T>(String? path,
          {Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i4.CancelToken? cancelToken,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [
                path
              ], {
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> getUri<T>(Uri? uri,
          {_i4.Options? options,
          _i4.CancelToken? cancelToken,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#getUri, [
                uri
              ], {
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> post<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i4.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> postUri<T>(Uri? uri,
          {dynamic data,
          _i4.Options? options,
          _i4.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#postUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> put<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i4.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> putUri<T>(Uri? uri,
          {dynamic data,
          _i4.Options? options,
          _i4.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#putUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> head<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i4.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#head, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> headUri<T>(Uri? uri,
          {dynamic data, _i4.Options? options, _i4.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#headUri, [uri],
                  {#data: data, #options: options, #cancelToken: cancelToken}),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> delete<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i4.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> deleteUri<T>(Uri? uri,
          {dynamic data, _i4.Options? options, _i4.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#deleteUri, [uri],
                  {#data: data, #options: options, #cancelToken: cancelToken}),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> patch<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i4.Options? options,
          _i4.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> patchUri<T>(Uri? uri,
          {dynamic data,
          _i4.Options? options,
          _i4.CancelToken? cancelToken,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#patchUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  void lock() => super.noSuchMethod(Invocation.method(#lock, []),
      returnValueForMissingStub: null);
  @override
  void unlock() => super.noSuchMethod(Invocation.method(#unlock, []),
      returnValueForMissingStub: null);
  @override
  void clear() => super.noSuchMethod(Invocation.method(#clear, []),
      returnValueForMissingStub: null);
  @override
  _i6.Future<_i4.Response<dynamic>> download(String? urlPath, dynamic savePath,
          {_i4.ProgressCallback? onReceiveProgress,
          Map<String, dynamic>? queryParameters,
          _i4.CancelToken? cancelToken,
          bool? deleteOnError = true,
          String? lengthHeader = r'content-length',
          dynamic data,
          _i4.Options? options}) =>
      (super.noSuchMethod(
              Invocation.method(#download, [
                urlPath,
                savePath
              ], {
                #onReceiveProgress: onReceiveProgress,
                #queryParameters: queryParameters,
                #cancelToken: cancelToken,
                #deleteOnError: deleteOnError,
                #lengthHeader: lengthHeader,
                #data: data,
                #options: options
              }),
              returnValue: Future<_i4.Response<dynamic>>.value(
                  _FakeResponse_6<dynamic>()))
          as _i6.Future<_i4.Response<dynamic>>);
  @override
  _i6.Future<_i4.Response<dynamic>> downloadUri(Uri? uri, dynamic savePath,
          {_i4.ProgressCallback? onReceiveProgress,
          _i4.CancelToken? cancelToken,
          bool? deleteOnError = true,
          String? lengthHeader = r'content-length',
          dynamic data,
          _i4.Options? options}) =>
      (super.noSuchMethod(
              Invocation.method(#downloadUri, [
                uri,
                savePath
              ], {
                #onReceiveProgress: onReceiveProgress,
                #cancelToken: cancelToken,
                #deleteOnError: deleteOnError,
                #lengthHeader: lengthHeader,
                #data: data,
                #options: options
              }),
              returnValue: Future<_i4.Response<dynamic>>.value(
                  _FakeResponse_6<dynamic>()))
          as _i6.Future<_i4.Response<dynamic>>);
  @override
  _i6.Future<_i4.Response<T>> request<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i4.CancelToken? cancelToken,
          _i4.Options? options,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#request, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> requestUri<T>(Uri? uri,
          {dynamic data,
          _i4.CancelToken? cancelToken,
          _i4.Options? options,
          _i4.ProgressCallback? onSendProgress,
          _i4.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#requestUri, [
                uri
              ], {
                #data: data,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
  @override
  _i6.Future<_i4.Response<T>> fetch<T>(_i4.RequestOptions? requestOptions) =>
      (super.noSuchMethod(Invocation.method(#fetch, [requestOptions]),
              returnValue: Future<_i4.Response<T>>.value(_FakeResponse_6<T>()))
          as _i6.Future<_i4.Response<T>>);
}

/// A class which mocks [GlobalStatistics].
///
/// See the documentation for Mockito's code generation for more information.
class MockGlobalStatistics extends _i1.Mock implements _i2.GlobalStatistics {
  MockGlobalStatistics() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get newConfirmed =>
      (super.noSuchMethod(Invocation.getter(#newConfirmed), returnValue: 0)
          as int);
  @override
  int get totalConfirmed =>
      (super.noSuchMethod(Invocation.getter(#totalConfirmed), returnValue: 0)
          as int);
  @override
  int get newDeaths =>
      (super.noSuchMethod(Invocation.getter(#newDeaths), returnValue: 0)
          as int);
  @override
  int get totalDeaths =>
      (super.noSuchMethod(Invocation.getter(#totalDeaths), returnValue: 0)
          as int);
  @override
  int get newRecovered =>
      (super.noSuchMethod(Invocation.getter(#newRecovered), returnValue: 0)
          as int);
  @override
  int get totalRecovered =>
      (super.noSuchMethod(Invocation.getter(#totalRecovered), returnValue: 0)
          as int);
  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
}

/// A class which mocks [GlobalRangeStat].
///
/// See the documentation for Mockito's code generation for more information.
class MockGlobalRangeStat extends _i1.Mock implements _i3.GlobalRangeStat {
  MockGlobalRangeStat() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i2.GlobalStatistics> get statistics =>
      (super.noSuchMethod(Invocation.getter(#statistics),
          returnValue: <_i2.GlobalStatistics>[]) as List<_i2.GlobalStatistics>);
  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
}