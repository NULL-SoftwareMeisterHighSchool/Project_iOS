import UIKit

class TabBarViewController: UITabBarController {
    
    private let mainVC = MainViewController().then{
        $0.title = ""
        $0.tabBarItem.image = UIImage(systemName: "square.grid.2x2.fill")
        $0.navigationItem.largeTitleDisplayMode = .always
    }
        
    private let listVC = ListViewController().then{
        $0.title = ""
        $0.tabBarItem.image = UIImage(systemName: "clipboard.fill")
        $0.navigationItem.largeTitleDisplayMode = .always
    }
        
    private let rankVC = RankViewController().then{
        $0.title = ""
        $0.tabBarItem.image = UIImage(systemName: "trophy.fill")
        $0.navigationItem.largeTitleDisplayMode = .always
    }
    
    private let userVC = UserViewController().then {
        $0.title = ""
        $0.tabBarItem.image = UIImage(systemName: "person.fill")
        $0.navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationMain = UINavigationController(rootViewController: mainVC)
        let navigationList = UINavigationController(rootViewController: listVC)
        let navigationRank = UINavigationController(rootViewController: rankVC)
        let navigationUser = UINavigationController(rootViewController: userVC)
        
        view.backgroundColor = .white
        
        setViewControllers([navigationMain, navigationList, navigationRank, navigationUser], animated: false)
    }
}
