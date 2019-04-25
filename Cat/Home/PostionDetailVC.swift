//
//  PostionDetailVC.swift
//  Cat
//
//  Created by xiaoniu on 2019/4/24.
//  Copyright © 2019 com.xiaoniu88. All rights reserved.
//

import UIKit

class PostionDetailVC: XTableViewVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.dataSource)
    }
    
    override func cellClass() -> AnyClass? {
        return GeneDetailCell.self
    }

}
