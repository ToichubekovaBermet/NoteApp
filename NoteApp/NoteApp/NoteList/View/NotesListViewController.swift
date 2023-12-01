//
//  NotesListViewController.swift
//  NoteApp
//
//  Created by Bermet Toichubekova on 28/11/23.
//

import UIKit

class NotesListViewController: UITableViewController {
    
    //MARK: - Properties
    var viewModel: NotesListViewModelProtocol?
    
    //MARK: -Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
        setupToolsBar()
    }

    //MARK: - Private methods
    private func setupTableView() {
        tableView.register(SimpleNoteTableViewCell.self, forCellReuseIdentifier: "SimpleNoteTableViewCell")
        tableView.register(ImageNoteTableViewCell.self, forCellReuseIdentifier: "ImageNoteTableViewCell")
        tableView.separatorStyle = .none
    }

    private func setupToolsBar() {
        let addButton = UIBarButtonItem(title: "Add Note",
                                        style: .done,
                                        target: self,
                                        action: #selector(addAction))
        let spacing = UIBarButtonItem(systemItem: .flexibleSpace)
        setToolbarItems([spacing, addButton], animated: true)
        navigationController?.isToolbarHidden = false
    }
    
    @objc
    private func addAction () {
        
    }
    
}

//MARK: - UITableViewDataSource
extension NotesListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.section.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.section[section].items.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let note = viewModel?.section[indexPath.section].items[indexPath.row] as? Note else { return UITableViewCell() }
        if indexPath.row == 0,
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleNoteTableViewCell",
                                                     for: indexPath) as? SimpleNoteTableViewCell {
            cell.set(note: note)
            return cell
        } else if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNoteTableViewCell",
                                                           for: indexPath) as? ImageNoteTableViewCell {
            cell.set(note: note)
            return cell
        }
        return UITableViewCell()
    }
}

//MARK: - UITableViewDelegate
extension NotesListViewController {
    
}
