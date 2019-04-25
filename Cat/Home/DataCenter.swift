//
//  DataCenter.swift
//  Cat
//
//  Created by xiaoniu on 2019/4/24.
//  Copyright © 2019 com.xiaoniu88. All rights reserved.
//

import UIKit

class DataCenter: NSObject {
    
    var dataReady : Bool = false
    var plainData : NSMutableArray = NSMutableArray()
    var groupData : NSMutableDictionary = NSMutableDictionary()
    
    var catGene : CatGene = CatGene.init()
    
    // 配方
    var recipes : Array<Recipe> = Array<Recipe>()
    
    /// 单例
    static let sharedApp = DataCenter()
    private override init() {
        print("init")
    }
}

// 从本地文件读取数据
extension DataCenter {
    func readFromJson() {
        if let path = Bundle.main.path(forResource: "cat", ofType: "json") {
            do {
                let data = try String(contentsOfFile: path,encoding: .utf8)
                if let d = data.data(using: .utf8) {
                    
                    let dict = try JSONSerialization.jsonObject(with: d, options: .mutableLeaves) as! [String:Any]
                    
                    for i : GenesPostion in GenesPostion.allCases {
                        
                        let array = dict[i.rawValue] as! Array<Any>
                        
                        for j in array {
                            let k = j as! Array<Any>
                            
                            var name = ""
                            
                            if (k.count > 0) {
                                name = k[0] as! String
                            }
                            
                            var ability = ""
                            if (k.count > 1) {
                                ability = k[1] as! String
                            }
                            
                            var access = ""
                            
                            if (k.count > 2) {
                                access = k[2] as! String
                                
                                let recipe = Recipe.init(result: name, childNames: access.components(separatedBy: CharacterSet.init(charactersIn: "+")))
                                
                                self.recipes.append(recipe)
                            }
                            
                            var parent = ""
                            if (k.count > 3) {
                                parent = k[3] as! String
                            }
                            
                            let gene = GeneComponent.init(name: name, postion: i.rawValue, ability: ability, access: access)
                            
                            gene.parent = parent
                            
                            self.catGene.addGene(gene) 
                            self.plainData.add(gene)
                        }
                    }                    
                }
                
                dataReady = true
                
            } catch {
                
            }
        }
        
    }
    
    
    func read() {
        if let path = Bundle.main.path(forResource: "cat", ofType:".md") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                if data.lengthOfBytes(using: .utf8) > 0 {
                    let myStrings = data.components(separatedBy: NSCharacterSet.newlines)
                    
                    for string in myStrings {
                        let array = string.components(separatedBy:NSCharacterSet.init(charactersIn: "|") as CharacterSet)
                        
                        if array.count > 1 {
                            let gene = GeneComponent.init(name: array[1], postion: array[0], ability:  array.count > 2 ? array[2] : "", access: array.count > 3 ? array[3] : "")
                            
                            if gene.name?.lengthOfBytes(using: .utf8) ?? 0 > 0 {
                                self.catGene.addGene(gene) 
                                self.plainData.add(gene)
                            }
                        }
                    }
                    
                    dataReady = true 
                }
            } catch {
                
            }
        }
    }
}
