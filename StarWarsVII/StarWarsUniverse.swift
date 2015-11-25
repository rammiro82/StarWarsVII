//
//  StarWarsUniverse.swift
//  StarWarsVII
//
//  Created by Ramiro García Salazar on 24/11/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import UIKit



// Carta a los reyes magos

class StarWarsUniverse {
    //MARK: - Private Interface
    private var characters : [StarWarsAffiliation:[StarWarsCharacter]]
    
    //MARK: - Inicialization
    init(arrayOfCharacters: [StarWarsCharacter]){
        
        // inicializamos el diccionario vacío
        characters = Dictionary<StarWarsAffiliation, Array<StarWarsCharacter>>()
        
        for each in StarWarsAffiliation.cases(){
            characters[each] = Array<StarWarsCharacter>()
        }
        
        for character in arrayOfCharacters{
            // según la afiliación, lo metemos en un sitio u otro.
            let aff = character.affiliation
            
            characters[aff]?.append(character)
        }
        
        
    }
    
    //MARK: - Public interface
    // total de personajes
    var countCharacters: Int{
        get{
            var total = 0
            
            for affiliation in StarWarsAffiliation.cases(){
                total = total + countCharacters(affiliation)
            }
            return total
        }
    }
    
    // El total de las afiliciaciones
    var countAffiliations: Int{
        get{
            
            return StarWarsAffiliation.countAffiliations()
        }
    }
    
    // Total de personajes para cada afiliación
    func countCharacters(inAffiliation: StarWarsAffiliation) -> Int{
        // obtengo el array de la afiliciación y le pregunto cual es su tamaño
        if let chars = characters[inAffiliation]{
            return chars.count
        }
        return 0
    }
    
    // El nombre de una afiliación
    func affiliationName(atIndex: Int) -> String{
        //TODO
        // a) asegurarse que el array está siempre ordenado
        // b) lanzar un error si el indice está fuera de rango
        let affiliations = Array(characters.keys)
        let aff = affiliations[atIndex]
        
        return StarWarsAffiliation.nameOfAffiliation(aff)
    }
    
    // el personaje n de la afiliación m
    subscript(idx: Int, inAffiliation aff: StarWarsAffiliation) -> StarWarsCharacter?{
        get{
            if let chars = characters[aff]{
                return chars[idx]
            }
            return nil
        }
    }
}