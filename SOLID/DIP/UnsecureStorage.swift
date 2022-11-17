import Foundation

private protocol UnsecureStorage {
    
    func value<T>(forKey key: String) -> T?
    func save<T>(value: T, forKey key: String)
    
}

extension UserDefaults: UnsecureStorage {
    func value<T>(forKey key: String) -> T? {
        switch T.self {
        case is String.Type:
            return string(forKey: key) as? T
        case is Int.Type:
            return integer(forKey: key) as? T
        default:
            fatalError("")
        }
    }
    
    func save<T>(value: T, forKey key: String) {
        self.set(value, forKey: key)
    }
    
}
