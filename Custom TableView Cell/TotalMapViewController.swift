//
//  TotalMapViewController.swift
//  Custom TableView Cell
//
//  Created by D7703_17 on 2018. 6. 11..
//  Copyright © 2018년 박금상. All rights reserved.
//

import UIKit
import MapKit

class TotalMapViewController: UIViewController {

      @IBOutlet weak var totalMapView: MKMapView!
      //주소 배열 받는 곳
      var locations = [String]()
      //이름 배열 받는 곳
      var names = [String]()
      //pin 저장 배열
      var annotations = [MKPointAnnotation]()
      var count = 0
      
      override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            print(locations)
            
            //geocording.
            viewMap(locations: locations, names: names)
      }
      func viewMap(locations: [String], names:[String]){
            for addr in locations {
                  let geoCoder = CLGeocoder()
                  geoCoder.geocodeAddressString(addr) {
                        (placemarks:[CLPlacemark]?, error : Error?) -> Void in
                        if let myError = error{
                              print(myError)
                              return
                        }
                        if let myPlacemarks = placemarks {
                              let myPlacemarks = myPlacemarks[0]
                              let loc = myPlacemarks.location?.coordinate
                              
                              let anno = MKPointAnnotation()
                              anno.coordinate = loc!
                              anno.title = names[self.count]
                              self.count = self.count + 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                              anno.subtitle = addr
                              self.annotations.append(anno)
                              self.totalMapView.addAnnotations(self.annotations)
                              
                              //여러개의 pin을 지도에 꽉채움
                              self.totalMapView.showAnnotations(self.annotations, animated: true)
                              
                        } else {
                              print("placemarks nil발생")
                        }
                  }
            }
            
      }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
