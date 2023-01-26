//
//  ViewController.swift
//  Diary
//
//  Created by 최동호 on 2023/01/25.
//

import UIKit

class TableViewController: UIViewController {
    static let identifier = "TableViewController"
    lazy var tableView = TableView()
    
    var diaryEntries: [DiaryEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        autoLayout()
        configureUI()
        
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
    // 화면 전환
    @objc private func openDiaryView(){
        let diaryViewController = DiaryViewController()
        diaryViewController.tableViewController = self
        diaryViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(diaryViewController, animated: true)
    }
    
}

// MARK: Extension UITableView
extension TableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell()}

        let diaryEntry = diaryEntries[indexPath.row]
        cell.titleLabel.text = diaryEntry.title
        return cell
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

