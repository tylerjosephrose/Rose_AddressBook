//
//  ContactList.swift
//  Rose_AddressBook
//
//  Created by Tyler Rose on 3/22/17.
//  Copyright © 2017 Tyler Rose. All rights reserved.
//

import Foundation

class ContactList {
	private var contacts = Array<Contact>()
	
	init() {
		loadContacts()
	}
	
	func loadContacts() {
		let c1 = Contact(fname: "Tyler", lname: "Rose", email: "roset3@mail.uc.edu", phone: 9376380787)
		let c2 = Contact(fname: "George", lname: "Forman", email: "georgeforman@gmail.com", phone: 5135555555)
		contacts.append(c1)
		contacts.append(c2)
	}
	
	func addContacts(contact c: Contact) {
		contacts.append(c)
	}
	
	func countOfContacts() -> Int {
		return contacts.count
	}
	
	func contactAt(index: Int) -> Contact {
		return contacts[index]
	}
	
}
