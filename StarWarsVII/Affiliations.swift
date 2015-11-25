//
//  Affiliations.swift
//  StarWarsVII
//
//  Created by Ramiro García Salazar on 19/11/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import Foundation

enum StarWarsAffiliation{
    
    case GalacticEmpire
    case RebelAlliance
    case JabbaCriminalEmpire
    case FirstOrder
    case Unknown
    
    static func cases() -> [StarWarsAffiliation]{
        return [.GalacticEmpire, .RebelAlliance, .JabbaCriminalEmpire, .FirstOrder, .Unknown]
    }
    
    static func countAffiliations() -> Int {
        return 5
    }
    
    static func nameOfAffiliation(aff: StarWarsAffiliation) -> String{
        let name : String
        
        switch aff{
        case .GalacticEmpire:
            name = "Galactic Empire"
            
        case .RebelAlliance:
            name = "Rebel Alliance"
            
        case .JabbaCriminalEmpire:
            name = "Jabba's Criminal Empire"
            
        case .FirstOrder:
            name = "First Order"
            
        case .Unknown:
            name = "Unknown"
        }
        
        return name
    }
    
    static func byName(name: String) ->StarWarsAffiliation{
        
        let aff : StarWarsAffiliation
        
        switch name{
        case "Galactic Empire":
            aff = .GalacticEmpire
            
        case "Rebel Alliance":
            aff = .RebelAlliance
            
        case "Jabba's Criminal Empire":
            aff = .JabbaCriminalEmpire
            
        case "First Order":
            aff = .FirstOrder
            
        default:
            aff = .Unknown
        }
        
        return aff
        
    }
}