//
//  CatGene.swift
//  Cat
//
//  Created by xiaoniu on 2019/4/24.
//  Copyright © 2019 com.xiaoniu88. All rights reserved.
//

import UIKit

enum GenesPostion : String,CaseIterable {
    case Eye = "眼睛"
    case Mouse = "嘴巴"
    case LeftHand = "左手"
    case RightHand = "右手"
    case Patterns = "花纹"
    case Hat = "帽子"
    case Glass = "眼镜"
    case Abdomen = "肚皮"
    case Bag = "挎包"
    case Satchel = "背包"
    case Clothes = "衣服"
    case Scarf = "围巾"
    case Beard = "胡须"
}

class CatGene: NSObject {
    
    // 眼睛位置的基因
    var eyeGenes :Array<GeneComponent> = Array()   

    // 肚皮
    var abdomenGenes :Array<GeneComponent> = Array()
    
    // 嘴
    var mouthGenes :Array<GeneComponent> = Array()
    
    // 花纹
    var patternGenes :Array<GeneComponent> = Array()
    
    // 左手
    var leftHandGenes :Array<GeneComponent> = Array()
    
    // 右手
    var rightHandGenes :Array<GeneComponent> = Array()
    
    // 帽子
    var hatGenes :Array<GeneComponent> = Array()
    
    // 眼镜
    var glassGenes :Array<GeneComponent> = Array()
    
    // 围巾
    var scarfGenes :Array<GeneComponent> = Array()
    
    // 衣服
    var clothesGenes :Array<GeneComponent> = Array()
    
    // 挎包
    var bagGenes :Array<GeneComponent> = Array()

    // 背包
    var satchelGenes :Array<GeneComponent> = Array()
    
    // 胡须
    var beardGenes :Array<GeneComponent> = Array()
    
    var postionNames : Array<String> = {
        var array = Array<String>()
        for pos in GenesPostion.allCases {
            array.append(pos.rawValue)
        }
        return array
    } ()
    
    required override init() {
        
    }
    
    func addGene(_ gene:GeneComponent!) {
        if let name = gene.postion {
            
            let postion : GenesPostion = GenesPostion.init(rawValue: name) ?? GenesPostion.Eye

            switch postion {
            case .Eye:
                self.eyeGenes.append(gene)
            case .Glass:
                self.glassGenes.append(gene)
            case .Mouse:
                self.mouthGenes.append(gene)
            case .LeftHand:
                self.leftHandGenes.append(gene)
            case .RightHand:
                self.rightHandGenes.append(gene)
            case .Patterns:
                self.patternGenes.append(gene)
            case .Hat:
                self.hatGenes.append(gene)
            case .Abdomen:
                self.abdomenGenes.append(gene)
            case .Bag:
                self.bagGenes.append(gene)
            case .Satchel:
                self.satchelGenes.append(gene)
            case .Clothes:
                self.clothesGenes.append(gene)
            case .Scarf:
                self.scarfGenes.append(gene)
            case .Beard:
                self.beardGenes.append(gene)
            }
        }
    }
    
    func genesForPostion(_ postion:GenesPostion) -> Array<GeneComponent> {
        var array : Array<GeneComponent>
        
        switch postion {
        case .Eye:
            array = self.eyeGenes
        case .Glass:
            array = self.glassGenes
        case .Mouse:
            array = self.mouthGenes
        case .LeftHand:
            array = self.leftHandGenes
        case .RightHand:
            array = self.rightHandGenes
        case .Patterns:
            array = self.patternGenes
        case .Hat:
            array = self.hatGenes
        case .Abdomen:
            array = self.abdomenGenes
        case .Bag:
            array = self.bagGenes
        case .Satchel:
            array = self.satchelGenes
        case .Clothes:
            array = self.clothesGenes
        case .Scarf:
            array = self.scarfGenes
        case .Beard:
            array = self.beardGenes
        }
        
        return array
    }
}
