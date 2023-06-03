import UIKit

class HomeViewController: BaseViewController {
    
    private let labelView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let someiLabel = UILabel().then {
        $0.text = "Somei"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 24)
    }
    
    private let someiImage = UIImageView().then {
        $0.image = UIImage(named: "SomeiInRemovebg")
    }
    
    private let alramImage = UIImageView().then {
        $0.adjustsImageSizeForAccessibilityContentSizeCategory = true
        $0.image = UIImage(named: "bell.fill")
        $0.tintColor = .lightGrayCustom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func addView() {
        [labelView, someiLabel, someiImage, self.alramImage].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        labelView.snp.makeConstraints {
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(69)
        }
        
        someiLabel.snp.makeConstraints {
            $0.left.equalTo(labelView.snp.left).offset(0)
            $0.centerY.equalTo(labelView)
        }
        
        someiImage.snp.makeConstraints {
            $0.centerY.equalTo(labelView)
            $0.left.equalTo(someiLabel.snp.right).offset(10)
            $0.right.equalTo(labelView).inset(0)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        alramImage.snp.makeConstraints {
            $0.width.equalTo(24)
            $0.height.equalTo(24)
            $0.right.equalTo(view).inset(68)
            $0.top.equalTo(view).offset(69)
        }
    }
}
