//
//  GeneComponent.swift
//  Cat
//
//  Created by xiaoniu on 2019/4/19.
//  Copyright © 2019 com.xiaoniu88. All rights reserved.
//

import UIKit

class GeneComponent: NSObject {
    
    // 基因名称
    var name : String?
    // 基因位置
    var postion : String?
    // 基因作用
    var ability : String?
    // 基因如何得到
    var access : String?
    
     init(name : String!, postion:String!, ability:String!,access:String?) {
        super.init()
        
        self.name = name
        self.postion = postion
        self.ability = ability
        self.access = access
    }
}
