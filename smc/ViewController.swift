//
//  ViewController.swift
//  smc
//
//  Created by 曲艺 on 16/7/27.
//  Copyright © 2016年 曲艺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("发生2")
        // Do any additional setup after loading the view, typically from a nib.
        
        let url="4/news/latest"
        ZFNetworkTool.get(
            url
            , params: nil
            , success: {
                (json) -> Void in
                print(json)
            }
        )
        {
            //尾随闭包，也就是最后一个参数。
            (error) -> Void in
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

