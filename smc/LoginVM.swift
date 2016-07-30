//
//  LoginVM.swift
//  smc
//
//  Created by jiao minmin on 16/7/30.
//  Copyright © 2016年 曲艺. All rights reserved.
//

import UIKit
import SwiftyJSON
import AwesomeCache

class LoginVM: NSObject {
    
    let domain = URLConfig.domain.rawValue
    //登录
    func  login (params :[String : AnyObject]?, success :(json : JSON) -> Void , fail:(error : Any) -> Void){
        
        ZFNetworkTool.post(
            domain+"/api/login/do"
            , params: params
            , success:   { (sucess) -> Void in
                success(json:sucess)
            }

            ,fail:  { (error) -> Void in
                fail(error:error)
            }
        )
    }
    //获取当前登录用户信息
    func  getCurrentUser (params :[String : AnyObject]?, success :(json : JSON) -> Void , fail:(error : Any) -> Void){
        
        ZFNetworkTool.get(
            domain+"/api/user"
            , params: params
            , success:   { (sucess) -> Void in
                success(json:sucess)
            }
            
            ,fail:  { (error) -> Void in
                fail(error:error)
            }
        )
    }
}
