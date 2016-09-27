//
//  Pizza2.swift
//  crea-tu-pizza
//
//  Created by Jose Maria Fernandez on 27/9/16.
//  Copyright © 2016 Jose Maria Fernandez. All rights reserved.
//

import WatchKit

class Pizza2: NSObject {
    
    let tamaños = ["Pequeña","Mediana","Familiar"]
    let masas = ["Fina","Crujiente","Gruesa"]
    let quesos = ["Mozzarela","Cheddar","Parmesano","Sin queso"]
    let ingredientes = ["Jamón","Pepperoni","pavo","salchicha","Aceituna","Cebolla","Pimiento","Piña","Anchoas"]
    
    var tamañoSeleccionado : Int? = nil;
    var masaSeleccionada : Int? = nil;
    var quesoSeleccionado : Int? = nil;
    var ingredientesSeleccionados : [Int] = []
    
}
