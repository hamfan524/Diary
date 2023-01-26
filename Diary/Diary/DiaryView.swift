//
//  DiaryView.swift
//  Diary
//
//  Created by 최동호 on 2023/01/26.
//

import Foundation
import UIKit
import SnapKit

class DiaryView: UIView{
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
        return datePicker
    }()

    lazy var titleTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = .boldSystemFont(ofSize: 30)
        textView.text = "제목"
        textView.textAlignment = .left
        return textView
    }()
    
    lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 20)
        textView.text = "본문"
        textView.textAlignment = .left
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayout()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func autoLayout(){
        self.backgroundColor = .white
        let safeArea = self.safeAreaLayoutGuide
        
        addSubview(datePicker)
        addSubview(titleTextView)
        addSubview(contentTextView)
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(25)
            make.centerX.equalTo(safeArea.snp.centerX)
        }
        
        titleTextView.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(20)
            make.leading.equalTo(safeArea.snp.leading).offset(25)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-25)
            make.height.equalTo(50)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(titleTextView.snp.bottom).offset(20)
            make.leading.equalTo(safeArea.snp.leading).offset(25)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-25)
            make.bottom.equalTo(safeArea.snp.bottom).offset(-25)
        }
    }
    
    // MARK: - Selectors
     @objc
     private func handleDatePicker(_ sender: UIDatePicker) {
         print(sender.date)
     }
  
}
