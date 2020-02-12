//
//  Places.swift
//  optimapp
//
//  Created by Théa Dos Santos on 12/02/2020.
//  Copyright © 2020 Théa. All rights reserved.
//

import Foundation

/*
"result": [
{
  "location": {
    "latitude": 48.8545889,
    "longitude": 2.4155385
  },
  "id": "ff3ae4c3c2c802e37e116710831b7cbde71bdceb",
  "name": "Hotel ibis Paris Porte de Montreuil",
  "photos": [
    {
      "height": 768,
      "html_attributions": [
        "<a href=\"https:\/\/maps.google.com\/maps\/contrib\/113542994842886154309\">Hotel ibis Paris Porte de Montreuil<\/a>"
      ],
      "photo_reference": "CmRaAAAALMPFIg1Fi7U_T1f4j90JJKpMxt9FAWLutsp19dGmuNVxgWmbDHLLucbnSg_9AjAmlVliqXhd0NuFT5LkNei8UVRMn0FHAswvG6xA2ii-xhsnCrnuL9oR7rw2j0PPy9ZBEhA3eABkBLv9MpRmoEEvVGuYGhS1Xw8SjNPVlNazuMyh03bUrrKLWQ",
      "width": 1024
    }
  ],
  "place_id": "ChIJdXRK2IFy5kcRNfUUzvJGcCk",
  "rating": 3.3,
  "rating_count": 1303,
  "reference": "ChIJdXRK2IFy5kcRNfUUzvJGcCk",
  "address": "2 Avenue du Professeur André Lemierre, Paris"
},*/


//main
struct Places:Decodable{
    var result:[Place]
}

//result
struct Place:Decodable{
    var location:Location
    
    var id:String
    var name:String
    
    var photos:[Photo]
    
    var place_id:String
    var rating:Float
    var rating_count:Int
    var reference:String
    var address:String
    
}

//sub-struct of Place

struct Location:Decodable{
    var latitude:Float
    var longitude:Float
}

struct Photo:Decodable{
    var height:Int
    var width:Int
    var html_attributions:[String]
    var photo_reference:String

}

// Places request
struct PlacesRequest{
    var urlRequest:URL
    
    init(placeType:String ,latitude:Float, longitude:Float  ){
        let urlTemp = "https://elph.fr/optimapp_back/?q=places&type=\(placeType)&lnt=\(latitude)&lng=\(longitude)"
        self.urlRequest = URL(string: urlTemp)!
    }
    
    func getPlaces(){
        
    }
    
}
