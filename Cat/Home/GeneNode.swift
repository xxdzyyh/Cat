//
//  GeneNode.swift
//  Cat
//
//  Created by xiaoniu on 2019/4/24.
//  Copyright © 2019 com.xiaoniu88. All rights reserved.
//

import UIKit

class GeneNode: NSObject {
    
    // 基因位置
    var postion : String?
    // 这个位置拥有的基因
    var genes : NSMutableArray = NSMutableArray()
        
    func addGene(_ gene:GeneComponent!) {
        self.genes.add(gene)
    } 
}
