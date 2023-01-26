//
//  DiaryViewController.swift
//  Diary
//
//  Created by 최동호 on 2023/01/26.
//

import Foundation
import UIKit

class DiaryViewController: UIViewController{
    
    private lazy var diaryView = DiaryView()
    static let identifier = "DiaryViewController"
    var tableViewController: TableViewController?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
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
    }
    
    private func configureUI(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "trash"),
            style: .plain,
            target: self,
            action: nil
        )
    }
}

// MARK: Send Data
extension DiaryViewController{
    override func viewWillDisappear(_ animated: Bool) {
        //Make Entry
        var diaryEntry = DiaryEntry()
        diaryEntry.date = diaryView.datePicker.date
        diaryEntry.title = diaryView.titleTextView.text
        diaryEntry.content = diaryView.contentTextView.text
        
        //Add entry tableview array
        tableViewController?.diaryEntries.append(diaryEntry)
        tableViewController?.tableView.reloadData()
        
    }
}
