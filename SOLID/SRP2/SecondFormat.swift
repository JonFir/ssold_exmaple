import Foundation
import RegexBuilder

func secondFormat(phone: String, separator: String) -> String? {
    guard
        let regex = try? Regex("(7)([\\d]{3})([\\d]{3})([\\d]{2})([\\d]{2})"), // 71234567890
        let result = phone.firstMatch(of: regex)
    else { return nil }
    let phoneParths = result[1...5].compactMap { $0.value }.map(String.init(describing:))
    return "+" + phoneParths.joined(separator: separator)
}
