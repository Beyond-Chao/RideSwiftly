//
//  MainMapViewController.swift
//  RideSwiftly
//
//  Created by BeyondChao on 2016/10/21.
//  Copyright © 2016年 BeyondChao. All rights reserved.
//

import UIKit
import SnapKit

class MainMapViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSbuviews()
    }

    // MARK: - Initialization
    
    private func initialSbuviews() {
        view.insertSubview(mainMapView, at: 0)
        
        mainMapView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    // MARK: Lazy Load
    
    fileprivate lazy var mainMapView: MAMapView = {
        
        let mapView = MAMapView()
        mapView.userTrackingMode = MAUserTrackingMode.follow
        mapView.showsUserLocation = true
        mapView.distanceFilter = 10.0
        mapView.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        mapView.pausesLocationUpdatesAutomatically = false
        mapView.allowsBackgroundLocationUpdates = true
        mapView.delegate = self
        return mapView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: MAMapViewDelegate

extension MainMapViewController: MAMapViewDelegate {
    
    func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
       
        if updatingLocation {
            
            mainMapView.setCenter(userLocation.coordinate, animated: true)

        }
    }
}

