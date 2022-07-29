import 'package:crypto_bloc/crypto_news/model/crypto.dart';
import 'package:http/http.dart';
// to do all network services
class CryptoService {
   String url =
      "https://cryptopanic.com/api/v1/posts/?auth_token=249d42fc0f64643c9b088c3506ea007e17587a2b&public=true";


/// to fetch all data from api
  Future<Crypto> getCryptoNews() async {


/// get request to fetch details from the api
    final response = await get(Uri.parse(url));
    /// mapping json data into string
    final cryptoNews = cryptoFromJson(response.body);
    return cryptoNews;
  }
}
