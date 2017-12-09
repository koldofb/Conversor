//
//  ViewController.swift
//  Conversor de distancias
//
//  Created by Itxaso Manzano on 8/12/17.
//  Copyright © 2017 Luis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtEntrada: UITextField!
    @IBOutlet var lblResultado: UILabel!
    @IBOutlet var lblUnidades: UILabel!
    @IBOutlet var selectOrigen: UISegmentedControl!
    @IBOutlet var selectDestino: UISegmentedControl!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblResultado.text = ""
        lblUnidades.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func boton(_ sender: Any) {
        if txtEntrada.text != ""{
            let valor: Double = Double(txtEntrada.text!)!
        
        
    
            if selectOrigen.selectedSegmentIndex != selectDestino.selectedSegmentIndex{
                //km
                if selectOrigen.selectedSegmentIndex == 0{
                    if selectDestino.selectedSegmentIndex == 1{
                        //millas
                        convertir(caso: 0, origen: valor)
                    }else {
                        //yardas
                        convertir(caso: 1, origen: valor)
                    }
                //millas
                }else if selectOrigen.selectedSegmentIndex == 1{
                    if selectDestino.selectedSegmentIndex == 0{
                        //km
                        convertir(caso: 2, origen: valor)
                    }else {
                        //yardas
                        convertir(caso: 3, origen: valor)
                    }
                    //yardas
                }else {
                    if selectDestino.selectedSegmentIndex == 0{
                        //km
                        convertir(caso: 4, origen: valor)
                    }else {
                        //millas
                        convertir(caso: 5, origen: valor)
                    }
                }
            }else {
                lblResultado.text = "No puedes covetir"
                lblUnidades.text = ""
                }
        }else {
            lblResultado.text = "Debe de introducir un valor"
            lblUnidades.text = ""
        }
    }
    
    func convertir(caso : Int, origen : Double){
        // milla = 1.609 km
        // 1 yarda = 0.000914 km
        // 1 milla = 1.760 yardas
        
        switch caso {
        case 0: //km -> millas
            lblResultado.text = String(format: "%.3f",origen / 1.609)
            lblUnidades.text = "millas"
        case 1: //km -> yardas
            lblResultado.text = String(format: "%.3f",origen / 0.000914)
            lblUnidades.text = "yardas"
        case 2: //millas -> km
            lblResultado.text = String(format: "%.3f",origen * 1.609)
            lblUnidades.text = "km"
        case 3: //millas -> yardas
            lblResultado.text = String(format: "%.3f",origen * 1.760)
            lblUnidades.text = "yardas"
        case 4: //yardas a km
            lblResultado.text = String(format: "%.4f",origen * 0.000914)
            lblUnidades.text = "km"
        case 5: //yardas a millas
            lblResultado.text = String(format: "%.4f",origen * 0,00057)
            lblUnidades.text = "millas"
        default:
            print("fallo")
        }
    }
}


