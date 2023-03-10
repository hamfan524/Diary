//
//  ViewController.swift
//  Diary
//
//  Created by 최동호 on 2023/01/25.
//

import UIKit
import CoreData
class TableViewController: UIViewController {
    static let identifier = "TableViewController"
    lazy var tableView = TableView()
    
    var diaryEntities: [DiaryEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        autoLayout()
        configureUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            let request: NSFetchRequest<DiaryEntity> = DiaryEntity.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            if let dataFromCoreData = try? context.fetch(request) as? [DiaryEntity]{
                diaryEntities = dataFromCoreData
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: UI & Action
extension TableViewController{
    private func autoLayout(){
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(self.view)
        }
        // autoHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    private func configureUI(){
        let appearance = UINavigationBarAppearance()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.title = "Diary"
        navigationItem.backButtonTitle = "Back"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "square.and.pencil"),
            style: .plain,
            target: self,
            action: #selector(openDiaryView)
        )
    }
    // 새 일기장 열기
    @objc private func openDiaryView(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let newDiaryEntity = DiaryEntity(context: context)
            newDiaryEntity.date = .now
            newDiaryEntity.title = "제목"
            newDiaryEntity.content = "내용"
            let diaryViewController = DiaryViewController(DiaryInfo: newDiaryEntity)
            diaryViewController?.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(diaryViewController!, animated: true)
        }
    }
}

// MARK: Extension UITableView
extension TableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell()}

        let diaryEntity = diaryEntities[indexPath.row]
        cell.monthLabel.text = diaryEntity.setMonth()
        cell.dayLabel.text = diaryEntity.setDay()
        cell.titleLabel.text = diaryEntity.title
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDiary = diaryEntities[indexPath.row]
        guard let diaryViewController = DiaryViewController(DiaryInfo: selectedDiary) else { return }
        
        navigationController?.pushViewController(diaryViewController, animated: true)
    }
}

// MARK: SwiftUI Preview
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable
{
    //update
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    //makeUI
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        TableViewController()
    }
}

struct ViewController_Previews: PreviewProvider{
    static var previews: some View{
        ViewControllerRepresentable()
            .ignoresSafeArea()
            .previewDisplayName("iPhone 14 Pro")
    }
}

#endif
