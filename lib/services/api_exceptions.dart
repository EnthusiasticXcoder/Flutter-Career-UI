
abstract class APICallException implements Exception {}

class GenericAPICallException implements APICallException {}

class UnableToRegesterUserAPIException implements APICallException {}

class InvalidCredentialsAPIException implements APICallException {}

class UnableToLoginUserAPIException implements APICallException {}

class UnableToChangeUserAPIException implements APICallException {}

class UnableToDeleteUserAPIException implements APICallException {}
