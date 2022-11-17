import Foundation
import CoreData

protocol Storage {
    func fetch<T>(_ request: NSFetchRequest<T>) -> [T]
    func make<T: NSManagedObject>(_ type: T.Type) -> T
    func save()
}
