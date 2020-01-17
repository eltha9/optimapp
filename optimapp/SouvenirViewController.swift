//
//  VoyageViewController.swift
//  optimapp
//
//  Created by Théa Dos Santos on 14/01/2020.
//  Copyright © 2020 Théa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class SouvenirViewController: UIViewController {
    
    @IBOutlet weak var souvenirTableView: UITableView!
    
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var user_parcour: UILabel!
    
    
    var souvenirsCells:[Souvenir] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tabBarItem = UITabBarItem(title: "Souvenirs", image: UIImage(named: "souvenir_tab_icon"), tag: 1)
        
            Alamofire.request("https://elph.fr/optimapp_back/?q=user").responseJSON { (defaultDataResponse) in
                switch defaultDataResponse.result {
                case .success(let value):
//                    let jsonDecoder = JSONDecoder()
                    let json = JSON(value)
                    do {
                        debugPrint(json)
                        
//                        let avatarLink = json["avatar"].string!
//                        
//                        let tempName = json["name"].string!
//                        let distance = json["distance"].int! / 1000
//                        let countries = json["countries"].string!
//                        
//                        self.avatar.image = UIImage(named: avatarLink)
//                        self.user_name.text = tempName
//                        self.user_parcour.text = "\( distance )km - \(countries) km"
                        
                        
                    } catch let error {
                        print("error parsing JSON: \(error)")
                        
                    }
                    
                case .failure(let error):
                    print("error: \(error)")
                    
                }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.souvenirsCells = addSouvenirs()
        
        souvenirTableView.delegate = self
        souvenirTableView.dataSource = self
        
        // round avatar
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.clipsToBounds = true
    }
    func user()
    {
        
    }
    
    func addSouvenirs() -> [Souvenir]
    {
      
        
        var temp:[Souvenir] = []
        let cell = Souvenir( title: "test",image: "test_2" ,souvenirDate: 1579205087.00)
        
        temp.append(cell)
        temp.append(cell)
        temp.append(cell)
        temp.append(cell)
        
        return temp
        
    }

//    func jsonToString(json: AnyObject){
//        do {
//            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
//            let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
//            print(convertedString) // <-- here is ur string
//
//        } catch let myJSONError {
//            print(myJSONError)
//        }
//
//    }
}

extension SouvenirViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return souvenirsCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let souvenir = self.souvenirsCells[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "souvenirCell") as! SouvenirCell
        
        cell.setCell(souvenir: souvenir)
        
        return cell
    }
}
