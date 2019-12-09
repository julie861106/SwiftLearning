//
//  ProductDetailMapCell.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/17.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ProductDetailMapCell: UITableViewCell, MKMapViewDelegate{

    @IBOutlet var mapView: MKMapView!
    

    func settingStudioAnnotation() {
        mapView.delegate = self as MKMapViewDelegate
        
        let locationManager = CLLocationManager()
        // 詢問使用者是否取得當前位置的授權
        locationManager.requestWhenInUseAuthorization()
        
        
        
        let studioAnnotation = MKPointAnnotation()
        // 設定大頭針座標
//        studioAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.999613, longitude: 120.212775)
        studioAnnotation.coordinate = CLLocationCoordinate2D(latitude: 25.0324054, longitude: 121.5510823)
        //敦化
//        studioAnnotation.coordinate = CLLocationCoordinate2D(latitude: 25.015549, longitude: 121.5427091)
        //信義安和
//        studioAnnotation.coordinate = CLLocationCoordinate2D(latitude: 25.0324054, longitude: 121.5510823)
        // 設置大頭針標題
        studioAnnotation.title = "ABC store"
        // 設置大頭針副標題，需點選才能看見
//        studioAnnotation.subtitle = "資工系 德田館"
    
//        studioAnnotation.subtitle = "辛亥店"
        studioAnnotation.subtitle = "信義安和店"
        // 將大頭針的座標位置設為我們的地圖的中心點
        mapView.setCenter(studioAnnotation.coordinate, animated: true)
        // 更改當前可見區域，並且根據指定的坐標和距離值創建新的MKCoordinateRegion。
        mapView.setRegion(MKCoordinateRegion(center: studioAnnotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500), animated: true)
        // 將大頭針加入 mapView 中
        mapView.addAnnotation(studioAnnotation)
        
        
        // Do any additional setup after loading the view.
        //在地圖上標註位置
//        let geoCoder = CLGeocoder()
//        geoCoder.geocodeAddressString("忠孝復興", completionHandler: {
//            placemarks, error in
//            if error != nil {
//                print(error)
//                return
//            }
//            if let placemarks = placemarks {
//                // 取得第一個座標
//                let placemark = placemarks[0]
//                // 加上地圖標註
//                let annotation = MKPointAnnotation()
//                annotation.title = "ABC store"
//                annotation.subtitle = "信義安和店"
//                if let location = placemark.location {
//                    // 顯示標註
//                    annotation.coordinate = location.coordinate
//                    self.mapView.showAnnotations([annotation], animated: true)
//                    self.mapView.selectAnnotation(annotation, animated: true)
//                }
//            }
//        })
        
 
        
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 判斷標記點是否與使用者相同，若為 true 就回傳 nil
        if annotation is MKUserLocation {
            return nil
        }
        
        // 創建一個重複使用的 AnnotationView
        var studioAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Studio")
        if studioAnnotationView == nil {
            // 如果 studioAnnotationView 為 nil，那麼我們就初始化一個 MKPinAnnotationView
            studioAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Studio")
        }
        
        
        // 判斷如果標記的 title 為 “ABC store”
        if annotation.title == "ABC store" {
            // 設定左方圖片
            let imageView = UIImageView(image: UIImage(named: "Icon-76"))
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            imageView.layer.cornerRadius = 6
            imageView.clipsToBounds = true
            studioAnnotationView?.leftCalloutAccessoryView = imageView
            
            // 設定中間描述
            let label = UILabel()
            label.text = "信義安和店"
            label.font = UIFont(name: "PingFangTC-Medium", size: 14)
            studioAnnotationView?.detailCalloutAccessoryView = label
            
            
            // 設定右方按鈕
            let button = UIButton(type: .detailDisclosure)
            button.addTarget(self, action: #selector(checkDetail), for: .touchUpInside)
            studioAnnotationView?.rightCalloutAccessoryView = button
        }
        
        
        studioAnnotationView?.canShowCallout = true
        return studioAnnotationView
    }
    
    @objc func checkDetail() {
        let optionMenu = UIAlertController(title: nil, message: "選擇功能", preferredStyle: .actionSheet)
        
        let gpsAction = UIAlertAction(title: "地圖導航", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
//            let targetLocation = CLLocationCoordinate2D(latitude: 22.999613, longitude: 120.212775)
            
            // 2. 終點座標
            let sourceLocation = CLLocationCoordinate2D(latitude: 25.0324054, longitude: 121.5510823)
                       //25.0196607,121.5411974
                       //25.0304814,121.5331462
                       //25.0335589,121.5520207
            let destinationLocation = CLLocationCoordinate2D(latitude: 25.0335589, longitude: 121.5520207)
            
        
            
            // 3. 初始化 MKPlacemark
            let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
            let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
            
            // 4. 透過 Placemark 初始化一個 MKMapItem
            let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
            let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
//            let destinationMapItem = MKMapItem.forCurrentLocation()
            
            // 建立導航路線的起點及終點 MKMapItem
            let routes = [destinationMapItem,sourceMapItem]
            // 我們可以透過 launchOptions 選擇我們的導航模式，例如：開車、走路等等...
            MKMapItem.openMaps(with: routes, launchOptions:
//                [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeWalking])
            
                [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving])
            
            
            
            /*
            // 終點座標
            let targetCoordinate = targetLocation.coordinate
            // 初始化 MKPlacemark
            let targetPlacemark = MKPlacemark(coordinate: targetCoordinate)
            // 透過 targetPlacemark 初始化一個 MKMapItem
            let targetItem = MKMapItem(placemark: targetPlacemark)
            // 使用當前使用者當前座標初始化 MKMapItem
            let userMapItem = MKMapItem.forCurrentLocation()
            // 建立導航路線的起點及終點 MKMapItem
            let routes = [userMapItem,targetItem]
            // 我們可以透過 launchOptions 選擇我們的導航模式，例如：開車、走路等等...
            MKMapItem.openMaps(with: routes, launchOptions: [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving])
            */
            
        })
        
        optionMenu.addAction(gpsAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        //繼承TableViewController
        UIApplication.shared.keyWindow?.rootViewController?.present(optionMenu, animated: true, completion: nil)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
