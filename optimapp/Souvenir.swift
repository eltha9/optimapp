//
//  Souvenir.swift
//  optimapp
//
//  Created by Théa Dos Santos on 16/01/2020.
//  Copyright © 2020 Théa. All rights reserved.
//

import Foundation
import UIKit

enum SouvenirError:Error{
    case noData
}



//class Souvenir{
//    let image: String
//    let title: String
//    let souvenirDate: Double
//
//    init( title: String,image: String ,souvenirDate: Double = 234567){
//
//        self.image = image
//        self.title = title
//        self.souvenirDate = souvenirDate
//
//    }
//
//}

struct SouvenirsModel:Decodable {
    var result:[SouvenirModel]
}
// équivault un souvenir
struct SouvenirModel : Decodable{
    var title:String
    var date:Int
    var main_image:String
    var text:String
}


//requete

struct SouvenirResquest{
    let urlRequest:URL
    
    init(){
        self.urlRequest = URL(string: "https://elph.fr/optimapp_back?q=user-events")!
    }
    
    func getSouvenirs(completion: @escaping(Result<[SouvenirModel], SouvenirError>)-> Void ){
        let dataTask = URLSession.shared.dataTask(with: self.urlRequest) {data , _, _ in
            guard let json = data  else {
                completion(.failure(.noData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                
                let souvenirResponse = try decoder.decode(SouvenirsModel.self, from: json)
                let souvenirData = souvenirResponse.result
                completion(.success(souvenirData))
                
            }catch{
                completion(.failure(.noData))
            }
        }
        dataTask.resume()
    }
}
