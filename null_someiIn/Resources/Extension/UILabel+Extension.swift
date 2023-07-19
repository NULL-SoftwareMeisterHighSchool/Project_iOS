import UIKit

extension UILabel {
    func statusTitleLabel(title: String) {
        
        let attributedString = NSMutableAttributedString()
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Pretendard-SemiBold", size: 14),
            .foregroundColor: UIColor.gray
        ]
                
        let titleString = NSAttributedString(string: title, attributes: titleAttributes)
                
        attributedString.append(titleString)
                
        self.attributedText = attributedString
    }
    
    func statusValueLabel(value: String) {
        let attributedString = NSMutableAttributedString()
        let valueAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Pretendard-Regular", size: 14),
            .foregroundColor: UIColor.gray
        ]
        
        let valueString = NSAttributedString(string: value, attributes: valueAttributes)
        
        attributedString.append(valueString)
        
        self.attributedText = attributedString
    }
}
