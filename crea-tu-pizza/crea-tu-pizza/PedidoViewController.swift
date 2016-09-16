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
        
        tamaño.text = pizza!.tamaños[ pizza!.tamañoSeleccionado! ]
        masa.text = pizza!.masas[ pizza!.masaSeleccionada! ]
        queso.text = pizza!.quesos[ pizza!.quesoSeleccionado! ]
        
        var ings = ""
        for value in pizza!.ingredientesSeleccionados {
            ings += " " + pizza!.ingredientes[value]
        }
        
        ingredientes.text = ings
        
        
        // Do any additional setup after loading the view.
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

    @IBAction func realizarPedido(sender: AnyObject) {
    
        
        let alert = UIAlertController(title: "Pedido realizado", message: "¡El pedido se ha enviado correctamente a la cocina!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
}
