//
//  Library.swift
//  IOSVideoGameLibrary
//
//  Created by Zachary Harper on 10/29/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import Foundation

class Library {
    //singleton
    static let sharedInstance = Library()
    
    var games = [Game]()
}
