import Foundation


func place1Format(phone: String) -> String? {
    guard
        let regex = try? Regex("([\\d]{3})([\\d]{2})([\\d]{2})"), // 1235678
        let result = phone.firstMatch(of: regex),
        result.count > 3
    else { return nil }
    let phoneParths = result[1...3].compactMap { $0.value }.map(String.init(describing:))
    return phoneParths.joined(separator: "-")
}

func place2Format(phone: String) -> String? {
    guard
        let regex = try? Regex("(7)([\\d]{3})([\\d]{3})([\\d]{2})([\\d]{2})"),
        let result = phone.firstMatch(of: regex)
    else { return nil }
    let phoneParths = result[1...5].compactMap { $0.value }.map(String.init(describing:))
    return "+" + phoneParths.joined(separator: "_")
}

func place3Format(phone: String) -> String? {
    guard
        let regex = try? Regex("(.)(\\d)([\\d]{3})([\\d]{3})([\\d]{2})([\\d]{2})"),
        let result = phone.firstMatch(of: regex)
    else { return nil }
    let phoneParths = result[1...5].compactMap { $0.value }.map(String.init(describing:))
    return phoneParths.joined(separator: "-")
}
