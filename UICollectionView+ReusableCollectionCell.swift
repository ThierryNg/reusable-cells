//
//  UICollectionView+ReusableCollectionCell.swift
//
//
//  Created by Thierry Ng on 13/03/2019.
//  Copyright © 2019 Thierry Ng. All rights reserved.
//

import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableCollectionCell {
        let nibName = String(describing: type(of: T()))
        let nib = UINib(nibName: nibName, bundle: nil)

        self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T
        where T: ReusableCollectionCell {
            guard
                let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T
                else {
                    fatalError("[ERROR] : Could not dequeue cell with identifier: \(T.reuseIdentifier)")
            }
            return cell
    }
}
