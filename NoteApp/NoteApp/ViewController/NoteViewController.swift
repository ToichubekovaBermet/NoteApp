//
//  NoteViewController.swift
//  NoteApp
//
//  Created by Bermet Toichubekova on 1/12/23.
//

import UIKit

final class NoteViewController: UIViewController {
    // MARK: - GUI Variables
    
    private let attachmentView : UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "mockImage")
        return view
    }()
    
    private let textView: UITextView = {
        let view = UITextView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.delegate = self
        return view
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    // MARK: - Methods
    
    func set(note: Note) {
        textView.text = note.title + " " + note.description
        guard let imageData = note.image,
              let image = UIImage(data: imageData) else { return }
        attachmentView.image = image
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.addSubview(attachmentView)
        view.addSubview(textView)
        setupConstraints()
        setImageHeight()
        
        
    }
    
    private func setupConstraints() {
        attachmentView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        textView.snp.makeConstraints { make in
            make.top.equalTo(attachmentView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.keyboardLayoutGuide.snp.top).inset(-10)
        }
    }
    
    private func setImageHeight() {
        let height = attachmentView.image != nil ? 200 : 0
            attachmentView.snp.makeConstraints { make in
                make.height.equalTo(200)
            }
    }
}

extension NoteViewController: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
          // Вызовите becomeFirstResponder() для вызова клавиатуры
          textView.becomeFirstResponder()
          return true
      }
}
