//
//  ViewController.swift
//  20220222-karthikjuluri-NYCSchools
//
//  Created by karthik on 2/22/22.
//
import UIKit

class SchoolTableViewCell: UITableViewCell {
    
    static let identifier = "SchoolTableViewCell"
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var navigateButton: UIButton!

    var school: SchoolModel! {
        didSet {
            schoolNameLabel.text = school.school_name
            if let city = school.city, let code = school.state_code, let zip = school.zip{
                cityLabel.text = "\(city), \(code), \(zip)"
            }
        }
    }
}
