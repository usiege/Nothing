//
//  TestViewController.swift
//  Nothing
//
//  Created by user on 2018/7/4.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

class DebugViewController: UIViewController {

    fileprivate lazy var tableView: UITableView = {
        let frame = CGRect(x: 0, y: 64, width: 1024, height: 768-64)
        let table = UITableView.init(frame: frame, style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "tablecell")
        
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    var data: [String] = [String]()
    func tableTest() {
        data = [String]()
        data.append("COCOS")
        data.append("")
        self.view.addSubview(tableView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Debug"
        self.barButtonItem()
        self.tableTest()
        
    }
    
    func barButtonItem() {
        let barbutton = UIBarButtonItem.init(title: "close", style: UIBarButtonItemStyle.done, target: self, action: #selector(closeAction))
        
        self.navigationItem.setLeftBarButton(barbutton, animated: true)
    }
    
    @objc
    func closeAction() {
        DebugView.shareInstance.isHidden = false
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DebugViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            break
            return
        default:
            break
        }
        
    }
}

extension DebugViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
}
