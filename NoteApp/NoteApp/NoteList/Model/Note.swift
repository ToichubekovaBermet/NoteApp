//
//  Note.swift
//  NoteApp
//
//  Created by Bermet Toichubekova on 1/12/23.
//

import Foundation

struct Note: TableViewItemProtocol {
    let title: String
    let descreption: String
    let date: Date
    let imageUrl : String?
    let image: Data?
}
