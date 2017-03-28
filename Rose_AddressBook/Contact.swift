//
//  Contact.swift
//  Rose_AddressBook
//
//  Created by Tyler Rose on 3/22/17.
//  Copyright © 2017 Tyler Rose. All rights reserved.
//

import Foundation

class Contact {
	var firstName: String!
	var lastName: String!
	var emailAddress: String!
	var phoneNumber: String!
	
	init(fname: String, lname: String) {
		firstName = fname
		lastName = lname
	}
	
	init(fname: String, lname: String, email: String, phone: String) {
		firstName = fname
		lastName = lname
		emailAddress = email
		phoneNumber = phone
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
}
