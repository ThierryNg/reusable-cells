# reusable-cells
UITableView and UICollectionView extensions using generics and a custom protocol to get strongly-typed cells, and remove the use of string identifiers


1. Make your custom `UITableViewCell` conform to the `ReusableCell` protocol (`ReusableCollectionCell` for an `UICollectionViewCell`), and freely design your cell in a Xib

```swift
import UIKit

class ExampleCell: UITableViewCell {
    // ...
    func exampleFunction() {
        // ...
    }
}

// Just add the protocol conformance, default implementations takes care of the rest 
extension ExampleCell: ReusableCell {}
```

2. Register the Xib (Must share the class' name)
```swift
@IBOutlet weak var tableView: UITableView! {
    didSet {
        tableView.dataSource = self
        tableView.register(ExampleCell.self) // <--- this registers a cell conforming to the ReusableCell protocol with its class name as identifier
    }
}
```

3. Dequeue the cell without having to unwrap it
```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Type inference needs us to explicitly specify the type
        // but in return we get a ExampleCell instead of the usual UITableViewCell

        let cell: ExampleCell = tableView.dequeueReusableCell(forIndexPath: indexPath)

        cell.exampleFunction()
        return cell
    }
```
