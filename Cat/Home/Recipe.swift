//
//  Recipe.swift
//  Cat
//
//  Created by xiaoniu on 2019/4/25.
//  Copyright © 2019 com.xiaoniu88. All rights reserved.
//

import UIKit

// 配方
class Recipe: NSObject {

    var result : String!
    var childNames : Array<String>!
    
    init(result:String,childNames:Array<String>) {
        super.init()
        
        self.result = result
        self.childNames = childNames
    }
}
