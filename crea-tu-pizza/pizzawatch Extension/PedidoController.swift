//
//  PedidoController.swift
//  crea-tu-pizza
//
//  Created by Jose Maria Fernandez on 28/9/16.
//  Copyright © 2016 Jose Maria Fernandez. All rights reserved.
//

import WatchKit
import Foundation


class PedidoController: WKInterfaceController {
    @IBOutlet var ingredientes: WKInterfaceLabel!
    @IBOutlet var queso: WKInterfaceLabel!
    @IBOutlet var masa: WKInterfaceLabel!
    @IBAction func pedir() {
    
        var enviar = true
        
        if pizza!.tamañoSeleccionado == nil {
            enviar = false
        }
        if pizza!.masaSeleccionada == nil {
            enviar = false
        }
        if pizza!.quesoSeleccionado == nil {
            enviar = false
        }
        
        if pizza!.ingredientesSeleccionados.count < 1 || pizza!.ingredientesSeleccionados.count > 5 {
            enviar = false
        }
        
        if enviar {
            
            let action1 = WKAlertAction(title: "Aceptar", style: .default, handler:{})
            
            presentAlert(withTitle: "Info", message: "Pedido enviado a la cocina con éxito.", preferredStyle: .actionSheet, actions: [action1])
            

        }else {
            let action1 = WKAlertAction(title: "Aceptar", style: .default, handler:{})
            
            presentAlert(withTitle: "Error", message: "Te falta algún paso, vuelve atrás para completar el pedido.", preferredStyle: .actionSheet, actions: [action1])
            

            
        }
        
    }
    @IBOutlet var tamaño: WKInterfaceLabel!
    
    var pizza : Pizza2?
    
    override func awake(withContext context: Any?) {
        
        pizza = context as! Pizza2
        
        if let tam = pizza!.tamañoSeleccionado {
            tamaño.setText(pizza!.tamaños[ tam ])
        }else {
            tamaño.setText("Sin tamaño")
        }
        
        if let mas = pizza!.masaSeleccionada {
            masa.setText(pizza!.masas[ mas ])
        }else{
            masa.setText("Sin masa")
        }
        
        if let que = pizza!.quesoSeleccionado {
            queso.setText(pizza!.quesos[ que ])
        }else {
            queso.setText("Sin queso")
        }
        
        var ings = "Sin ingredientes"
        var i = 0
        for value in pizza!.ingredientesSeleccionados {
            if i == 0 {
                ings = pizza!.ingredientes[value]
            } else {
                ings += ", " + pizza!.ingredientes[value]
            }
            i += 1
        }
        
        ingredientes.setText(ings)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
