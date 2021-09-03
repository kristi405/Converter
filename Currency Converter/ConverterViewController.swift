import UIKit

class ConverterViewController: UIViewController {
    
    var rates = [Rate]()
    
    @IBOutlet weak var ratePicker: UIPickerView!
    @IBOutlet weak var converterPicker: UIPickerView!
    @IBOutlet weak var sumTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = .white
        ratePicker.dataSource = self
        ratePicker.delegate = self
        converterPicker.dataSource = self
        converterPicker.delegate = self
    }
}

extension ConverterViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rates.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let rate = rates[row]
        return rate.curAbbreviation
    }
}
