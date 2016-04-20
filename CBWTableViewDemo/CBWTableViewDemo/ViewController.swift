//
//  ViewController.swift
//  CBWTableViewDemo
//
//  Created by 陈博文 on 16/4/21.
//  Copyright © 2016年 陈博文. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableview = UITableView()
    var dataArray:[String] = ["1","2","3","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.frame = self.view.bounds;
        self.tableview.rowHeight = 100
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.view.addSubview(tableview)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "第几行\(dataArray[indexPath.row])"
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("选中第\(dataArray[indexPath.row])")
        
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // 如果是删除操作
        if editingStyle == .Delete {
            // 从数组中移除对应位置的数据
            dataArray.removeAtIndex(indexPath.row)
            // 删除表格中对应行的数据
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
}


