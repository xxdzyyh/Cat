//
//  GeneMapVC.swift
//  Cat
//
//  Created by xiaoniu on 2019/4/25.
//  Copyright © 2019 com.xiaoniu88. All rights reserved.
//

import UIKit
import RxSwift

class GeneMapVC: XTableViewVC {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "基因大全"
        
        Observable.of(DataCenter.sharedApp.dataReady).subscribe(onNext: { (ready) in
            print(ready) 
            if ready {
                
                self.dataSource = DataCenter.sharedApp.catGene.postionNames as Array<AnyObject>
            }
        }).disposed(by: disposeBag);
        
    }
    
    override func cellClass() -> AnyClass? {
        return HomeCell.self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PostionDetailVC()
        
        let postionName = self.dataSource[indexPath.row]
        let postion = GenesPostion.init(rawValue: postionName as! String)
        
        vc.title = postionName as? String
        vc.dataSource = DataCenter.sharedApp.catGene.genesForPostion(postion!)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
