import UIKit

class RateTableViewController: UITableViewController {
        
    var rate = [Rate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(resource: R.nib.rateCell), forCellReuseIdentifier: R.reuseIdentifier.rateCell.identifier)
        tableView.backgroundColor = R.color.background()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = "Курсы валют"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rate.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.rateCell.identifier, for: indexPath) as? RateCell
        var rateCell = RateCell()
        
        if let rCell = cell {
            let rate = rate[indexPath.row]
            rCell.configureCell(rate: rate)
            rateCell = rCell
        }
        return rateCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
