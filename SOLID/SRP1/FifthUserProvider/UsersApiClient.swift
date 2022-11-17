import CoreData
import UIKit
import Foundation

final class UsersApiClient {
    private let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func users() async -> [User] {
        let data = await apiClient.request(path: "/users")
        let json = try! JSONSerialization.jsonObject(with: data, options: [])
        let jonObjects = json as! [Any]
        
        return jonObjects.compactMap(Self.user(fromJson:))
    }
    
    
    private static func user(fromJson json: Any) -> User? {
        guard
            let json = json as? [String: Any],
            let name = json["name"] as? String,
            let uuid = json["uuid"] as? String
        else { return nil }
        return User(name: name, uuid: uuid)
    }
}
