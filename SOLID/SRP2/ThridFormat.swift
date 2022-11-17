import Foundation
import RegexBuilder

func thridFormat(
    phone: String,
    separator: String,
    firstSymbol: String,
    needFirstSeparator: Bool,
    needLastSeparator: Bool,
    needReplaceCodeToSeven: Bool
) -> String? {
    if
        let regex = try? Regex("\\+?([\\d]?)([\\d]{3})([\\d]{3})([\\d]{2})([\\d]{2})"), // +71234567890
        let result = phone.firstMatch(of: regex),
        result.count > 5
    {
        let code = result[1].value.map(String.init(describing:)) ?? ""
        var phone = ""
        if needReplaceCodeToSeven {
            phone = firstSymbol + "7"
            if needFirstSeparator {
                phone += separator
            }
        } else if !code.isEmpty {
            phone = firstSymbol + code
            if needFirstSeparator {
                phone += separator
            }
        }
        phone += result[2].value.map(String.init(describing:)) ?? ""
        phone += separator
        phone += result[3].value.map(String.init(describing:)) ?? ""
        phone += separator
        phone += result[4].value.map(String.init(describing:)) ?? ""
        if needLastSeparator {
            phone += separator
        }
        phone += result[5].value.map(String.init(describing:)) ?? ""
        
        return phone
    } else if
        let regex = try? Regex("([\\d]{3})([\\d]{2})([\\d]{2})"), // 1235678
        let result = phone.firstMatch(of: regex),
        result.count > 3
    {
        var phone = result[1].value.map(String.init(describing:)) ?? ""
        if needFirstSeparator {
            phone += separator
        }
        phone += result[2].value.map(String.init(describing:)) ?? ""
        if needLastSeparator {
            phone += separator
        }
        phone += result[3].value.map(String.init(describing:)) ?? ""
        return phone
    } else {
        return nil
    }
    
}
