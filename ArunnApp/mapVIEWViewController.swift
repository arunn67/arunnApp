//
//  mapVIEWViewController.swift
//  ArunnApp
//
//  Created by BYOT on 08/03/23.
//

import UIKit
import GoogleMaps

class mapVIEWViewController: UIViewController {

    @IBOutlet weak var backBTN: UIButton!
    @IBOutlet weak var mapVIEW: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backBTN.setImage(UIImage(named: "previous"), for: .normal)
        
        

        // Do any additional setup after loading the view.
//
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
                let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
                self.mapVIEW.addSubview(mapView)

//                // Creates a marker in the center of the map.
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
                marker.title = "Sydney"
                marker.snippet = "Australia"
                marker.map = mapView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backACT(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
