//
//  Souvenir.swift
//  optimapp
//
//  Created by Théa Dos Santos on 16/01/2020.
//  Copyright © 2020 Théa. All rights reserved.
//

import Foundation
import UIKit

class Souvenir{
    let image: String
    let title: String
    let souvenirDate: Double
    
    init( title: String,image: String ,souvenirDate: Double = 234567){
        
        self.image = image
        self.title = title
        self.souvenirDate = souvenirDate
        
    }
}
