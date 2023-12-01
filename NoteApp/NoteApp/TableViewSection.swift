//
//  TableViewSection.swift
//  NoteApp
//
//  Created by Bermet Toichubekova on 1/12/23.
//

import Foundation

protocol TableViewItemProtocol {
    
}

struct TableViewSection {
    var title: String?
    var items: [TableViewItemProtocol]
}
