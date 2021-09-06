import UIKit

class WelcomeViewController: UIViewController {
    // MARK: IBOutlets
    
    @IBOutlet weak var buttonrate: UIButton!
    @IBOutlet weak var buttonCurrency: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: Private properties
    
    private var rate: [Rate]?
    
    // MARK: IBActions
    
    @IBAction func showRate(_ sender: UIButton) {
        DispatchQueue.main.async {
            let rateVC = RateTableViewController(nib: R.nib.rateTableViewController)
            guard let rates = self.rate else {return}
            rateVC.rates = rates
            self.navigationController?.pushViewController(rateVC, animated: true)
        }
    }
    
    @IBAction func CurrencyConverter(_ sender: UIButton) {
        DispatchQueue.main.async {
            let converterVC = ConverterViewController(nib: R.nib.converterViewController)
            guard let rates = self.rate else {return}
            converterVC.rates = rates
            self.navigationController?.pushViewController(converterVC, animated: true)
        }
    }
    
    // MARK: LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isHidden()
        activityIndicator.startAnimating()
        NetworkManeger.shered.getRate(date: dateFormat()) { rate in
            self.rate = rate
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.loadLabel.isHidden = true
                self.notHidden()
            }
        }
        buttonrate.customButton(button: buttonrate)
        buttonCurrency.customButton(button: buttonCurrency)
    }
    
    // MARK: Private methods
    
    private func isHidden() {
        welcomeLabel.isHidden = true
        buttonrate.isHidden = true
        buttonCurrency.isHidden = true
    }
    
    private func notHidden() {
        welcomeLabel.isHidden = false
        buttonrate.isHidden = false
        buttonCurrency.isHidden = false
    }
    
    private func dateFormat() -> String {
        let df = DateFormatter()
        df.dateFormat = Constants.dateFormat
        return df.string(from: Date())
    }
}

extension WelcomeViewController {
    enum Constants {
        static let dateFormat = "yyyy-MM-ddhh:mm:ss"
    }
}
