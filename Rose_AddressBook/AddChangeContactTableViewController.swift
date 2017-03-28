//
//  AddTableViewController.swift
//  Rose_AddressBook
//
//  Created by Tyler Rose on 3/28/17.
//  Copyright © 2017 Tyler Rose. All rights reserved.
//

import UIKit

class AddChangeContactTableViewController: UITableViewController {
	
	@IBOutlet weak var fNameTxt: UITextField!
	@IBOutlet weak var lNameTxt: UITextField!
	@IBOutlet weak var eAddressTxt: UITextField!
	@IBOutlet weak var pNumberTxt: UITextField!
	
	var isOnEdit = false
	var indexOfContactEdited: Int?
	
	var contact: Contact!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
		if (isOnEdit == true) {
			fNameTxt.text = contact.firstName
			lNameTxt.text = contact.lastName
			eAddressTxt.text = contact.emailAddress
			pNumberTxt.text = contact.phoneNumber
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "SaveSegue") {
			if (contact == nil) {
				contact = Contact(fname: fNameTxt.text!, lname: lNameTxt.text!)
			} else {
				contact.firstName = fNameTxt.text!
				contact.lastName = lNameTxt.text!
			}
			if (eAddressTxt.text != nil) {
				contact.change(email: eAddressTxt.text!)
			}
			if (pNumberTxt.text != nil) {
				//let number = pNumberTxt.text!.trimmingCharacters(in: CharacterSet(charactersIn: "01234567890").inverted)
				let charSet = CharacterSet(charactersIn: "0123456789")
				var number = String()
				for char in pNumberTxt.text!.characters {
					if !charSet.isDisjoint(with: CharacterSet(charactersIn: String(char))) {
						number.append(char)
					}
				}
				contact.change(phone: number)
			}
		}
	}
	

}
