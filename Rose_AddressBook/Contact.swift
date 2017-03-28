//
//  Contact.swift
//  Rose_AddressBook
//
//  Created by Tyler Rose on 3/22/17.
//  Copyright © 2017 Tyler Rose. All rights reserved.
//

import Foundation

class Contact: NSObject, NSCoding {
	var firstName: String!
	var lastName: String!
	var emailAddress: String!
	var phoneNumber: String!
	
	init(fname: String, lname: String) {
		firstName = fname
		lastName = lname
		
		super.init()
	}
	
	init(fname: String, lname: String, email: String, phone: String) {
		firstName = fname
		lastName = lname
		emailAddress = email
		phoneNumber = phone
		
		super.init()
	}
	
	func change(fname: String) {
		firstName = fname
	}
	
	func change(lname: String) {
		lastName = lname
	}
	
	func change(email: String) {
		emailAddress = email
	}
	
	func change(phone: String) {
		phoneNumber = phone
	}
	
	// Encoding/Decoding
	func encode(with aCoder: NSCoder) {
		aCoder.encode(firstName, forKey: "FirstName")
		aCoder.encode(lastName, forKey: "LastName")
		aCoder.encode(emailAddress, forKey: "EmailAddress")
		aCoder.encode(phoneNumber, forKey: "PhoneNumber")
	}
	
	required init?(coder aDecoder: NSCoder) {
		firstName = aDecoder.decodeObject(forKey: "FirstName") as! String
		lastName = aDecoder.decodeObject(forKey: "LastName") as! String
		emailAddress = aDecoder.decodeObject(forKey: "EmailAddress") as! String
		phoneNumber = aDecoder.decodeObject(forKey: "PhoneNumber") as! String
	}
}
