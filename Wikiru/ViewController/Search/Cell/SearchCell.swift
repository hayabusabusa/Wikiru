//
//  SearchCell.swift
//  Wikiru
//
//  Created by Yamada Shunya on 2020/01/10.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var wordcountLabel: UILabel!
    @IBOutlet private weak var timestampLabel: UILabel!
    
    // MARK: Properties
    
    static let reuseIdentifier = "SearchCell"
    static let rowHeight: CGFloat = 64
    static var nib: UINib {
        return UINib(nibName: "SearchCell", bundle: nil)
    }
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Setup
    
    func setupCell(title: String?, wordCount: Int, readTime: Int, timestamp: String?) {
        titleLabel.text = title ?? "- タイトルなし -"
        wordcountLabel.text = "\(wordCount)文字(\(readTime)分)"
        timestampLabel.text = "最終更新: \(timestamp ?? "-")"
    }
}
