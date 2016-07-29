//
//  LoginViewController.swift
//  smc
//
//  Created by 曲艺 on 16/7/29.
//  Copyright © 2016年 曲艺. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txt_loginName: UITextField!
    @IBOutlet weak var txt_Pwd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txt_Pwd.delegate=self
        txt_loginName.delegate=self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        txt_loginName.resignFirstResponder()
        txt_Pwd.resignFirstResponder()
    }
    //登陆
    @IBAction func LoginBtn_Click(sender: AnyObject) {
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
    
    
}

extension LoginViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        txt_loginName.resignFirstResponder()
        txt_Pwd.resignFirstResponder()
        return true
    }
}
