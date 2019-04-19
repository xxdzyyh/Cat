//
//  ViewController.swift
//  Cat
//
//  Created by xiaoniu on 2019/4/19.
//  Copyright © 2019 com.xiaoniu88. All rights reserved.
//

import UIKit

class ViewController: XTableViewVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        read()
    }
    
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

