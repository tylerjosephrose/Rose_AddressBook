//
//  ContactTableViewController.swift
//  Rose_AddressBook
//
//  Created by Tyler Rose on 3/22/17.
//  Copyright © 2017 Tyler Rose. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {
	
	let contactList = ContactList.getInstance()

	@IBAction func changeSortOrder(_ sender: UIBarButtonItem) {
		if (contactList.sortByLast == true) {
			contactList.sortFirst()
			sender.title = "Sort By First"
			contactList.sortByLast = false
			tableView.reloadData()
		} else {
			contactList.sortLast()
			sender.title = "Sort By Last"
			contactList.sortByLast = true
			tableView.reloadData()
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactList.countOfContacts()
    }
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			contactList.deleteContact(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
		
		let contact = contactList.contactAt(index: indexPath.row)
		
		cell.textLabel?.text = contact.lastName + ", " + contact.firstName

        return cell
    }

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "DetailsSegue" {
			let selectedContact = contactList.contactAt(index: (tableView.indexPathForSelectedRow?.row)!)
			let destination = segue.destination as! DetailTableViewController
			destination.contact = selectedContact
		}
	}
	
	@IBAction func cancel(segue: UIStoryboardSegue) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func save(segue: UIStoryboardSegue) {
		let source = segue.source as! AddTableViewController
		let newContact = source.contact
		contactList.addContacts(contact: newContact!)
		tableView.reloadData()
		dismiss(animated: true, completion: nil)
	}

}
