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
        [signUpLabel, signUpTitleLabel, shcoolLabel, shcoolTextFiled, emailLabel, emailTextFiled, amLabel, amTextFiled, checkLabel, goToLogInLabel, nextButton].forEach {
            view.addSubview($0)
        }
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
    
    @objc func siginUpButtonTapped() {
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
        guard let shcool = shcoolTextFiled.text, let email = emailTextFiled.text, let am = amTextFiled.text else {
            return false
        }

        // 사용자명과 비밀번호가 비어 있는지 확인합니다.
        if shcool.isEmpty || email.isEmpty || am.isEmpty {
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToLogIn))
        goToLogInLabel.addGestureRecognizer(tapGesture) // UITapGestureRecognizer 추가
    }
    
    override func addTarget() {
        nextButton.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
    }

    @objc private func goToLogIn() {
        let controller = LogInViewController()
        navigationController?.pushViewController(controller, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func goToMain() {
        siginUpButtonTapped()
        let controller = TabBarViewController()
        navigationController?.pushViewController(controller, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}
