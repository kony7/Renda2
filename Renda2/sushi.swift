//
//  sushi.swift
//  Renda2
//
//  Created by SeinaKonishi on 2022/02/14.
//

import UIKit

class Sushi{
    
    var soundName: String!
    var neta: String!
    var img:String!
    
    init(soundName: String, neta:String, img:String){
        self.soundName = soundName
        self.neta = neta
        self.img = img
    }
    
    func getImage() -> UIImage{
        return UIImage(named: img)!
    }
    
}
