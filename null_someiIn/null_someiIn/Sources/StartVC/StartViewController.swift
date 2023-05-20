import UIKit

class StartViewController: BaseViewController {
    
    private let frameView = UILabel().then {
        $0.frame = CGRect(x: 0, y: 0, width: 393, height: 616)
        $0.backgroundColor = .lightGrayCustom
    }
    
    private let frameView_2 = UILabel().then {
        $0.frame = CGRect(x: 0, y: 0, width: 313, height: 616)
        $0.backgroundColor = .lightGrayCustom
    }
    
    private let labelView = UILabel().then {
        $0.frame = CGRect(x: 0, y: 0, width: 199, height: 92)
        $0.backgroundColor = .lightGrayCustom
    }
    
    private let someiInLabel = UILabel().then {
        $0.text = "Somei"
        $0.font = UIFont(name: "pretendard-SemiBold", size: 48)
    }
    
    private let someiInImage = UIImageView().then {
        $0.image = UIImage(named: "SomeiInRemovebg")
    }
    
    private let logInButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "pretendard-SemiBold", size: 14)
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .blueCustom
    }
    
    private let signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "pretendard-SemiBold", size: 14)
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .grayCustom
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
    }

    override func addView() {
        view.addSubview(self.frameView)
        view.addSubview(self.frameView_2)
        view.addSubview(self.labelView)
        view.addSubview(someiInLabel)
        view.addSubview(someiInImage)
        view.addSubview(logInButton)
        view.addSubview(signUpButton)
    }
    
    override func addTarget() {
        logInButton.addTarget(self, action: #selector(goToLogIn), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(gotoSignUp), for: .touchUpInside)
    }

    override func setLayout() {
        self.frameView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(0)
            $0.top.equalTo(view).offset(0)
            $0.bottom.equalTo(view).inset(236)
        }
        
        self.frameView_2.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(40)
            $0.right.equalTo(view).offset(40)
            $0.bottom.equalTo(view).inset(236)
        }
        
        self.labelView.snp.makeConstraints {
            $0.centerX.equalTo(frameView)
            $0.centerY.equalTo(frameView)
//            $0.height.equalTo(92)
//            $0.bottom.equalTo(view).inset(262)
            $0.left.equalTo(view).offset(97)
//            $0.right.equalTo(view).offset(97)
        }
        
        self.someiInLabel.snp.makeConstraints {
//            $0.centerX.equalTo(labelView)
            $0.centerY.equalTo(labelView)
            $0.width.equalTo(139)
            $0.height.equalTo(92)
//            $0.left.equalTo(frameView_2).offset(57)
//            $0.top.equalTo(view).offset(0)
        }
        
        self.someiInImage.snp.makeConstraints {
            $0.centerY.equalTo(labelView)
            $0.left.equalTo(someiInLabel.snp.right).offset(20)
            $0.height.equalTo(40)
            $0.width.equalTo(40)
        }
        
        self.logInButton.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(frameView.snp.bottom).offset(60)
        }
        
        self.signUpButton.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(20)
            $0.bottom.equalTo(view).offset(-60)
        }
    }
    
//    override func addTarget() {
//        <#code#>
//    }
    
    @objc private func goToLogIn() {
        let controller = LogInViewController()
        navigationController?.pushViewController(controller, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func gotoSignUp() {
        let controller = SignUpViewController()
        navigationController?.pushViewController(controller, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}
