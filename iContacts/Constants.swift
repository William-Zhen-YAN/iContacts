//
//  Constants.swift
//  iContacts
//
//  Created by Zhen YAN on 2020/06/22.
//  Copyright © 2020 Zhen YAN. All rights reserved.
//

import Foundation

struct K {

    static let cellIdentifier = "ContactsItemCell"
    static let defaultKey = "IContactsArray"

    struct Alert {
        static let title = "Add New Contact"
        static let button = "confirm"
        static let addName = "Add Name"
        static let addPhoneNumber = "Add Phone Number"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
