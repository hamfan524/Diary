//
//  DiaryViewController.swift
//  Diary
//
//  Created by 최동호 on 2023/01/26.
//

import Foundation
import UIKit

class DiaryViewController: UIViewController{
    
    private lazy var diaryView = DiaryView(DiaryInfo: diaryEntity!)
    static let identifier = "DiaryViewController"
    
    var diaryEntity: DiaryEntity?
    
    required init?(DiaryInfo: DiaryEntity) {
        self.diaryEntity = DiaryInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = diaryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setData()
       
    }
   
}
// MARK: UI & Action

extension DiaryViewController{
    private func configureUI(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "trash"),
            style: .plain,
            target: self,
            action: #selector(onDelete)
        )
    }
    @objc private func onDelete(){
        if diaryEntity != nil{
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                context.delete(diaryEntity!)
                try? context.save()
            }
            navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: About Data
extension DiaryViewController: UITextViewDelegate{
    override func viewWillDisappear(_ animated: Bool) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    func setData(){
        if diaryEntity == nil {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                diaryEntity = DiaryEntity(context: context)
                diaryEntity?.date = diaryView.datePicker.date
                diaryEntity?.title = diaryView.titleTextView.text
                diaryEntity?.content = diaryView.contentTextView.text
            }
        }
        diaryView.titleTextView.text = diaryEntity?.title
        diaryView.contentTextView.text = diaryEntity?.content
        
        if let dateToBeDisplayed = diaryEntity?.date{
            diaryView.datePicker.date = dateToBeDisplayed
        }
        diaryView.datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
        diaryView.titleTextView.delegate = self
        diaryView.contentTextView.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        diaryEntity?.title = diaryView.titleTextView.text
        diaryEntity?.content = diaryView.contentTextView.text
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    // MARK: - Selectors
     @objc
     private func handleDatePicker(_ sender: UIDatePicker) {
         diaryEntity?.date = diaryView.datePicker.date
         (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
     }
  
}
