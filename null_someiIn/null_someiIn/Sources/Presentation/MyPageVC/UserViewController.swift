import UIKit

class UserViewController: BaseViewController {
    
    private let amumal = UILabel().then {
        $0.text = "User입니당 ^3^"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func addView() {
        view.addSubview(amumal)
    }
    
    override func setLayout() {
        amumal.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view)
        }
    }
    
}
