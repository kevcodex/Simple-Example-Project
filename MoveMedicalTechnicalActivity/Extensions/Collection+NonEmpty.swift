//  Created by Kevin Chen on 12/17/19.
//  Copyright © 2019 Kevin Chen. All rights reserved.
//

extension Collection {
    var nonEmpty: Self? {
        return !isEmpty ? self : nil
    }
}

extension Collection {
    
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    /// A safe function to get element of Collection at index path.
    ///
    /// - Parameter index: Index of element in a collection.
    /// - Returns: Element at a given index. If an index is out of boundary of a collection it will return nil and an assertionFailure.
    func safe(index: Index) -> Iterator.Element? {
        return self[safe: index]
    }
}
