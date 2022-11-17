import Foundation

class FifthUserProvider {
    let usersApiClient: UsersApiClient
    let usersStorage: UsersStorage
    
    init(usersApiClient: UsersApiClient, usersStorage: UsersStorage) {
        self.usersApiClient = usersApiClient
        self.usersStorage = usersStorage
    }
    
    func getUsers() async -> [User] {
        let usersFromDb = usersStorage.users()
        if !usersFromDb.isEmpty {
            return usersFromDb
        }
        
        let usersFromApi = await usersApiClient.users()
        usersStorage.save(usersFromApi)
        
        return usersFromApi
    }
}
