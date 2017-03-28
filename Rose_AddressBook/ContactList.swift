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
	
	var sortByLast = true
	
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
		sortLast()
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
	
	func insertSorted(contact c: Contact) {
		var index = contacts.count - 1
		if (sortByLast == true) {
			for i in 0...contacts.count - 1 {
				if (sortLastInternal(c1: c, c2: contacts[i])){
					index = i
					break
				}
			}
			contacts.insert(c, at: index)
		} else {
			for i in 0...contacts.count - 1 {
				if (sortFirstInternal(c1: c, c2: contacts[i])){
					index = i
					break
				}
			}
			contacts.insert(c, at: index)
		}
	}
	
	func addContacts(contact c: Contact) {
		insertSorted(contact: c)
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
	
	func deleteContact(at index: Int) {
		contacts.remove(at: index)
		saveContacts()
	}
	
	func sortFirst() {
		contacts.sort(by: sortFirstInternal(c1:c2:))
	}
	
	private func sortFirstInternal(c1: Contact, c2: Contact) -> Bool {
		if c1.firstName == c2.firstName {
			return c1.lastName < c2.lastName
		} else {
			return c1.firstName < c2.firstName
		}
	}
	
	func sortLast() {
		contacts.sort(by: sortLastInternal(c1:c2:))
	}
	
	private func sortLastInternal(c1: Contact, c2: Contact) -> Bool {
		if c1.lastName == c2.lastName {
			return c1.firstName < c2.firstName
		} else {
			return c1.lastName < c2.lastName
		}
	}
	
}
