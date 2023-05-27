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
    
    @objc func loginButtonTapped() {
        // 유효성 검사를 수행합니다.
        if validateFields() {
            // 로그인 성공 시 수행할 작업을 여기에 추가합니다.
            // 예: 서버 요청, 화면 전환 등
            TabBarViewController()
        } else {
            // 유효성 검사에 실패한 경우 알림을 표시하거나 작업을 수행합니다.
            emptyField()
        }
    }
    
    private func emptyField(){
        let completed = UIAlertController(title: "입력되지않은 칸이 있습니다", message: "빈 칸이 없도록 기입해주세요", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    
    func validateFields() -> Bool {
        // 사용자명과 비밀번호 필드의 값을 가져옵니다.
        guard let id = idTextFiled.text, let password = pwTextFiled.text else {
            return false
        }

        // 사용자명과 비밀번호가 비어 있는지 확인합니다.
        if id.isEmpty || password.isEmpty {
            // 필수 필드가 비어 있는 경우에는 실패로 처리합니다.
            return false
        }

        // 추가적인 유효성 검사 규칙을 적용할 수 있습니다.
        // 예: 비밀번호의 최소 길이, 사용자명의 패턴 등
        // 유효성 검사를 통과한 경우에는 성공으로 처리합니다.
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // UITapGestureRecognizer 생성
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToSignUp))
        goToSignUpLabel.addGestureRecognizer(tapGesture) // UITapGestureRecognizer 추가
    }
    
    @objc private func goToLogTabBar() {
        loginButtonTapped()
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
