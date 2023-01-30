//
//  TableViewCell.swift
//  Diary
//
//  Created by 최동호 on 2023/01/26.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "JAN"
        label.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        label.font = .titleBoldFont
        label.textAlignment = .center
        return label
    }()
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "17"
        label.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        label.font = .titleBoldFont
        label.textAlignment = .center
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "♥️"
        label.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        label.font = .titleFont
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        contentView.addSubview(monthLabel)
        contentView.addSubview(dayLabel)
        contentView.addSubview(titleLabel)
        monthLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.width.greaterThanOrEqualTo(70).priority(1000)
        }
        dayLabel.snp.makeConstraints { make in
            make.centerX.equalTo(monthLabel.snp.centerX)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(monthLabel.snp.trailing).offset(30)
            make.trailing.lessThanOrEqualTo(contentView.snp.trailing)
            
        }
    }

}
