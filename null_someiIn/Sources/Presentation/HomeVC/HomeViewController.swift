import UIKit

class HomeViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let labelView = UIView().then {
        $0.backgroundColor = .lightGrayCustom
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
        $0.image = UIImage(systemName: "bell.fill")
        $0.tintColor = .gray
    }
    
    private let settingImage = UIImageView().then {
        $0.adjustsImageSizeForAccessibilityContentSizeCategory = true
        $0.image = UIImage(systemName: "gearshape.fill")
        $0.tintColor = .gray
    }
    
    private let profileView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let profileImg = UIImageView().then {
        $0.image = UIImage(named: "duck")
        $0.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        $0.layer.cornerRadius = $0.frame.width / 2  // 프레임을 원으로 만들기
        $0.clipsToBounds = true
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "김소마"
        $0.textColor = .black
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }

    private let levelLabel = UILabel().then {
        
        $0.text = "A+"
        $0.textColor = .blueCustom
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.backgroundColor = .lightGrayCustom
        $0.textAlignment = .center
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true  // 요소가 빠져나가지 않게 하는 요소
//        $0.frame = CGRect(x: 0, y: 0, width: 42, height: 21)
    }
    
    private let progressView = UIProgressView().then {
        // progress 배경 색상
        $0.trackTintColor = .grayCustom
        // progress 진행 색상
        $0.progressTintColor = .blueCustom
        // progress 진행 정도
        $0.progress = 0.3
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.layer.sublayers![1].cornerRadius = 8 // progress 배경
    }
    
    private let seStatusLabel = UILabel().then { $0.statusTitleLabel(title: "Stars Earned")}
    private let seStatusVLabel = UILabel().then { $0.statusValueLabel(value: "0")}
    
    private let prStatusLabel = UILabel().then { $0.statusTitleLabel(title: "PRs")}
    private let prStatusVLabel = UILabel().then { $0.statusValueLabel(value: "2")}
    
    private let issueStatusLabel = UILabel().then { $0.statusTitleLabel(title: "Issues")}
    private let issueStatusVLabel = UILabel().then { $0.statusValueLabel(value: "0")}
    
    private let commitStatusLabel = UILabel().then { $0.statusTitleLabel(title: "Commits")}
    private let commitStatusVLabel = UILabel().then { $0.statusValueLabel(value: "204")}
    
    private let cbStatusLabel = UILabel().then { $0.statusTitleLabel(title: "Contributed to")}
    private let cbStatusVLabel = UILabel().then { $0.statusValueLabel(value: "8")}
    
    private let listView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let listTitle = UILabel().then {
        $0.text = "인기 게시글"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }
    
    private let listSubTitle = UILabel().then {
        $0.text = "1주 동안의 인기글"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.textColor = .grayCustom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGrayCustom
        configure()
        
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        view.addSubview(tableView)
    }
    
    private func configure() {
//        tableView.dataSource = self
//        tableView.rowHeight = 100
    }
    
    override func addView() {
        [labelView, self.alramImage, self.settingImage, self.profileView, self.listView].forEach {
            view.addSubview($0)
        }
        
        [someiLabel, someiImage].forEach {
            labelView.addSubview($0)
        }
        
        [profileImg, nameLabel, levelLabel, self.progressView, seStatusLabel, seStatusVLabel, prStatusLabel, prStatusVLabel, issueStatusLabel, issueStatusVLabel, commitStatusLabel, commitStatusVLabel, cbStatusLabel, cbStatusVLabel].forEach {
            profileView.addSubview($0)
        }
        
        [listTitle, listSubTitle].forEach {
            listView.addSubview($0)
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
            $0.width.height.equalTo(24)
            $0.right.equalTo(view).inset(68)
            $0.top.equalTo(view).offset(56)
        }
        
        settingImage.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.right.equalTo(view).inset(20)
            $0.top.equalTo(view).offset(56)
        }
        
        profileView.snp.makeConstraints {
            $0.top.equalTo(someiLabel.snp.bottom).offset(20)
            $0.left.equalTo(view).offset(0)
            $0.right.equalTo(view).offset(0)
            $0.height.equalTo(240)
        }
        
        profileImg.snp.makeConstraints {
            $0.height.width.equalTo(48)
            $0.top.equalTo(profileView).offset(32)
            $0.left.equalTo(profileView).offset(20)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileView).offset(36)
            $0.leading.equalTo(profileView).offset(78)
        }
        
        levelLabel.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.top).offset(36)
            $0.left.equalTo(profileImg.snp.right).offset(60)
        }
        
        progressView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.left.equalTo(profileImg.snp.right).offset(10)
            $0.right.equalTo(profileView.snp.right).inset(20)
            $0.height.equalTo(8)
        }
        
        seStatusLabel.snp.makeConstraints {
            $0.top.equalTo(profileView).offset(116)
            $0.left.equalTo(profileView).offset(40)
        }
        
        seStatusVLabel.snp.makeConstraints {
            $0.top.equalTo(profileView).offset(116)
            $0.right.equalTo(commitStatusLabel.snp.left).offset(-48)
        }
        
        prStatusLabel.snp.makeConstraints {
            $0.top.equalTo(profileView).offset(148)
            $0.left.equalTo(profileView).offset(40)
        }
        
        prStatusVLabel.snp.makeConstraints {
            $0.top.equalTo(profileView).offset(148)
            $0.right.equalTo(cbStatusLabel.snp.left).offset(-48)
        }
        
        issueStatusLabel.snp.makeConstraints {
            $0.top.equalTo(profileView).offset(180)
            $0.left.equalTo(profileView).offset(40)
        }
        
        issueStatusVLabel.snp.makeConstraints {
            $0.top.equalTo(profileView).offset(180)
            $0.right.equalTo(profileView).inset(220)
        }
        
        commitStatusLabel.snp.makeConstraints {
            $0.top.equalTo(profileView).offset(116)
            $0.left.equalTo(profileView).offset(220)
        }
        
        commitStatusVLabel.snp.makeConstraints {
            $0.top.equalTo(profileView).offset(116)
            $0.right.equalTo(profileView).inset(40)
        }
        
        cbStatusLabel.snp.makeConstraints {
            $0.top.equalTo(profileView).offset(148)
            $0.left.equalTo(profileView).offset(220)
        }
        
        cbStatusVLabel.snp.makeConstraints {
            $0.top.equalTo(profileView).offset(148)
            $0.right.equalTo(profileView).inset(40)
        }
        
        listView.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(12)
            $0.left.equalTo(view).offset(0)
            $0.right.equalTo(view).offset(0)
            $0.height.equalTo(417)
        }
        
        
    }
    
    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in your table view
        return 10
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
        // Configure the cell
        cell.textLabel?.text = "Row \(indexPath.row + 1)"
        
        return cell
    }
}
