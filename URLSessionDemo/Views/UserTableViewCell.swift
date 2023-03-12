//
//  UserTableViewCell.swift
//  URLSessionDemo
//
//  Created by aleksandranavruzova on 08.03.2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {
  @IBOutlet var avatarView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    avatarView.clipsToBounds = true
  }
  
  func configure(with user: User) {
    nameLabel.text = "\(user.firstName) \(user.lastName)"
    
    DispatchQueue.global(qos:.background).async {
      if let imageUrl = URL(string: user.avatar),
         let imageData = try? Data(contentsOf: imageUrl),
         let image = UIImage(data: imageData) {
        DispatchQueue.main.async {
          self.avatarView.image = image
        }
      }
    }
  }
}
