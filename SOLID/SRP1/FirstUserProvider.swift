import CoreData
import UIKit
import Foundation

class FirstUserProvider {
    func getUsers() async -> [User] {
        var users = [User]()
        let appDelegate = await UIApplication.shared.delegate as! AppDelegate
        let context = await appDelegate.persistentContainer.newBackgroundContext()
        let request = DBUser.fetchRequest()
        let objects = (try? context.fetch(request)) ?? []
        users = objects.compactMap {
            guard let name = $0.name, let uuid = $0.uuid else { return nil }
            return User(name: name, uuid: uuid)
        }
        if !users.isEmpty {
            return users
        }
        
        let url = URL(string: "http://myapi.com/users")!
        let data = try! await URLSession.shared.data(from: url).0
        let json = try! JSONSerialization.jsonObject(with: data, options: [])
        let jonObjects = json as! [Any]
        
        users = jonObjects.compactMap {
            guard
                let json = $0 as? [String: Any],
                let name = json["name"] as? String,
                let uuid = json["uuid"] as? String
            else { return nil }
            return User(name: name, uuid: uuid)
        }
        
        for user in users {
            let dbUser = DBUser(context: context)
            dbUser.name = user.name
            dbUser.uuid = user.uuid
        }
        try! context.save()
        return users
    }
}
