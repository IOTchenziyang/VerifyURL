//
//  VerifyURL.swift
//  Pods
//
//  Created by 🐑🐑🐑 on 17/3/29.
//
//

import Foundation
import Alamofire
import CryptoSwift
import ReachabilitySwift
public class VerifyURL  {

    
//字典转化json数据格式
    func dicToJSON(dict:[String:Int]) ->String {
        let data = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        
        let strJson = String(data: data!, encoding: String.Encoding.utf8)
        
        
        return strJson!
    }
    
    
//网络测试
    public func test() -> Bool {

        let reachability = Reachability()!
        
        print(reachability.currentReachabilityStatus)
        
        if reachability.isReachable {
            if reachability.isReachableViaWiFi {
                print("Reachable via WiFi")
                return true
            } else {
                print("Reachable via Cellular")
                return true
            }
        } else {
            var a = ["state":0,"stateCode":11]
            print(a)
            print(dicToJSON(dict: a ))
            return false
        }
        
    }
    
    
    //设置appId与appSecret
    public func setAppKey(_ appId:String,appSecret:String) -> Void {
        

        let appid = UserDefaults.standard.string(forKey: "appId")
        UserDefaults.standard.set(appId, forKey: "appId")
        
        let appsecret = UserDefaults.standard.string(forKey: "appSecret")
        UserDefaults.standard.set(appSecret, forKey: "appSecret")
    }
    
    
    
    
    
    public func VerifyURL(url:String,callback:@escaping ([String:Any]) -> Void)   {
        
        var appId = UserDefaults.standard.string(forKey: "appId")!
        
        var appSecret = UserDefaults.standard.string(forKey: "appSecret")!
        
        var returnvalue = [String:Any]()
        //判断网络是否连通
        if !test() {
            
                callback(returnvalue)
        }
        
        //判断appid与appsecret是否填写
        if appId == nil {
            var a = ["state":0,"stateCode":21]
            
            print(dicToJSON(dict: a))
            
            callback(returnvalue)
            
        }
        
        var timeStamp = Int(Date().timeIntervalSince1970)
        
        
        var appSignNotMD5 = appSecret + "|" + "\(timeStamp)" + "|safeqr"
        
        var appSign = appSignNotMD5.md5()
        
        
       // private static String createAppSign(String appSecret, long timestamp){
         //   return stringToMD5(appSecret + "|" + timestamp + "|safeqr");
         //   }。
        
        print(appId + " " + appSecret)
        
        var paramter = ["appid":appId,"appSign":appSign,"token":"sd5fads5f45s1d65f1as","url":url,"time":"\(timeStamp)"]
        //后台url
        //"http://open.anxinsao.com/api/App/VerifyURL"
        
        request("http://open.anxinsao.com/api/App/VerifyURL", method: .post, parameters: paramter, encoding: URLEncoding.default, headers: nil).responseJSON { (data:DataResponse<Any>) in
            
            print(data.result.value!)
            
            returnvalue = data.result.value as! [String : Any]
            
            callback(returnvalue)
        }
        
        
        
        
    }
    
    public init() {
    
    }
}
