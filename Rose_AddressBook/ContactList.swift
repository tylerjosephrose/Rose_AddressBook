//
//  ContactList.swift
//  Rose_AddressBook
//
//  Created by Tyler Rose on 3/22/17.
//  Copyright © 2017 Tyler Rose. All rights reserved.
//

import Foundation

class ContactList: NSObject {
	private var contacts = Array<Contact>()
	private static var contactList: ContactList?
	
	private override init() {
		super.init()
		
		loadContacts()
	}
	
	private func loadContacts() {
		let fileURL = getFileURL()
		if (FileManager.default.fileExists(atPath: fileURL.path)) {
			// Load Contents
			contacts = NSKeyedUnarchiver.unarchiveObject(withFile: fileURL.path) as! Array<Contact>
		} else {
			// Create file with sample contacts
			let c1 = Contact(fname: "Tyler", lname: "Rose", email: "roset3@mail.uc.edu", phone: "9376380787")
			let c2 = Contact(fname: "George", lname: "Forman", email: "georgeforman@gmail.com", phone: "5135555555")
			contacts.append(c1)
			contacts.append(c2)
			saveContacts()
		}
	}
	
	private func getFileURL() -> URL {
		let dir = try! FileManager.default.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: true)
		let fileURL = dir.appendingPathComponent("ContactList.data")
		return fileURL
	}
	
	private func saveContacts() {
		let fileURL = getFileURL()
		NSKeyedArchiver.archiveRootObject(contacts, toFile: fileURL.path)
	}
	
	func addContacts(contact c: Contact) {
		contacts.append(c)
		saveContacts()
	}
	
	func countOfContacts() -> Int {
		return contacts.count
	}
	
	func contactAt(index: Int) -> Contact {
		return contacts[index]
	}
	
	static func getInstance() -> ContactList {
		if contactList == nil {
			contactList = ContactList()
		}
		return contactList!
	}
	
}
