//
//  SouvenirCell.swift
//  optimapp
//
//  Created by Théa Dos Santos on 16/01/2020.
//  Copyright © 2020 Théa. All rights reserved.
//

import UIKit

class SouvenirCell: UITableViewCell {


    
    
    @IBOutlet weak var photoSouvenir: UIImageView!
    
    @IBOutlet weak var nom: UILabel!
    
    @IBOutlet weak var jolie: UILabel!
    
    
    func setCell(souvenir: Souvenir)
    {
        photoSouvenir.image = UIImage(named: souvenir.image)
        
        nom.text = souvenir.title
        jolie.text = to_date(timestamp: souvenir.souvenirDate)
    }
    
    func to_date(timestamp: Double)->String
    {
        let date = Date(timeIntervalSinceReferenceDate: timestamp)
        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "MM/yyyy"
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
}

