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
        
            Alamofire.request("http://app.elph.fr/optimapp/optimapp_back?q=user").responseJSON { (defaultDataResponse) in
                switch defaultDataResponse.result {
                case .success(let value):
//                    let jsonDecoder = JSONDecoder()
                    let json = JSON(value)
                    do {
//                        user_name.text = json
                        debugPrint(json)
                        
                        
                        
                        
                    } catch let error {
                        print("error parsing JSON: \(error)")
                        debugPrint(json)
                    }
                    
                case .failure(let error):
                    print("error: \(error)")
                    debugPrint(defaultDataResponse)
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
