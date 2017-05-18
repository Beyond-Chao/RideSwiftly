//
//  NetworkService.swift
//  RideSwiftly
//
//  Created by BeyondChao on 2016/11/8.
//  Copyright © 2016年 BeyondChao. All rights reserved.
//

import UIKit
import Alamofire


// 定义成功失败闭包
typealias SuccessClosure = (_ resultDictionary:[String: AnyObject]?) -> Void
typealias FailureClosure = (_ error:Error) -> Void
// 定义抛出错误
struct FireError: Error {
    let description: String
}

class NetworkService: NSObject {

    static let shareInstance: NetworkService = {
        let networkService = NetworkService()
        return networkService
    }()

    func getRequest(urlString: String , params: [String: AnyObject]?, success : @escaping (_ responseObject : Any)->(), failture : @escaping (_ error : NSError)->()) {
        
        Alamofire.request(urlString, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            switch response.result {
            case .success(let data):
                success(data)
            case .failure(let ecodingError):
                failture(ecodingError as NSError)
            }
        }
    }

//    
//    func postRequest(urlString: String, params: [String: AnyObject]?, success: @escaping SuccessClosure, failure: @escaping FailureClosure) {
//        
//        Alamofire.request(urlString, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//            
//            switch response.result {
//            case .success(let data):
//                success(data)
//            case .failure(let encodingError):
//                failure(encodingError as NSError)
//            }
//        }
//    }
    
    
    
}
