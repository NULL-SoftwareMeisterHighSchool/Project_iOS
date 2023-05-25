import UIKit

class LogInViewController: BaseViewController, UITextFieldDelegate {
    
    private let logInLabel = UILabel().then {
        $0.text = "Log In"
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
    }
    
    private let logInTitleLabel = UILabel().then {
        $0.text = "로그인"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 40)
    }
    
    private let idLabel = UILabel().then {
        $0.text = "아이디"
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
    }
    
    private let idTextFiled = UITextField().then {
        $0.placeholder = "아이디를 입력해 주세요"
        $0.addLeftPadding()
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.backgroundColor = .lightGrayCustom
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    private let pwLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
    }
    
    private let pwTextFiled = UITextField().then {
        $0.isSecureTextEntry = true
        $0.placeholder = "비밀번호를 입력해 주세요"
        $0.addLeftPadding()
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.backgroundColor = .lightGrayCustom
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    private let checkLabel = UILabel().then {
        $0.text = "회원이 아니신가요?"
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    private let goToSignUpLabel = UILabel().then {
        $0.text = "회원가입"
        $0.textColor = .blueCustom
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.isUserInteractionEnabled = true
    }
    
    // 로그인 조건
    private let logInButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "pretendard-SemiBold", size: 14)
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .blueCustom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func addView() {
        [logInLabel, logInTitleLabel, idLabel, idTextFiled, pwLabel, pwTextFiled, checkLabel, goToSignUpLabel, logInButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func addTarget() {
        logInButton.addTarget(self, action: #selector(goToLogTabBar), for: .touchUpInside)
    }
    
    override func setLayout() {
        logInLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(100)
        }
        
        logInTitleLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(134)
        }

        idLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(226)
        }
        
        idTextFiled.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(260)
        }
        
        pwLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(328)
        }
        
        pwTextFiled.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(362)
        }
        
        checkLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(20)
            $0.bottom.equalTo(view).inset(118)
        }
        
        goToSignUpLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(138)
            $0.bottom.equalTo(view).inset(118)
        }
        
        logInButton.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(20)
            $0.bottom.equalTo(view).inset(60)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // UITapGestureRecognizer 생성
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToSignUp))
        goToSignUpLabel.addGestureRecognizer(tapGesture) // UITapGestureRecognizer 추가
    }
    
    @objc private func goToLogTabBar() {
        let controller = TabBarViewController()
        navigationController?.pushViewController(controller, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func goToSignUp() {
        let controller = SignUpViewController()
        navigationController?.pushViewController(controller, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}
