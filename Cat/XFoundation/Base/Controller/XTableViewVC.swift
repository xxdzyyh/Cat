//
//  XTableViewVC.swift
//  XFoundation
//
//  Created by xiaoniu on 2018/10/26.
//  Copyright © 2018年 com.learn. All rights reserved.
//

import UIKit
import Cartography

open class XTableViewVC: XRequestVC,UITableViewDelegate,UITableViewDataSource {
    
    private var _dataSource : Array<AnyObject> = Array() 
    
    var dataSource : Array<AnyObject> {
        set {
            _dataSource = newValue 
            self.tableView.reloadData()
        }
        
        get {
            return _dataSource
        }
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.tableView)

        constrain(self.tableView) { (tableView) in
            tableView.edges == tableView.superview!.edges
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //MARK: - subclass need override
    func cellClass() -> AnyClass? {
        return XTableViewCell.self
    }
    
    //MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.cellClass() != nil {
            let className: String = NSStringFromClass(self.cellClass()!)
            
            if let classType = NSClassFromString(className) as? XTableViewCell.Type {
                let cell : XTableViewCell = classType.cellForTableView(tableView) as! XTableViewCell
                
                cell.configWithData(self.dataSource[indexPath.row])
                
                return cell
            }
        }
                        
        return XTableViewCell.cellForTableView(tableView)
    }
    
    //MARK: - setup
    
    var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        
        tableView.showsVerticalScrollIndicator = false;
        tableView.showsHorizontalScrollIndicator = false;
        tableView.tableFooterView = UIView.init();
        tableView.isDirectionalLockEnabled = true;
        
        return tableView
    }()

}
