import Foundation
import RegexBuilder

func firstFormat(phone: String) -> String? {
    guard
        let regex = try? Regex("(7)([\\d]{3})([\\d]{3})([\\d]{2})([\\d]{2})"),
        let result = phone.firstMatch(of: regex)
    else { return nil }
    let phoneParths = result[1...5].compactMap { $0.value }.map(String.init(describing:))
    // +7-123-456-78-90
    return "+" + phoneParths.joined(separator: "-")
}
