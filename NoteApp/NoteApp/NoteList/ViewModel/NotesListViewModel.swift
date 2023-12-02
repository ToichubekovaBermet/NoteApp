//
//  NotesListViewModel.swift
//  NoteApp
//
//  Created by Bermet Toichubekova on 1/12/23.
//

import Foundation

protocol NotesListViewModelProtocol {
    var section: [TableViewSection] { get }
}

final class NotesListViewModel: NotesListViewModelProtocol {
    
    private(set) var section: [TableViewSection] = []
    
    init() {
        getNotes()
        setMock()
    }
    
    private func getNotes() {
        
    }
    
    private func setMock() {
        let section = TableViewSection(title: "1 Dec 2023",
                                       items: [ 
                                        Note(title: "First note",
                                                     description: "First note description",
                                                     date: Date(),
                                                     imageUrl: nil,
                                                     image: nil),
                                        Note(title: "First note",
                                                     description: "First note description",
                                                     date: Date(),
                                                     imageUrl: nil,
                                                     image: nil)
                                       ])
        self.section = [section]
    }
}
