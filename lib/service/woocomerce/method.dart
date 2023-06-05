import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:cttns/woo.dart';
import 'package:http/http.dart' as http;

class MethodApi {
  static Future<List<dynamic>> getApi(String url) async {
    String consumerKey = Woo.consumerKey;
    String consumerSecret = Woo.consumerSecret;

    Map<String, String> parameters = {
      'oauth_consumer_key': consumerKey,
      'oauth_nonce': generateNonce(),
      'oauth_signature_method': 'HMAC-SHA1',
      'oauth_timestamp': generateTimestamp(),
      'oauth_version': '1.0'
    };
    String signature =
        generateOAuthSignature('GET', url, parameters, consumerSecret);
    parameters['oauth_signature'] = signature;
    final encodedParams = Uri(queryParameters: parameters).query;

    final requestUrl = '$url?$encodedParams';
    try {
      final response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data; // products = data.map((e) => Product.fromJson(e)).toList();
      }
    } catch (e) {
      print("Error get api:$e");
    }
    return [];
  }
}

String generateNonce() {
  final random = Random();
  const String chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final nonce = String.fromCharCodes(Iterable.generate(
      11, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  return nonce;
}

String generateTimestamp() {
  final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  return timestamp.toString();
}

String generateOAuthSignature(String method, String baseUri,
    Map<String, String> parameters, String consumerSecret) {
  // Step 3: Normalize and encode query string parameters
  List<String> encodedParams = [];
  parameters.forEach((key, value) {
    encodedParams
        .add('${Uri.encodeComponent(key)}=${Uri.encodeComponent(value)}');
  });
  encodedParams.sort();
  // Step 5: Join parameters with encoded equals sign (%3D)
  String paramString = encodedParams.join('&');
  String parameterString =
      paramString.replaceAll('=', '%3D').replaceAll('&', '%26');
  String signatureBaseString =
      '$method&${Uri.encodeComponent(baseUri)}&$parameterString';
  // Step 8: Generate the signature
  String key = '${Uri.encodeComponent(Woo.consumerSecret)}&';
  String signature = base64.encode(Hmac(sha1, utf8.encode(key))
      .convert(utf8.encode(signatureBaseString))
      .bytes);
  var encodedSignature = Uri.encodeComponent(signature);

  return encodedSignature;
}
