//
//  DetailTableViewController.swift
//  Rose_AddressBook
//
//  Created by Tyler Rose on 3/28/17.
//  Copyright © 2017 Tyler Rose. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
	
	@IBOutlet weak var fNameLbl: UILabel!
	@IBOutlet weak var lNameLbl: UILabel!
	@IBOutlet weak var emailAdressLbl: UILabel!
	@IBOutlet weak var phoneNumberLbl: UILabel!
	
	var contact: Contact!

    override func viewDidLoad() {
        super.viewDidLoad()

		//contact = Contact(fname: "Tyler", lname: "Rose", email: "roset3@mail.uc.edu", phone: "9376380787")
		
        fNameLbl.text = contact.firstName
		lNameLbl.text = contact.lastName
		emailAdressLbl.text = contact.emailAddress
		let phoneNumber = phoneNumberToString()
		phoneNumberLbl.text = phoneNumber
    }
	
	private func phoneNumberToString() -> String {
		// if number is a 10 digit number
		if contact.phoneNumber.characters.count == 10 {
			var phone = "("
			var i = 0
			for char in contact.phoneNumber.characters {
				if i == 3 {
					phone.append(") ")
					phone.append(char)
				} else if i == 6 {
					phone.append(" - ")
					phone.append(char)
				} else {
					phone.append(char)
				}
				i += 1
			}
			return phone
		} else {
			return String(contact.phoneNumber)
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	
}
