//
//  ViewController.swift
//  ConversorApp
//
//  Created by Mac Tecsup on 9/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var initialValue: UITextField!
    @IBOutlet weak var fromSegment: UISegmentedControl!
    @IBOutlet weak var toSegment: UISegmentedControl!
    @IBOutlet weak var finalValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func convertir(_ sender: UIButton) {
        
        if (Double(initialValue.text!) != nil) {
            
            let numero : Double = Double(initialValue.text!)!
            var res : Double = 0.0
            
            switch(fromSegment.selectedSegmentIndex){
            case 0:
                res = millConverter(inicial: numero, toSegment: toSegment.selectedSegmentIndex)
                finalValue.text = "\(fixData(valor: numero)) \(getType(index: fromSegment.selectedSegmentIndex)) = \(fixData(valor: res)) \(getType(index: toSegment.selectedSegmentIndex))"
                break;
            case 1:
                res = kmConverter(inicial: numero, toSegment: toSegment.selectedSegmentIndex)
                finalValue.text = "\(fixData(valor: numero)) \(getType(index: fromSegment.selectedSegmentIndex)) = \(fixData(valor: res)) \(getType(index: toSegment.selectedSegmentIndex))"
                break;
            case 2:
                res = yardConverter(inicial: numero, toSegment: toSegment.selectedSegmentIndex)
                finalValue.text = "\(fixData(valor: numero)) \(getType(index: fromSegment.selectedSegmentIndex)) = \(fixData(valor: res)) \(getType(index: toSegment.selectedSegmentIndex))"
                break;
            case 3:
                res = pieConverter(inicial: numero, toSegment: toSegment.selectedSegmentIndex)
                finalValue.text = "\(fixData(valor: numero)) \(getType(index: fromSegment.selectedSegmentIndex)) = \(fixData(valor: res)) \(getType(index: toSegment.selectedSegmentIndex))"
                break;
            default:
                //Do nothing
                break
            }
            
        } else {
            finalValue.text = "Verifica tu valor"
        }
        
    }
    
    func getType(index:Int) -> String {
        var res :String = ""
        switch index {
        case 0:
            res = "Millas"
            break
        case 1:
            res = "Kms"
            break
        case 2:
            res = "Yardas"
            break
        case 3:
            res = "Pies"
            break
        default:
            //Do nothing
            break
        }
        return res
    }

    
    func yardConverter(inicial:Double,toSegment:Int) -> Double {
        var res :Double = 0.0
        switch toSegment {
        //To Millas
        case 0:
            res = yardtomill(valor: inicial)
            break
        //To Kilometros
        case 1:
            res = yardtokm(valor: inicial)
            break
        //To Yardas
        case 2:
            res = inicial
            break
        //To Pies
        case 3:
            res = yardtopie(valor: inicial)
            break
        default:
            //Do nothing
            break
        }
        return res
    }
    
    func kmConverter(inicial:Double,toSegment:Int) -> Double {
        var res :Double = 0.0
        switch toSegment {
        //To Millas
        case 0:
            res = kmtomill(valor: inicial)
            break
        //To Kilometros
        case 1:
            res = inicial
            break
        //To Yardas
        case 2:
            res = kmtoyard(valor: inicial)
            break
        //To Pies
        case 3:
            res = kmtopie(valor: inicial)
            break
        default:
            //Do nothing
            break
        }
        return res
    }
    
    func millConverter(inicial:Double,toSegment:Int) -> Double {
        var res :Double = 0.0
        switch toSegment {
        //To Millas
        case 0:
            res = inicial
            break
        //To Kilometros
        case 1:
            res = milltokm(valor: inicial)
            break
        //To Yardas
        case 2:
            res = milltoyard(valor: inicial)
            break
        //To Pies
        case 3:
            res = milltopie(valor: inicial)
            break
        default:
            //Do nothing
            break
        }
        return res
    }
    
    func pieConverter(inicial:Double,toSegment:Int) -> Double {
        var res :Double = 0.0
        switch toSegment {
        //To Millas
        case 0:
            res = pietomill(valor: inicial)
            break
        //To Kilometros
        case 1:
            res = pietokm(valor: inicial)
            break
        //To Yardas
        case 2:
            res = pietoyard(valor: inicial)
            break
        //To Pies
        case 3:
            res = inicial
            break
        default:
            //Do nothing
            break
        }
        return res
    }
    
    func fixData(valor:Double) -> String {
        return String(format: "%.2f", valor)
    }
    
    func kmtomill(valor:Double) -> Double {
        return valor*0.621371
    }
    
    func kmtoyard(valor:Double) -> Double {
        return valor*1093.61
    }
    
    func kmtopie(valor:Double) -> Double {
        return valor*3280.8
    }
    
    func milltokm(valor:Double) -> Double {
        return valor*1.60934
    }
    
    func milltoyard(valor:Double) -> Double {
        return valor*1760
    }
    
    func milltopie(valor:Double) -> Double {
        return valor*5280.0
    }
    
    func yardtokm(valor:Double) -> Double {
        return valor*0.0009144
    }
    
    func yardtomill(valor:Double) -> Double {
        return valor*0.000568182
    }
    
    func yardtopie(valor:Double) -> Double {
        return valor*3.0000
    }
    
    func pietomill(valor:Double) -> Double {
        return valor*0.000189394
    }
    
    func pietokm(valor:Double) -> Double {
        return valor*0.0003048
    }
    
    func pietoyard(valor:Double) -> Double {
        return valor*0.333333
    }

    
    func setResult(label:UILabel, initialValue:Double, fromValue:Int, toValue:Int, finalValue:Double) {
        label.text = "\(fixData(valor: initialValue)) \(getType(index: fromValue)) = \(fixData(valor: finalValue)) \(getType(index: toValue)))"
    }

}

