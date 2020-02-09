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
      
    
//    var souvenirsCells:[Souvenir] = []
//    var souvenirs:[Souvenir] = []
    
    
    var souvenirList = [SouvenirModel](){
        didSet{
            DispatchQueue.main.async {
                self.souvenirTableView.reloadData()
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tabBarItem = UITabBarItem(title: "Souvenirs", image: UIImage(named: "souvenir_tab_icon"), tag: 1)
        
//        self.souvenirs.append(Souvenir( title: "Plage en Grèce",image: "test_2" ,souvenirDate: 1579205087.00))
//        self.souvenirs.append(Souvenir( title: "Le désert Australien",image: "test_2" ,souvenirDate: 1579213087.00))
        
        Alamofire.request("https://elph.fr/optimapp_back/?q=user").responseJSON { (defaultDataResponse) in
            switch defaultDataResponse.result {
            case .success(let value):

                let json = JSON(value)
                do {
                    
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
        
//        Alamofire.request("https://elph.fr/optimapp_back/?q=user-events").responseJSON { (defaultDataResponse) in
//            switch defaultDataResponse.result {
//            case .success(let value):
//
//                let json = JSON(value)
//                do {
//
//                    for i in 0...(json["result"].count - 1) {
//
//                        self.souvenirs.append(Souvenir(title: json["result"][i]["title"].string! ,image: "test_2" ,souvenirDate: 34.00 ) )
//
//                    }
//                    debugPrint(json)
//
//                } catch let error {
//                    print("error parsing JSON: \(error)")
//
//                }
//
//
//            case .failure(let error):
//                print("error: \(error)")
//
//            }
//
//        }
        
//        debut de la requete au souvenir
        
        let souvenirRequete = SouvenirResquest()
        souvenirRequete.getSouvenirs {[weak self] result in
            switch result {
            case .failure(let error):
                print(error)
                
            case .success( let souvenirs ):
                self?.souvenirList = souvenirs
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.souvenirsCells = self.souvenirs
        
        souvenirTableView.delegate = self
        souvenirTableView.dataSource = self
        
        // round avatar
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.clipsToBounds = true
        
    }

   
}

extension SouvenirViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return souvenirList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let souvenir = self.souvenirList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "souvenirCell") as! SouvenirCell
        
        cell.setCell(souvenir : souvenir)
        
        return cell
    }
}

