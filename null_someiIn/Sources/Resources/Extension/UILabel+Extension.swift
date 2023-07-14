import UIKit

extension UILabel {
    func statusLabel(title: String, value: String) {
        
        let attributedString = NSMutableAttributedString()
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Pretendard-SemiBold", size: 14),
            .foregroundColor: UIColor.grayCustom
        ]
        let valueAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Pretendard-Regular", size: 14),
            .foregroundColor: UIColor.grayCustom
        ]
                
        let titleString = NSAttributedString(string: title, attributes: titleAttributes)
        let valueString = NSAttributedString(string: value, attributes: valueAttributes)
                
        attributedString.append(titleString)
        attributedString.append(valueString)
                
        self.attributedText = attributedString
    }
}
