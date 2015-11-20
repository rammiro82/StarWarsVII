//
//  ForceSensitive.swift
//  StarWarsVII
//
//  Created by Ramiro García Salazar on 19/11/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import UIKit

class ForceSensitive: StarWarsCharacter {
    
    //MARK: - Properties
    let midichlorians: Int
    
    
    //MARK: - Initialization
    init(firstName: String?,
        lastName: String?,
        alias: String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        affiliation: StarWarsAffiliation,
        midichlorians: Int){
            
            self.midichlorians = midichlorians
            super.init(firstName: firstName,
                lastName: lastName,
                alias: alias,
                soundData: soundData,
                photo: photo,
                url: url,
                affiliation: affiliation)
    }
    
    //MARK: - Convenience
    convenience init(jediWithFirstName: String?,
        lastName: String?,
        alias: String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        midichlorians: Int){
            
            self.init(firstName: jediWithFirstName,
                lastName: lastName,
                alias: alias,
                soundData: soundData,
                photo: photo,
                url: url,
                affiliation: .RebelAlliance,
                midichlorians: midichlorians)
    }
    
    convenience init(sithWithFirstName: String?,
        lastName: String?,
        alias: String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        midichlorians: Int){
            
            self.init(firstName: sithWithFirstName,
                lastName: lastName,
                alias: alias,
                soundData: soundData,
                photo: photo,
                url: url,
                affiliation: .GalacticEmpire,
                midichlorians: midichlorians)
    }
    
    //MARK: - Override
    override var proxyForComparison: String{
        get{
            return super.proxyForComparison + "\(midichlorians)"
        }
    }
    
    override var proxyForSorting : String{
        get{
            let isSith = ((affiliation == .GalacticEmpire) || (affiliation == .FirstOrder)) ? "Z" : "X"
            return "\(isSith)\(super.proxyForSorting)\(midichlorians)"
        }
    }
}


