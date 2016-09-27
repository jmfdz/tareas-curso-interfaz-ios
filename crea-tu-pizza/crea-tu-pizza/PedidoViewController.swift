//
//  PedidoViewController.swift
//  crea-tu-pizza
//
//  Created by Jose Maria Fernandez on 16/9/16.
//  Copyright © 2016 Jose Maria Fernandez. All rights reserved.
//

import UIKit

class PedidoViewController: UIViewController {

    var pizza : Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tam = pizza!.tamañoSeleccionado {
            tamaño.text = pizza!.tamaños[ tam ]
        }else {
            tamaño.text = "Sin tamaño"
        }
        
        if let mas = pizza!.masaSeleccionada {
            masa.text = pizza!.masas[ mas ]
        }else{
            masa.text = "Sin masa"
        }
        
        if let que = pizza!.quesoSeleccionado {
            queso.text = pizza!.quesos[ que ]
        }else {
            queso.text = "Sin queso"
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
        
        ingredientes.text = ings
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var tamaño: UILabel!
    
    @IBOutlet weak var masa: UILabel!
    @IBOutlet weak var ingredientes: UILabel!
    
    @IBOutlet weak var queso: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func realizarPedido(_ sender: AnyObject) {
    
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
        
            let alert = UIAlertController(title: "Pedido realizado", message: "¡El pedido se ha enviado correctamente a la cocina!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style:  UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else {
        
            let alert = UIAlertController(title: "Pedido incompleto", message: "Es necesario seleccionar tamaño, masa, tipo de queso e ingredientes de 1 a 5. Vuelve atrás e completa tu pedido.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style:  UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
}
