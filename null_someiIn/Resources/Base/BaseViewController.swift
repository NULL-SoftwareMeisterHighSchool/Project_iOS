import UIKit
import SnapKit
import Then

class BaseViewController: UIViewController {
    let bounds = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addView()
        setLayout()
        setUp()
        tapGesture()
        addTarget()
        viewWillAppear()
    }
    
    func addView() {}
    func setLayout() {}
    func setUp() {}
    func tapGesture() {}
    func addTarget() {}
    func viewWillAppear() {}
    
}
