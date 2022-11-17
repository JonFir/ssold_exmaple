import UIKit

struct SecondTextStyle {
    let color: UIColor
    let fontSize: Double
}

extension SecondTextStyle {
    static let title = SecondTextStyle(
        color: .black,
        fontSize: 20
    )
    static let subtitle = SecondTextStyle(
        color: .gray,
        fontSize: 15
    )
}

extension String {
    
    func attributed(_ style: SecondTextStyle) -> AttributedString {
        var attributedString = AttributedString(self)
        attributedString.font = .systemFont(ofSize: style.fontSize)
        attributedString.foregroundColor = style.color
        return attributedString
    }
    
}
