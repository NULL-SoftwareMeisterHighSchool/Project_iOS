import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Do any additional setup after loading the view.
        let mainVC = MainViewController()
        let listVC = ListViewController()
        let rankVC = RankViewController()
        let userVC = MyPageViewController()
        
        //각 tab bar의 viewcontroller 타이틀 설정
        mainVC.title = ""
        listVC.title = ""
        rankVC.title = ""
        userVC.title = ""
            
        mainVC.tabBarItem.image = UIImage.init(systemName: "square.grid.2x2.fill")
        listVC.tabBarItem.image = UIImage.init(systemName: "clipboard.fill")
        rankVC.tabBarItem.image = UIImage.init(systemName: "trophy.fill")
        userVC.tabBarItem.image = UIImage.init(systemName: "person.fill")
        //self.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
                    
        // 위에 타이틀 text를 항상 크게 보이게 설정
        mainVC.navigationItem.largeTitleDisplayMode = .always
        listVC.navigationItem.largeTitleDisplayMode = .always
        rankVC.navigationItem.largeTitleDisplayMode = .always
        userVC.navigationItem.largeTitleDisplayMode = .always
            
        // navigationController의 root view 설정
        let navMain = UINavigationController(rootViewController: mainVC)
        let navList = UINavigationController(rootViewController: listVC)
        let navRank = UINavigationController(rootViewController: rankVC)
        let navUser = UINavigationController(rootViewController: userVC)
                
        navMain.navigationBar.prefersLargeTitles = true
        navList.navigationBar.prefersLargeTitles = true
        navRank.navigationBar.prefersLargeTitles = true
        navUser.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navMain, navList, navRank, navUser], animated: false)
    }
}
