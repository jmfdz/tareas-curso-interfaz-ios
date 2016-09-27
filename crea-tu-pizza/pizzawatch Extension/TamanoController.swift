//
//  TamanoController.swift
//  crea-tu-pizza
//
//  Created by Jose Maria Fernandez on 27/9/16.
//  Copyright © 2016 Jose Maria Fernandez. All rights reserved.
//

import WatchKit
import Foundation

class TamanoController: WKInterfaceController {

    @IBOutlet var tabla: WKInterfaceTable!
    
    let pizza = Pizza2()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        tabla.setNumberOfRows(pizza.tamaños.count, withRowType: "NameRowControllerIdentifier")
        for (index, name) in pizza.tamaños.enumerated() {
            let row = tabla.rowController(at: index) as! NameRowController
            row.nameLabel.setText(name)
        }
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        print(pizza.tamaños[rowIndex])
        pizza.tamañoSeleccionado = rowIndex
        self.pushController(withName: "masaController", context: pizza)        
    }
    
}
