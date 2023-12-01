//
//  ImageNoteTableViewCell.swift
//  NoteApp
//
//  Created by Bermet Toichubekova on 28/11/23.
//

import UIKit
import SnapKit

final class ImageNoteTableViewCell: UITableViewCell {
    // MARK: - GUI Variables
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGreen
        view.layer.cornerRadius = 10
        
        return view
       }()
    
    private let attchmentView : UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "mockImage")
        return view
       }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title label text"
        label.font = .boldSystemFont(ofSize: 18)
        
        return label
       }()
    
    //MARK: - Initializations
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    
    func set(note: Note) {
        titleLabel.text = note.title
        guard let imageData = note.image,
              let image = UIImage(data: imageData) else { return }
        attchmentView.image = image
    }
    
    //MARK: - Private methods
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(attchmentView)
        containerView.addSubview(titleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        attchmentView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(5)
            make.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(attchmentView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}
