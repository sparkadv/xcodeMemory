//
//  ViewController.swift
//  Xcode-Memory
//
//  Created by Kuzey on 16.05.2018.
//  Copyright © 2018 Kuzey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var isimLabel: UILabel!
    @IBOutlet weak var tarihLabel: UILabel!
    @IBOutlet weak var alertLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        alertLabel.text = ""
        let kayitliisim = UserDefaults.standard.object(forKey: "saklananisim")
        let kayitlitarih = UserDefaults.standard.object(forKey: "saklanantarih")
        
        if let yeniisim = kayitliisim as? String {
            isimLabel.text = "İsim : \(yeniisim)"
        }
        if let yenitarih = kayitlitarih as? String {
            tarihLabel.text = "Doğum Günü : \(yenitarih)"
        }
    }

    @IBAction func saveButton(_ sender: Any) {
    
        if textField1.text == "" || textField2.text == ""  { alertLabel.text = "Lütfen Bilgi Giriniz!"
            
        }
        else {
            isimLabel.text = "İsim : \(textField1.text!)"
            tarihLabel.text = "Doğum Günü : \(textField2.text!)"
            UserDefaults.standard.set (textField1.text!, forKey: "saklananisim")
            UserDefaults.standard.set (textField2.text!, forKey: "saklanantarih")
            UserDefaults.standard.synchronize()
            alertLabel.text = ""
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
        let kayitliisim = UserDefaults.standard.object(forKey: "saklananisim")
        let kayitlitarih = UserDefaults.standard.object(forKey: "saklanantarih")
        
        if (kayitliisim as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "saklananisim")
            UserDefaults.standard.synchronize()
            isimLabel.text = "İsim :"
        }
        if (kayitlitarih as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "saklanantarih")
            UserDefaults.standard.synchronize()
            tarihLabel.text = "Doğum Günü :"
            alertLabel.text = ""
        }
    }
}

