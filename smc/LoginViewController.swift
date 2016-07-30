//
//  LoginViewController.swift
//  smc
//
//  Created by 曲艺 on 16/7/29.
//  Copyright © 2016年 曲艺. All rights reserved.
//

import UIKit
import SwiftyJSON


class LoginViewController: UIViewController {
    
    //ViewModel
    private var viewModel : LoginVM! = LoginVM()
    
    
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
        viewModel.login(
            ["loginId" : txt_loginName.text!, "password" : txt_Pwd.text!],
            success: {(json) -> Void in
                print(json["data"]["name"])
                //获取当前登录用户
                self.viewModel.getCurrentUser(nil,
                    success: { (json) -> Void in
                        let subjectList =  json["data"]["subjectList"]
                        for (index,subJson):(String, JSON) in subjectList {
                            print("\(index)：\(subJson)")
                        }
                        // print(json)
                        
                    }, fail: { (error) -> Void in
                        print(error)
                    }
                )
            },
            fail: {
                (error) -> Void in
                print(error)
        })
        
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
