//
//  ViewController.swift
//  VerifyURL
//
//  Created by IOTchenziyang on 03/29/2017.
//  Copyright (c) 2017 IOTchenziyang. All rights reserved.
//

import UIKit
import VerifyURL

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        VerifyURL().setAppKey("57f2f6c1f53f9be63eabd4a5dbe89bc1", appSecret: "5d63c89ba271612e03e3136571241d98")
        
        var a = [String:Any]()
        
        VerifyURL().VerifyURL(url: "www.baidu.com") { (b:[String : Any]) in
            a = b
            
            print(a)
        }
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

