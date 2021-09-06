import UIKit

class ConverterViewController: UIViewController {
    // MARK: IBOutlets
    
    @IBOutlet weak var ratePicker: UIPickerView!
    @IBOutlet weak var converterPicker: UIPickerView!
    @IBOutlet weak var sumTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultButton: UIButton!
    
    // MARK: Propirties
    
    var rates = [Rate]()
    private var text: String?
    private var fromCurrency: String?
    private var toCurrency: String?
    private var ratefromCurrency: Float?
    private var rateToCurrency: Float?
    private var rate: Float?
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.isHidden = true
        let belRub = Rate(curID: Constants.one, date: Constants.emptyString, curAbbreviation: Constants.belCurrency, curScale: Constants.one, curName: Constants.emptyString, curOfficialRate: Double(Constants.one))
        rates.insert(belRub, at: .zero)
        fromCurrency = rates.first?.curAbbreviation
        toCurrency = rates.first?.curAbbreviation
        navigationController?.navigationBar.tintColor = .white
        ratePicker.dataSource = self
        ratePicker.delegate = self
        converterPicker.dataSource = self
        converterPicker.delegate = self
        sumTextField.delegate = self
        resultButton.customButton(button: resultButton)
        
    }
    
    // MARK: IBActions
    
    @IBAction func result(_ sender: UIButton) {
        getRateSelectedRates()
        guard let summa = text else {
            showAlert()
            return
        }
        let sum = Float(summa)
        guard let rateSum = sum else {return}
        guard let rateFirst = ratefromCurrency, let rateSecond = rateToCurrency else {return}
        resultLabel.text = String(format: Constants.dateFormat, ((rateSum * rateFirst) / rateSecond))
        resultLabel.isHidden = false
    }
    
    // MARK: Private methods
    
    private func getRateSelectedRates() {
        for rate in rates {
            if fromCurrency == rate.curAbbreviation {
                self.ratefromCurrency = Float(rate.curOfficialRate)
                for rate in rates {
                    if toCurrency == rate.curAbbreviation {
                        self.rateToCurrency = Float(rate.curOfficialRate)
                    }
                }
            }
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: Constants.alertTitle, message: Constants.alertMessage, preferredStyle: .alert)
        let okButton = UIAlertAction(title: Constants.okButton, style: .cancel, handler: nil)
        alert.addAction(okButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: Override methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension ConverterViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {Constants.one}
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        rates.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var title = Constants.emptyString
        let rate = rates[row]
        title = rate.curAbbreviation
        let attributedString = NSAttributedString(string: title, attributes: [.foregroundColor : UIColor.white])
        return attributedString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == ratePicker {
            fromCurrency = rates[row].curAbbreviation
        } else {
            toCurrency = rates[row].curAbbreviation
        }
    }
}

// MARK: - UITextFieldDelegate

extension ConverterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != nil {
            self.text = textField.text
        }
    }
}

extension ConverterViewController {
    enum Constants {
        static let emptyString = ""
        static let one = 1
        static let dateFormat = "%.4f"
        static let alertTitle = "Ошибка"
        static let alertMessage = "Введите сумму"
        static let okButton = "Ok"
        static let belCurrency = "BYN"
    }
}
