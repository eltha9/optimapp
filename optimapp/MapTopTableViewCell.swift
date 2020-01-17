//
//  MapTopTableViewCell.swift
//  optimapp
//
//  Created by Théa Dos Santos on 14/01/2020.
//  Copyright © 2020 Théa. All rights reserved.
//

import UIKit

class TypeButton {
    let buttonLabel: String
    let buttonType: String
    
    init(_ button_text: String, _ type: String) {
        self.buttonLabel = button_text
        self.buttonType = type
    }
}

class MapTopTableViewCell: UICollectionViewCell {
    
    @IBOutlet weak var content: UILabel!
    

}
