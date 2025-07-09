//
//  ListCellTableViewCell.swift
//  gymList
//
//  Created by David Puksanskis on 08/07/2025.
//

import UIKit

class ListCell: UITableViewCell {

    
    var listImageView = UIImageView()
    var listLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(listImageView)
        addSubview(listLabel)
        
        configView()
        configTitle()
        setImageConstraints()
        setTitleConstraints()
    }
    func set(image: Exercise) {
        
        listImageView.image = UIImage(named: image.muscleGroup)
        
        listLabel.text = image.muscleGroup
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        
        listImageView.layer.cornerRadius = 40
        listLabel.clipsToBounds = true
        
    }
    func configTitle() {
        
        listLabel.numberOfLines = 0
        listLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    func setImageConstraints() {
        
        listImageView.translatesAutoresizingMaskIntoConstraints = false
        listImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        listImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive  = true
        listImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        listImageView.widthAnchor.constraint(equalTo: listImageView.heightAnchor).isActive = true
    }
    
    
    func setTitleConstraints() {
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        listLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        listLabel.leadingAnchor.constraint(equalTo: listImageView.trailingAnchor, constant: 20).isActive = true
        listLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        listLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    
}
