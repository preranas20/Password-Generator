//
//  ViewControllerOne.swift
//  InClass04
//
//  Created by Prerana Singh on 11/2/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//
/*Assignment : InClass04
 Name : Prerana Singh
 FileName: ViewControllerOne.swift
 */

import UIKit

class ViewControllerOne: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var types = ["Weak (Length 5)","Medium (Length 8)","Strong (Length 15)","Extra Strong (Length 25)"]
    var number:Int = 0
    var passwordLength:Int = 0
    var selectedPwd = ""
    var passwordGenerator:PasswordGenerator?
    @IBOutlet var numberPasswords: UITextField!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var passSelected: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        passSelected.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"typesCell", for: indexPath)
        
        let item = types[indexPath.row]
        let label = cell.viewWithTag(100) as! UILabel
        label.text = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedType = indexPath.row
        switch selectedType {
        case 0:
            passwordLength = 5
        case 1:
            passwordLength = 8
        case 2:
            passwordLength = 15
        case 3:
            passwordLength = 25
        default:
            print("no length selected")
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        number = Int(numberPasswords.text!)!
        if segue.identifier == "TypesToPasswords"{
            let passwordsVC = segue.destination as! ViewControllerTwo
            passwordGenerator = PasswordGenerator(num:number, passwordLength: passwordLength)
            passwordsVC.passwordGenerator = passwordGenerator
        }
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "TypesToPasswords" {
            
            if ((numberPasswords.text?.isEmpty)! || ((numberPasswords.text) == "0")) {
                
                let alert = UIAlertController(title: "Error", message: "Field cannot be empty or zero", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
                
                return false
            }else {
                return true
            }
        }
        
        // by default, transition
        return true
    }

    
    
    @IBAction func unwindToContainerVC(segue: UIStoryboardSegue) {
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
