//
//  FoundationExtensions.swift
//  StarWarsVII
//
//  Created by Ramiro García Salazar on 21/11/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import Foundation

extension NSBundle{
    func URLForResource(fileName: String) -> NSURL? {
        
        //TODO: gestionar errores cuando no venga nombre.extensión
        let tokens = fileName.componentsSeparatedByString(".")
        
        return self.URLForResource(tokens.first, withExtension: tokens.last)
    }
}