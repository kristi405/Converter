import UIKit

class WelcomeViewController: UIViewController {

    @IBAction func showRate(_ sender: UIButton) {
        NetworkManeger.shered.getRate { rate in
            DispatchQueue.main.async {
                let rateVC = RateTableViewController(nib: R.nib.rateTableViewController)
                rateVC.rate = rate
                self.navigationController?.pushViewController(rateVC, animated: true)
            }
        }
    }
    
    @IBAction func CurrencyConverter(_ sender: UIButton) {
        NetworkManeger.shered.getRate { rate in
            DispatchQueue.main.async {
                let converterVC = ConverterViewController(nib: R.nib.converterViewController)
                converterVC.rates = rate
                self.navigationController?.pushViewController(converterVC, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
