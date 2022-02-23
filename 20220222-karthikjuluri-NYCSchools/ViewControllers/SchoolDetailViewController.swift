//
//  SchoolDetailViewController.swift
//  20220222-karthikjuluri-NYCSchools
//
//  Created by karthik on 2/22/22.
//

import UIKit
import MapKit
class SchoolDetailViewController: UIViewController {

    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var readingSATScoreLabel: UILabel!
    @IBOutlet weak var mathSATScoreLabel: UILabel!
    @IBOutlet weak var writingLabel: UILabel!
    
    @IBOutlet weak var addressLineLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var faxNumberLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadDetailView(_ school: SchoolModel){
                
        schoolNameLabel.text = school.school_name
        
        if let readingScore = school.satScores?.sat_critical_reading_avg_score{
            readingSATScoreLabel.text = "SAT Average Reading Score - " + readingScore
        }
        
        if let writingScore = school.satScores?.sat_writing_avg_score{
            writingLabel.text = "SAT Average Writing Score - " + writingScore
        }
        
        if let mathsScore = school.satScores?.sat_math_avg_score{
            mathSATScoreLabel.text = "SAT Average Maths Score - " + mathsScore
        }
        
        addressLineLabel.text = school.primary_address_line_1
        
        if let city = school.city, let code = school.state_code, let zip = school.zip{
            cityLabel.text = "\(city), \(code), \(zip)"
        }
        websiteLabel.text = school.website
        
        phoneNumberLabel.text = school.phone_number
        emailLabel.text = school.school_email
        faxNumberLabel.text = school.fax_number
        
        self.setLocation(school.location!)
    }
    
    func setLocation(_ location: String) {
        
        let schoolAnnotation = MKPointAnnotation()

        if let schoolCoordinate = self.fetchCoordinates(location){
            schoolAnnotation.coordinate = schoolCoordinate
            self.mapView.addAnnotation(schoolAnnotation)
            let span = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
            let region = MKCoordinateRegion(center: schoolAnnotation.coordinate, span: span)
            let adjustRegion = self.mapView.regionThatFits(region)
            self.mapView.setRegion(adjustRegion, animated:true)
        }
    }

    func fetchCoordinates(_ location: String?) -> CLLocationCoordinate2D?{
        if let schoolAddress = location{
            let coordinateString = schoolAddress.slice(from: "(", to: ")")
            let coordinates = coordinateString?.components(separatedBy: ",")
            if let coordinateArray = coordinates{
                let latitude = (coordinateArray[0] as NSString).doubleValue
                let longitude = (coordinateArray[1] as NSString).doubleValue
                return CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
            }
        }
        return nil
    }
}

