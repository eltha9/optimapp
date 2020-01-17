//
//  VoyageViewController.swift
//  optimapp
//
//  Created by Théa Dos Santos on 14/01/2020.
//  Copyright © 2020 Théa. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
//    let buttonTypes: [TypeButton] = [TypeButton("resto","resto")
//        ,TypeButton("monuments","monuments")
//        ,TypeButton("insolite","insolite")
//        ,TypeButton("famille","famille")
//        ,TypeButton("romantique","romantique")
//        ,TypeButton("découverte","decouverte")]
//
    let buttonTypes: [String] = ["resto"
        ,"monuments"
        ,"insolite"
        ,"famille"
        ,"romantique"
        ,"decouverte"]
    
    @IBOutlet weak var goTo: UIButton!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "map_tab_icon"), tag: 2)
        
//        self.goTo.layer.cornerRadius = self.goTo.frame.width / 2
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MapTopTableViewCell
        cell.content.text = buttonTypes[indexPath.row]
        return cell
    }
}


//extension MapViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return buttonTypes.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: MapTopTableViewCell.identifier, for: indexPath) as! MapTopTableViewCell
//
//        cell.uniqCell = buttonTypes[indexPath.row]
//
//        return cell
//    }
//
//
//}
