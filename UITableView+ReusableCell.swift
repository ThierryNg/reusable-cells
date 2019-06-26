//
//  UITableView+ReusableCell.swift
//
//
//  Created by Thierry Ng on 13/03/2019.
//  Copyright © 2019 Thierry Ng. All rights reserved.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_: T.Type) where T: ReusableCell {
        let nibName = String(describing: type(of: T()))
        let nib = UINib(nibName: nibName, bundle: nil)

        self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("[ERROR] : Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
