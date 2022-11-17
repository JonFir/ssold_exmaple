private protocol NetworkClient {
    
    func perform(
        method: String,
        parameters: [String: Any],
        completion: (Any) -> Void
    ) -> Responce
    
}

private protocol FileClient {
    
    func file(byPath path: String) -> String
    func save(toPath path: String, data: String)
    
}

private protocol UnsecureStorage {
    
    func value<T>(forKey key: String) -> T?
    func save<T>(value: T, forKey key: String)
    
}




























private protocol Responce {}
