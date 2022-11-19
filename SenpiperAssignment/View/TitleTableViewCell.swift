//
//  TitleTableViewCell.swift
//  SenpiperAssignment
//
//  Created by rahul kaushik on 19/11/22.
//

import UIKit
import SDWebImage

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "titleTableViewCell"

    private let titleLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rahul"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let titleImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "photo.circle.fill")
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        if self.traitCollection.userInterfaceStyle == .dark {
//            contentView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00)
//        }
//        else {
//            contentView.backgroundColor = .systemBackground
//        }
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleImage)
        accessoryType = .disclosureIndicator
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = contentView.bounds
        titleImage.frame = contentView.bounds
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleImage.widthAnchor.constraint(equalToConstant: contentView.frame.width*0.35),
            titleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
           
            
            titleLabel.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width*0.6)
            
        ])
    }
    func config(title : String?, desc : String?, imageUrl : String?) {
        titleLabel.text = title ?? "Title Not Available"
        if let url = imageUrl {
            titleImage.sd_setImage(with: URL(string: url))
        }
    }
}
