import CoreData
import UIKit
import Foundation

final class UsersStorage {
    private let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func users() -> [User] {
        let request = DBUser.fetchRequest()
        let objects = storage.fetch(request)
        return objects.compactMap(Self.user(fromCDObject:))
    }
    
    func save(_ users: [User]) {
        for user in users {
            let dbUser = storage.make(DBUser.self)
            dbUser.name = user.name
            dbUser.uuid = user.uuid
        }
        storage.save()
    }
    
    private static func user(fromCDObject object: DBUser) -> User? {
        guard
            let name = object.name,
            let uuid = object.uuid
        else { return nil }
        
        return User(name: name, uuid: uuid)
    }
    
}
