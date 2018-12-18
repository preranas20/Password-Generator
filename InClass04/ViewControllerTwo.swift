//
//  ViewControllerTwo.swift
//  InClass04
//
//  Created by Prerana Singh on 11/2/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//
/*Assignment : InClass04
 Name : Prerana Singh
 FileName: ViewControllerTwo.swift
*/
import UIKit
//
class ViewControllerTwo: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var num:Int!
    var passLength:Int!
    var selectedPassword = "prrrrr"
    var passwordToSend = ""
    var passwordGenerator:PasswordGenerator?
    var passwords = [String]()
    var passwordsGenerated = [String]()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        num = passwordGenerator?.num
        passLength = passwordGenerator?.passwordLength
        
        createPassword()
        tableView.tableFooterView = UIView()
       // print(passwords)
        // Do any additional setup after loading the view.
    }
    
    
    func createPassword(){
        
        DispatchQueue.global(qos: .background).async {
            var i = 0
            
            while (i < self.num) {
                let pass = AppsData.getPassword(len: self.passLength)
               // print(pass)
                self.passwords.append(pass)
                i = i+1
            }
            
            DispatchQueue.main.async {
                print("This is run on the main queue, after the previous code in outer block")
              //  print(self.passwords)
                self.passwordsGenerated = self.passwords
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passwords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"PasswordsCell", for: indexPath)
        
        let item = passwordsGenerated[indexPath.row]
        let label = cell.viewWithTag(200) as! UILabel
        label.text = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPassword = passwordsGenerated[indexPath.row]
       // print(passwordsGenerated.count)
        performSegue(withIdentifier: "backtoMain", sender: self)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backtoMain"{
            let unwindPwd = segue.destination as! ViewControllerOne
            unwindPwd.passSelected.isHidden = false
            unwindPwd.passSelected.text = selectedPassword
            
        }
    }


}
