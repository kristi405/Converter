import UIKit

class RateTableViewController: UITableViewController {
    // MARK: Propirties
    
    var rates = [Rate]()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(resource: R.nib.rateCell), forCellReuseIdentifier: R.reuseIdentifier.rateCell.identifier)
        tableView.backgroundColor = R.color.background()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = Constants.currency
    }

    // MARK: - TableView data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.rateCell.identifier, for: indexPath) as? RateCell
        var rateCell = RateCell()
        
        if let rCell = cell {
            let rate = rates[indexPath.row]
            rCell.configureCell(rate: rate)
            rateCell = rCell
        }
        return rateCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.heightOfTableViewCell
    }
}

// MARK: Extension

extension RateTableViewController {
    enum Constants {
        static let currency = "Курсы валют"
        static let heightOfTableViewCell: CGFloat = 60
    }
}
