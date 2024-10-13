const BASEURL_ARTICLE = "https://api.spaceflightnewsapi.net";
const BASEURL_EXOPLANETS = "https://images-api.nasa.gov";

class APIUrls {
  static String getArticles = "/v4/articles/";

  static String getArticleById(int id) {
    return "/v4/articles/$id";
  }

  static String getExoplanets = "/search?q=exoplanet&media_type=image";
}
