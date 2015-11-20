//
//  StarWarsCharacter.swift
//  StarWarsVII
//
//  Created by Ramiro García Salazar on 19/11/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import UIKit

class StarWarsCharacter: Equatable, Comparable {
    
    //MARK: - Properties
    let firstName   : String?
    let lastName    : String?
    let alias       : String?
    let photo       : UIImage
    let url         : NSURL
    let affiliation : StarWarsAffiliation
    let soundData   : NSData

    //MARK: - Computed Variables
    var name : String? {
        get{
            
            guard firstName == nil && lastName == nil else{
                return "\(firstName) \(lastName)"
                    
            }
            
            guard let _ = firstName else{
                return lastName
            }
            guard let _ = lastName else{
                return firstName
            }
            
            return ""
        }
    }
    
    //MARK: - Init
    init(firstName: String?,
        lastName: String?,
        alias: String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        affiliation: StarWarsAffiliation){
            
            self.firstName = firstName
            self.lastName = lastName
            self.alias = alias
            self.photo = photo
            self.soundData = soundData
            self.url = url
            self.affiliation = affiliation
    }
    
    convenience init(alias: String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        affiliation: StarWarsAffiliation){
            self.init(firstName: nil,
                lastName: nil,
                alias: alias,
                soundData: soundData,
                photo: photo,
                url: url,
                affiliation: affiliation)
    }
    
    //MARK: - Proxies
    var proxyForComparison : String{
        get{
            return "\(firstName)\(lastName)\(alias)\(url)\(affiliation)"
        }
    }
    
    var proxyForSorting : String{
        get{
            return "A\(firstName)\(lastName)\(alias)"
        }
    }

}


extension StarWarsCharacter: CustomStringConvertible{
    var description: String{
        get{
            if let name = name, alias = alias{
                return "<\(self.dynamicType): \(name) \(alias)>"
            }else{
                return "<\(self.dynamicType)"
            }
        }
    }
}

//MARK: - Operators
func ==(lhs: StarWarsCharacter, rhs: StarWarsCharacter) -> Bool{

    //1er caso: son el mismo objeto
    guard !(lhs === rhs) else{
        return true
    }
    
    //2º caso: tiene clases distintas
    guard lhs.dynamicType == rhs.dynamicType else{
        return false
    }
    
    // caso genérico
    return (lhs.proxyForComparison == rhs.proxyForComparison)
}

func <(lhs: StarWarsCharacter, rhs: StarWarsCharacter) -> Bool{
    return (lhs.proxyForSorting < rhs.proxyForSorting)
}









