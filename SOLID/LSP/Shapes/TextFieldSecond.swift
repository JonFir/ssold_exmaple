import UIKit

private class AwesomeView: UIView {
    let textField = AsomeTextField()
    
    func setup() {
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    func set(text: String) {
        textField.text = text
        textChanged()
    }
    
    @objc
    func textChanged() {
        let text = textField.text ?? ""
        
        // Делаем что то очень полезное
    }
    
}

private class AsomeTextField: UITextField {
    
    func setup() {
        // Делаем внешний вид нашего поля ввода не повторимым
    }
    
}
