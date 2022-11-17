import UIKit

enum FirstTextStyle {
    case title
    case subtitle
    
    var color: UIColor {
        switch self {
        case .title: return .black
        case .subtitle: return .gray
        }
    }
    
    var fontSize: Double {
        switch self {
        case .title: return 20
        case .subtitle: return 15
        }
    }
    
}

extension String {
    
    func attributed(_ style: FirstTextStyle) -> AttributedString {
        var attributedString = AttributedString(self)
        attributedString.font = .systemFont(ofSize: style.fontSize)
        attributedString.foregroundColor = style.color
        return attributedString
    }
    
}
