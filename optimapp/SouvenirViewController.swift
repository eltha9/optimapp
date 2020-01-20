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

                    let json = JSON(value)
                    do {
//                        debugPrint(json)
                        
                        let tempName = json["name"].string!
                        let distance = json["distance"].int! / 1000
                        let countries = json["countries"].int!
                        
                        self.user_name.text = tempName
                        self.user_parcour.text = "\( distance )km - \(countries) pays"
                        
                        //set avatar
                        let avatarLink = json["avatar"].string!
                        
                        let url = URL(string: avatarLink)
                        let data = try? Data(contentsOf: url!)
                        self.avatar.image = UIImage(data: data!)
                        
                        
                        
                        
                        
                        
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

    var souvenirs:[Souvenir] = []
    func addSouvenirs() -> [Souvenir]
    {
      
        
//        var temp:[Souvenir] = []
        let cell = Souvenir( title: "Plage en Grèce",image: "test_2" ,souvenirDate: 1579205087.00)
        
        Alamofire.request("https://elph.fr/optimapp_back/?q=user-events").responseJSON { (defaultDataResponse) in
            switch defaultDataResponse.result {
            case .success(let value):
                
                let json = JSON(value)
                do {
//                    debugPrint(json)
                    
                    
                    for i in 0...(json.count - 1) {
                        
                        debugPrint(json[i]["title"])
                        
                        self.souvenirs.append(Souvenir(title: json[i]["title"].string! ,image: "test_2" ,souvenirDate: 34.00 ) )
                        
                    }
                    
                    
                    
                    debugPrint(self.souvenirs)
                } catch let error {
                    print("error parsing JSON: \(error)")
                    
                }
                
            case .failure(let error):
                print("error: \(error)")
                
            }
        }
        
//        temp.append(cell)
        
//        temp.append(Souvenir( title: "Plage en Grèce",image: "test_2" ,souvenirDate: 1579205087.00))
//        temp.append(Souvenir( title: "Manoir à Oslo",image: "test_2" ,souvenirDate: 1579785087.00))
//        temp.append(Souvenir( title: "Le Palais de Vladimir",image: "test_2" ,souvenirDate: 1573405087.00))
//        temp.append(Souvenir( title: "Amiens",image: "test_2" ,souvenirDate: 1579205087.00))
//        temp.append(Souvenir( title: "Le désert Australien",image: "test_2" ,souvenirDate: 1579213087.00))
        debugPrint(self.souvenirs)
        return self.souvenirs
        
        
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
