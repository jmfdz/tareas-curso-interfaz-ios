//
//  MasaController.swift
//  crea-tu-pizza
//
//  Created by Jose Maria Fernandez on 28/9/16.
//  Copyright © 2016 Jose Maria Fernandez. All rights reserved.
//

import WatchKit
import Foundation


class MasaController: WKInterfaceController {
    @IBOutlet var tabla: WKInterfaceTable!

    var pizza : Pizza2?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        pizza = context as! Pizza2
        
        // Configure interface objects here.
        tabla.setNumberOfRows(pizza!.masas.count, withRowType: "NameRowControllerIdentifier")
        for (index, name) in pizza!.masas.enumerated() {
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
        pizza!.masaSeleccionada = rowIndex
        self.pushController(withName: "quesoController", context: pizza)
    }
}
