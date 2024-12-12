class Api {
  static String base = const String.fromEnvironment('BASE_URL');
  static CompaniesApi companies = CompaniesApi();
}

class CompaniesApi {
  String base = '/companies';
  String locations(String companyId) => '/companies/$companyId/locations';
  String assets(String companyId) => '/companies?$companyId/assets';
}
