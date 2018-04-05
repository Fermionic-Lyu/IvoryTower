//
//  MainTabBarController.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/3/28.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTabs()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initTabs() {
        let academicCommunityVC = AcademicCommunityMainVC()
        academicCommunityVC.title = "学术社区"
        let academicCommunityNavVC = UINavigationController.init(rootViewController: academicCommunityVC)
        let messageVC = MessageMainVC()
        messageVC.title = "飞象传书"
        let messageNavVC = UINavigationController.init(rootViewController: messageVC)
        let discoverVC = DiscoverMainVC()
        discoverVC.title = "发现"
        let discoverNavVC = UINavigationController.init(rootViewController: discoverVC)
        let myAcademicVC = MyAcademicMainVC()
        myAcademicVC.title = "我的学术"
        let myAcademicNavVC = UINavigationController.init(rootViewController: myAcademicVC)
        viewControllers = [academicCommunityNavVC, messageNavVC, discoverNavVC, myAcademicNavVC]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
