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

class MapTopTableViewCell: UITableViewCell {
    static let identifier = "searchType"
    @IBOutlet weak var typeButton: UIButton!
    
    
    var uniqCell: TypeButton! {
        didSet {
            self.typeButton.setTitle(uniqCell.buttonLabel, for: .normal)
        }
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
