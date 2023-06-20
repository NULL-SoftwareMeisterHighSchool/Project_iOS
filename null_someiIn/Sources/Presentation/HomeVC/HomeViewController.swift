import UIKit

class HomeViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        $0.image = UIImage(systemName: "bell.fill")
        $0.tintColor = .gray
    }
    
    private let settingImage = UIImageView().then {
        $0.adjustsImageSizeForAccessibilityContentSizeCategory = true
        $0.image = UIImage(systemName: "gearshape.fill")
        $0.tintColor = .gray
    }
    
    private let githubstatsView1 = UIView().then {
        $0.backgroundColor = .lightGrayCustom
        $0.layer.cornerRadius = 16
    }
    
    private let profileImage = UIImageView().then {
        $0.image = UIImage(systemName: "circle.fill")
        $0.tintColor = .darkGrayCustom
    }
    
    private let gitstatsLabel = UILabel().then {
        $0.text = "Github Stats"
        $0.textColor = .darkGrayCustom
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
    }

    private let userNameLabel = UILabel().then {
        $0.text = "Test User's"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }
    
    private let statsProgressView = UIProgressView().then {
        $0.progressTintColor = .blueCustom
        $0.trackTintColor = .white
        $0.progress = 0.3
    }

    private let githubstatsView2 = UIView().then {
        $0.backgroundColor = .lightGrayCustom
        $0.layer.cornerRadius = 16
    }
    
    private let starsLabel = UILabel().then {
        $0.text = "Stars Earned"
        $0.textColor = .darkGrayCustom
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
    }
    
    private let starsNumLabel = UILabel().then {
        $0.text = "0"
        $0.textColor = .darkGrayCustom
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    private let prsLabel = UILabel().then {
        $0.text = "PRs"
        $0.textColor = .darkGrayCustom
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
    }
    
    private let prsNumLabel = UILabel().then {
        $0.text = "2"
        $0.textColor = .darkGrayCustom
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    private let issuesLabel = UILabel().then {
        $0.text = "Issues"
        $0.textColor = .darkGrayCustom
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
    }
    
    private let issuessNumLabel = UILabel().then {
        $0.text = "0"
        $0.textColor = .darkGrayCustom
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    private let commitsLabel = UILabel().then {
        $0.text = "Commits"
        $0.textColor = .darkGrayCustom
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
    }
    
    private let commitsNumLabel = UILabel().then {
        $0.text = "204"
        $0.textColor = .darkGrayCustom
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    private let contriLabel = UILabel().then {
        $0.text = "Contributed to"
        $0.textColor = .darkGrayCustom
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
    }
    
    private let contriNumLabel = UILabel().then {
        $0.text = "8"
        $0.textColor = .darkGrayCustom
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    private let postView = UIView().then {
        $0.backgroundColor = .lightGrayCustom
        $0.layer.cornerRadius = 16
    }
    
    private let postLabel = UILabel().then {
        $0.text = "인기 게시글"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView().then {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        return tableView
    }()
    
    private let chevronImage = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.forward")
        $0.tintColor = .darkGrayCustom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
                
        // Apply constraints using SnapKit
        tableView.snp.makeConstraints { make in
            make.top.equalTo(githubstatsView2.snp.bottom).offset(12)
            make.left.right.equalTo(view).offset(20)
        }
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
    
    override func addView() {
        [labelView, self.alramImage, self.settingImage, githubstatsView1, githubstatsView2, postView].forEach {
            view.addSubview($0)
        }
        
        [someiLabel, someiImage].forEach {
            labelView.addSubview($0)
        }
        
        [profileImage, gitstatsLabel, userNameLabel, statsProgressView].forEach {
            githubstatsView1.addSubview($0)
        }
        
        [starsLabel, starsNumLabel, prsLabel, prsNumLabel, issuesLabel, issuessNumLabel, commitsLabel, commitsNumLabel, contriLabel, contriNumLabel].forEach {
            githubstatsView2.addSubview($0)
        }
        
        [postLabel, chevronImage].forEach {
            postView.addSubview($0)
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
        
        githubstatsView1.snp.makeConstraints {
            $0.height.equalTo(88)
            $0.left.equalTo(view).offset(20)
            $0.right.equalTo(view).inset(20)
            $0.top.equalTo(labelView).offset(40)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(githubstatsView1).offset(20)
            $0.bottom.equalTo(githubstatsView1).inset(20)
            $0.left.equalTo(githubstatsView1).offset(20)
            $0.width.equalTo(48)
            $0.height.equalTo(48)
        }
        
        gitstatsLabel.snp.makeConstraints {
            $0.top.equalTo(githubstatsView1).offset(20)
            $0.left.equalTo(profileImage.snp.right).offset(10)
            
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(githubstatsView1).offset(36)
            $0.left.equalTo(profileImage.snp.right).offset(10)
        }
        
        statsProgressView.snp.makeConstraints {
            $0.bottom.equalTo(githubstatsView1).inset(20)
            $0.left.equalTo(profileImage.snp.right).offset(10)
            $0.right.equalTo(githubstatsView2).inset(20)
            $0.height.equalTo(8)
        }
        
        githubstatsView2.snp.makeConstraints {
            $0.height.equalTo(124)
            $0.left.equalTo(view).offset(20)
            $0.right.equalTo(view).inset(20)
            $0.top.equalTo(githubstatsView1.snp.bottom).offset(12)
        }
        
        starsLabel.snp.makeConstraints {
            $0.top.equalTo(githubstatsView2).offset(20)
            $0.left.equalTo(githubstatsView2).offset(20)
        }
        
        starsNumLabel.snp.makeConstraints {
            $0.top.equalTo(githubstatsView2).offset(20)
            $0.right.equalTo(githubstatsView2).inset(200)
        }
        
        prsLabel.snp.makeConstraints {
            $0.centerY.equalTo(githubstatsView2)
            $0.left.equalTo(githubstatsView2).offset(20)
        }
        
        prsNumLabel.snp.makeConstraints {
            $0.centerY.equalTo(githubstatsView2)
            $0.right.equalTo(githubstatsView2).inset(200)
        }
        
        issuesLabel.snp.makeConstraints {
            $0.bottom.equalTo(githubstatsView2).inset(20)
            $0.left.equalTo(githubstatsView2).offset(20)
        }
        
        issuessNumLabel.snp.makeConstraints {
            $0.bottom.equalTo(githubstatsView2).inset(20)
            $0.right.equalTo(githubstatsView2).inset(200)
        }
        
        commitsLabel.snp.makeConstraints {
            $0.top.equalTo(githubstatsView2).offset(20)
            $0.left.equalTo(githubstatsView2).offset(200)
        }
        
        commitsNumLabel.snp.makeConstraints {
            $0.top.equalTo(githubstatsView2).offset(20)
            $0.right.equalTo(githubstatsView2).inset(20)
        }
        
        contriLabel.snp.makeConstraints {
            $0.centerY.equalTo(githubstatsView2)
            $0.left.equalTo(githubstatsView2).offset(200)
        }
        
        contriNumLabel.snp.makeConstraints {
            $0.centerY.equalTo(githubstatsView2)
            $0.right.equalTo(githubstatsView2).inset(20)
        }
        
        postView.snp.makeConstraints {
            $0.height.equalTo(419)
            $0.left.equalTo(view).offset(20)
            $0.right.equalTo(view).inset(20)
            $0.top.equalTo(githubstatsView2.snp.bottom).offset(12)
        }
        
        postLabel.snp.makeConstraints {
            $0.top.equalTo(postView).offset(20)
            $0.left.equalTo(postView).offset(20)
        }
        
        chevronImage.snp.makeConstraints {
            $0.top.equalTo(postView).offset(26)
            $0.right.equalTo(postView.snp.right).inset(20)
        }
    }
    
    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in your table view
        return 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
        // Configure the cell
        
        return cell
    }
}
