import Foundation

protocol ApiClient {
    func request(path: String) async -> Data
}
