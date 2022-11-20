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
    
    private let indicator : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .heavy))
        imageView.tintColor = .gray
        
        return imageView
    }()
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateColors()
    }
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        updateColors()
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleImage)
        contentView.addSubview(indicator)
        titleLabel.font = UIFont.boldSystemFont(ofSize: contentView.frame.height*0.30)
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = contentView.bounds
        titleImage.frame = contentView.bounds
        indicator.frame = contentView.bounds
    }
    
    private func updateColors(){
        if self.traitCollection.userInterfaceStyle == .dark {
            contentView.backgroundColor = .systemGray6
        }
        else {
            contentView.backgroundColor = .white
        }
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleImage.widthAnchor.constraint(equalToConstant: contentView.frame.width*0.35),
            titleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
           
            
            titleLabel.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width*0.6),
            
            indicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            indicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }
    func config(title : String?, desc : String?, imageUrl : String?) {
        titleLabel.text = title ?? "Title Not Available"
        if let url = imageUrl {
            titleImage.sd_setImage(with: URL(string: url))
        }
    }
}
