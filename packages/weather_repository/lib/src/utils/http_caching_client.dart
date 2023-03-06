import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:quiver/collection.dart';

/// An HTTP client which wraps another HTTP client to provide caching
/// functionality.
class HttpCachingClient extends http.BaseClient implements http.Client {
  /// The HTTP client that handles sending requests.
  final http.Client _client;

  /// The HTTP response cache.
  final Map<String, _CacheRecord> _cache;

  /// A function which returns True if caching should be performed for the URI and false otherwise.
  final bool Function(Uri) _filter;

  HttpCachingClient(
    http.Client client, {
    bool Function(Uri)? filter,
    int cacheSize = 10,
  })  : _client = client,
        _cache = LruMap(maximumSize: cacheSize),
        _filter = filter ?? ((_) => true);

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    if (!_filter(url)) {
      return super.get(url, headers: headers);
    }

    final cacheRecord = _cache[url.toString()];
    if (cacheRecord != null && _shouldUseCachedResponse(cacheRecord, headers)) {
      return cacheRecord.response;
    }

    final response = await super.get(url, headers: headers);

    final maxAge = int.tryParse(
      response.headers['cache-control']
              ?.split(',')
              .map((token) => token.trim())
              .firstWhereOrNull((token) => token.startsWith('max-age'))
              ?.split('=')
              .lastOrNull ??
          '',
    );
    final responseDate = tryParseDateHeader(response.headers['date'] ?? '');

    if (maxAge == null || responseDate == null) {
      return response;
    }

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      _cache[url.toString()] = _CacheRecord(
        expirationDate: responseDate.add(Duration(seconds: maxAge)),
        url: url,
        requestHeaders: headers,
        response: response,
      );
    }

    return response;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request);
  }
}

class _CacheRecord {
  /// The expiration date for the response.
  final DateTime expirationDate;

  /// The response URI.
  final Uri url;

  /// The request headers that were sent.
  final Map<String, String>? requestHeaders;

  /// The response.
  final http.Response response;

  const _CacheRecord({
    required this.expirationDate,
    required this.url,
    required this.requestHeaders,
    required this.response,
  });
}

bool _doRequestHeadersMatch(Map<String, String>? a, Map<String, String>? b) {
  return (a == null && b == null) ||
      (a is Map && b is Map && DeepCollectionEquality().equals(a, b));
}

bool _shouldUseCachedResponse(
  _CacheRecord cacheRecord,
  Map<String, String>? requestHeaders,
) {
  return (cacheRecord.expirationDate.isAfter(DateTime.now()) &&
      _doRequestHeadersMatch(cacheRecord.requestHeaders, requestHeaders));
}

/// Attempts to parse the date header of an HTTP response.
DateTime? tryParseDateHeader(String header) {
  try {
    return DateFormat('EEE, dd MMM yyyy HH:mm:ss').parseUtc(header);
  } on FormatException {
    return null;
  }
}
