enum CustomerServiceType: Int {
    case active = 0, mostSearched
}

enum CustomerServiceChatError {
    case noInternet
    case loadingError(String)
    case initialisationError
}
