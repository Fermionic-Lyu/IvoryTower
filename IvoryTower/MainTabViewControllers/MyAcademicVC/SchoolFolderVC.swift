//
//  SchoolFolderVC.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/4/2.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit

class SchoolFolderVC : UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    let tableView : UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        title = "学校收藏夹"
        initTableView()
        view.addSubview(tableView)
    }
    
    func initTableView() {
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ApplicationCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ApplicationCell", for: indexPath)
        return cell
    }
}
