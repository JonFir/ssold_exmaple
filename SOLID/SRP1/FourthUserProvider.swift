import CoreData
import UIKit
import Foundation

class FourthUserProvider {
    private let storage: Storage
    private let apiClient: ApiClient
    
    init(storage: Storage, apiClient: ApiClient) {
        self.storage = storage
        self.apiClient = apiClient
    }
    
    func getUsers() async -> [User] {
        let usersFromDb = usersFromDB()
        if !usersFromDb.isEmpty {
            return usersFromDb
        }
        
        let usersFromApi = await usersFromAPI()
        saveToDB(usersFromApi)
        
        return usersFromApi
    }
    
    private func usersFromDB() -> [User] {
        let request = DBUser.fetchRequest()
        let objects = storage.fetch(request)
        return objects.compactMap(Self.user(fromCDObject:))
    }
    
    private func saveToDB(_ users: [User]) {
        for user in users {
            let dbUser = storage.make(DBUser.self)
            dbUser.name = user.name
            dbUser.uuid = user.uuid
        }
        storage.save()
    }
    
    private func usersFromAPI() async -> [User] {
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
    
    private static func user(fromCDObject object: DBUser) -> User? {
        guard
            let name = object.name,
            let uuid = object.uuid
        else { return nil }
        
        return User(name: name, uuid: uuid)
    }
}
