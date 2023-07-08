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
        $0.image = UIImage(systemName: "person.circle.fill")
//        $0.foregroundColor = UIColor(bl)
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "김소마"
        
    }
    
    private let listView = UIView().then {
        $0.backgroundColor = .white
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
        
        [profileImg].forEach {
            profileView.addSubview($0)
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
