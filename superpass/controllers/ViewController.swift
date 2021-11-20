//
//  ViewController.swift
//  superpass
//
//  Created by Anderson Mendes de Almeida on 20/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var swCaptitalLetters: UISwitch!
    @IBOutlet weak var btnGeraSenha: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        verifySwitches()
    }
    
    func verifySwitches() {
        if !swNumbers.isOn, !swLetters.isOn, !swCaptitalLetters.isOn, !swSpecialCharacters.isOn {
            print("all disabled")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PasswordViewController
               
                if let numberOfPasswords = Int(tfTotalPasswords.text!) {
                    vc.numberOfPasswords = numberOfPasswords
                }
                if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
                    vc.numberOfCharacters = numberOfCharacters
                }
                vc.useNumbers = swNumbers.isOn
                vc.useCapitalLetters = swCaptitalLetters.isOn
                vc.useLetters = swLetters.isOn
                vc.useSpecialCharacters = swSpecialCharacters.isOn
        
        view.endEditing(true)
    }
}

