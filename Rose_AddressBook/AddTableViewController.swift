//
//  AddTableViewController.swift
//  Rose_AddressBook
//
//  Created by Tyler Rose on 3/28/17.
//  Copyright © 2017 Tyler Rose. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController {
	
	@IBOutlet weak var fNameTxt: UITextField!
	@IBOutlet weak var lNameTxt: UITextField!
	@IBOutlet weak var eAddressTxt: UITextField!
	@IBOutlet weak var pNumberTxt: UITextField!
	
	var contact: Contact!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "SaveSegue") {
			contact = Contact(fname: fNameTxt.text!, lname: lNameTxt.text!)
			if (eAddressTxt.text != nil) {
				contact.change(email: eAddressTxt.text!)
			}
			if (pNumberTxt.text != nil) {
				contact.change(phone: pNumberTxt.text!)
			}
		}
	}

}
