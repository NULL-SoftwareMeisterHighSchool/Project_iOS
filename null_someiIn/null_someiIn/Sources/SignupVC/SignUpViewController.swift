import UIKit

class SignUpViewController: BaseViewController, UITextFieldDelegate {
    
    private let signUpLabel = UILabel().then {
        $0.text = "Sign Up"
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
    }
    
    private let signUpTitleLabel = UILabel().then {
        $0.text = "회원가입"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 40)
    }
    
    private let shcoolLabel = UILabel().then {
        $0.text = "학교"
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
    }
    
    private let shcoolTextFiled = UITextField().then {
        $0.placeholder = "재학중이거나 졸업한 학교를 입력해 주세요"
        $0.addLeftPadding()
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.backgroundColor = .lightGrayCustom
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    private let emailLabel = UILabel().then {
        $0.text = "학교 이메일"
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
    }
    
    private let emailTextFiled = UITextField().then {
        $0.isSecureTextEntry = true
        $0.placeholder = "학교 전용 이메일을 입력해주세요"
        $0.addLeftPadding()
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.backgroundColor = .lightGrayCustom
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    private let amLabel = UILabel().then {
        $0.text = "입학연도"
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
    }
    
    private let amTextFiled = UITextField().then {
        $0.isSecureTextEntry = true
        $0.placeholder = "학교에 입학한 년도를 입력해 주세요"
        $0.addLeftPadding()
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.backgroundColor = .lightGrayCustom
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    private let checkLabel = UILabel().then {
        $0.text = "회원이신가요?"
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    private let goToLogInLabel = UILabel().then {
        $0.text = "로그인"
        $0.textColor = .blueCustom
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.isUserInteractionEnabled = true
    }
    
    // 로그인 조건
    private let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
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
        view.addSubview(signUpLabel)
        view.addSubview(signUpTitleLabel)
        view.addSubview(shcoolLabel)
        view.addSubview(shcoolTextFiled)
        view.addSubview(emailLabel)
        view.addSubview(emailTextFiled)
        view.addSubview(amLabel)
        view.addSubview(amTextFiled)
        view.addSubview(checkLabel)
        view.addSubview(goToLogInLabel)
        view.addSubview(nextButton)
    }
    
    override func setLayout() {
        signUpLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(100)
        }
        
        signUpTitleLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(134)
        }

        shcoolLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(226)
        }
        
        shcoolTextFiled.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(260)
        }
        
        emailLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(328)
        }
        
        emailTextFiled.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(362)
        }
        
        amLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(430)
        }
        
        amTextFiled.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(20)
            $0.top.equalTo(view).offset(464)
        }
        
        checkLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(20)
            $0.bottom.equalTo(view).inset(118)
        }
        
        goToLogInLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.left.equalTo(view).offset(110)
            $0.bottom.equalTo(view).inset(118)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.height.equalTo(48)
            $0.left.equalTo(view).offset(20)
            $0.bottom.equalTo(view).inset(60)
        }
    }
    
    override func addTarget() {
        nextButton.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // UITapGestureRecognizer 생성
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToLogIn))
        goToLogInLabel.addGestureRecognizer(tapGesture) // UITapGestureRecognizer 추가
    }
    
    @objc private func goToLogIn() {
        let controller = LogInViewController()
        navigationController?.pushViewController(controller, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func goToMain() {
        let controller = MainViewController()
        navigationController?.pushViewController(controller, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}
