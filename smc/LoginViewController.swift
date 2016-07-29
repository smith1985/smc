//
//  LoginViewController.swift
//  smc
//
//  Created by 曲艺 on 16/7/29.
//  Copyright © 2016年 曲艺. All rights reserved.
//

import UIKit
//import Alamofire
//import SwiftyJSON


class LoginViewController: UIViewController {
    
    @IBOutlet weak var txt_loginName: UITextField!
    @IBOutlet weak var txt_Pwd: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txt_Pwd.delegate=self
        txt_loginName.delegate=self
        
        print()
        
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
        
        if txt_loginName.text!.isEmpty{
            
            let alertController = UIAlertController(title: "提示", message:"请输入用户名!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        
        if txt_Pwd.text!.isEmpty{
            
            let alertController = UIAlertController(title: "提示", message:"请输入密码!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        
        //        Alamofire.request(.POST, "http://192.168.200.30:8088/smartcampusv2-web/api/login/do", parameters: ["loginId" : "test", "password" : "123"]) .responseJSON { response in
        //
        //
        //            if let value = response.result.value {
        //                let json = JSON(value)
        //                print(json["data"]["name"])
        //                if let number = json[1].string {
        //                    // 找到电话号码
        //                    print("第一个联系人的第一个电话号码：",number)
        //                }
        //            }
        //        }
        
        let url="http://192.168.200.30:8088/smartcampusv2-web/api/login/do"
        ZFNetworkTool.post(
            url
            , params: ["loginId" : "test", "password" : "123"]
            , success: {
                (json) -> Void in
                print(json["data"]["name"])
                
                ZFNetworkTool.get(
                    "http://192.168.200.30:8088/smartcampusv2-web/api/user"
                    , params: nil
                    , success: {
                        (json) -> Void in
                        print(json)
                    }
                    ,fail: {
                        //尾随闭包，也就是最后一个参数。
                        (error) -> Void in
                        print(error)
                    }
                )
                
            }
            ,fail: {
                //尾随闭包，也就是最后一个参数。
                (error) -> Void in
                print(error)
            }
        )
        
        

        
    }
    
    
}

extension LoginViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //        txt_loginName.resignFirstResponder()
        //        txt_Pwd.resignFirstResponder()
        
        if textField==self.txt_loginName{
            
            txt_loginName.resignFirstResponder()
            txt_Pwd.becomeFirstResponder()
        }
        else{
            txt_Pwd.resignFirstResponder()
            LoginBtn_Click(self.LoginBtn)
        }
        return true
    }
}
