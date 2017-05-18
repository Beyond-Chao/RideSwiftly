//
//  MainBikeModel.swift
//  RideSwiftly
//
//  Created by BeyondChao on 2016/11/8.
//  Copyright © 2016年 BeyondChao. All rights reserved.
//

import UIKit

class MainBikeModel: NSObject {

    class func fetchNearbyBike() {
        
        NetworkService.shareInstance.getRequest(urlString: "http://dormappapi.59shangcheng.com/business/list?app_version=2.5.0&device_type=0&protocol_version=1.3.0&sign=c8a41d0d358afebda60efcb55a5e9430&time=1478589395&token=avv7cNRSKWAYYgprcPUFh2fo4nc0SLR9HNrO70xwarR3qWCh%2BVK2wnGZheWceZEuIS%2B39k3xem6b8LPW/YnQVAIHlGQnqjfSOjYdQYnCS%2Bc%3D", params: nil, success: { (response) in
        
            print(response)
        
        }) {(error) in
        
            print("error = \(error)")
            
        }
    }
}
