//
//  HomeVC.swift
//  Cat
//
//  Created by xiaoniu on 2019/4/19.
//  Copyright © 2019 com.xiaoniu88. All rights reserved.
//

import UIKit
import Cartography
//import 

class HomeVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.tableView)
        
        constrain(self.tableView) { (tableView) in
            tableView.edges == tableView.superview!.edges
        }
        
        read()
        
        
    }
    
    lazy var tableView = UITableView.init(frame: CGRect.zero, style: .plain)
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
    
    func read() {
        if let path = Bundle.main.path(forResource: "cat", ofType:".md") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                
                if data.lengthOfBytes(using: .utf8) > 0 {
                    
                    let myStrings = data.components(separatedBy: NSCharacterSet.newlines)
                    
                    print(myStrings)
                }
            } catch {
                
            }
        }

    }
}

