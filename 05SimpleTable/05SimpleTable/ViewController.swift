//
//  ViewController.swift
//  05SimpleTable
//
//  Created by Xuân Quỳnh Lê on 2021/09/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var sampleTableView: UITableView!
    private var dataSource: [Setting] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Can 2 thanh phan
        // 1. Data source
        // 2. Delegate: -> bam vao cell
        // Cach su dung tableview cell
        // 1. tao cell
        // 2. dang ky cell cho tableview
        // 3. dinh nghia o datasource
        self.sampleTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        self.sampleTableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
        self.sampleTableView.dataSource = self
        self.sampleTableView.delegate = self
        bindModel()
    }
    
    private func bindModel() {
        let setting1 = Setting(systemName: "folder", title: "General")
        let setting2 = Setting(systemName: "cross.case", title: "Accessibility")
        let setting3 = Setting(systemName: "smoke.fill", title: "Privacy")
        dataSource.append(setting1)
        dataSource.append(setting2)
        dataSource.append(setting3)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 2 {
            return 1
        } else if section == 1 {
            return dataSource.count
        } else if section == 3 {
            return 8
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as! SettingTableViewCell
            cell.bindData(systemName: dataSource[indexPath.row].systemName, title: dataSource[indexPath.row].title)
            return cell
        } else {
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Setting"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}

