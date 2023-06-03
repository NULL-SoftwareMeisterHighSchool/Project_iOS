import UIKit

extension UIColor {
    static let lightGrayCustom = UIColor (
        red: 0.937,
        green: 0.957,
        blue: 0.957,
        alpha: 1
    )
    static let blueCustom = UIColor(
        red: 0,
        green: 0.518,
        blue: 0.859,
        alpha: 1
    )
    static let grayCustom = UIColor(
        red: 0.882,
        green: 0.91,
        blue: 0.918,
        alpha: 1
    )
}

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}

// 키보드 숨기기
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
