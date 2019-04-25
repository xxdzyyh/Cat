//
//  GeneDetailCell.swift
//  Cat
//
//  Created by xiaoniu on 2019/4/24.
//  Copyright © 2019 com.xiaoniu88. All rights reserved.
//

import UIKit

class GeneDetailCell: XTableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configWithData(_ data: Any) {
        super.configWithData(data)
        
        let gene = data as! GeneComponent
        
        self.mainLabel.text = "\(gene.name ?? "")"
        self.middleLabel.text = "\(gene.ability ?? "")   \(gene.access ?? "")"
    }
}
