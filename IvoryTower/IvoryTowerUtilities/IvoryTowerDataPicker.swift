//
//  IvoryTowerDataPicker.swift
//  IvoryTower
//
//  Created by Can Lyu on 2018/4/1.
//  Copyright © 2018年 Can Lyu. All rights reserved.
//

import UIKit

class IvoryTowerDataPicker : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView : UITableView = UITableView()

    var sectionTitles : [String] = []
    var data : [String : [String]] = [:]
    
    var item : Int?
    var selection : String?
    weak var delegate : UIViewControllerWithSelection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        initTableView()
        view.addSubview(tableView)
    }
    
    func initTableView() {
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DataCell")
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sectionData = data[sectionTitles[section]] {
            return sectionData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return data[sectionTitles[section]] != nil ? 25.0 : 0.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)
        cell.textLabel?.text = data[sectionTitles[indexPath.section]]?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
        selection = data[sectionTitles[indexPath.section]]?[indexPath.row]
        guard selection != nil && item != nil  && delegate != nil else {
            return
        }
        delegate!.handleSelection(selection: selection!, forItem: item!)
    }
    
}
