//
//  ProductDetailMapCell.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/17.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import MapKit

class ProductDetailMapCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView!
    

   
    
    func settingStudioAnnotation() {
        let locationManager = CLLocationManager()
        // 詢問使用者是否取得當前位置的授權
        locationManager.requestWhenInUseAuthorization()
        
        let studioAnnotation = MKPointAnnotation()
        // 設定大頭針座標
        studioAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.999613, longitude: 120.212775)
        // 設置大頭針標題
        studioAnnotation.title = "ABC store"
        // 設置大頭針副標題，需點選才能看見
        studioAnnotation.subtitle = "北門路二段16號 L2A, 東區台南市701"
        // 將大頭針的座標位置設為我們的地圖的中心點
        mapView.setCenter(studioAnnotation.coordinate, animated: true)
        // 更改當前可見區域，並且根據指定的坐標和距離值創建新的MKCoordinateRegion。
        mapView.setRegion(MKCoordinateRegion(center: studioAnnotation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100), animated: true)
        // 將大頭針加入 mapView 中
        mapView.addAnnotation(studioAnnotation)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func configure(location:String) {
//        let geoCoder = CLGeocoder()
//        geoCoder.geocodeAddressString(location, completionHandler: {placemarks, error in
//            if let error = error{
//                print(error.localizedDescription)
//                return
//            }
//
//            if let placemarks = placemarks{
//
//                //取得第一個地點標記
//                let placemark = placemarks[0]
//
//                //加上標記
//                let annotation = MKPointAnnotation()
//
//                if let location = placemark.location{
//                    //顯示標記
//                    annotation.coordinate = location.coordinate
//                    self.mapView.addAnnotation(annotation)
//
//                    //設定縮放程度
//                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
//                    self.mapView.setRegion(region, animated: false)
//
//                }

//            }
//
    
//        })
//    }

}
