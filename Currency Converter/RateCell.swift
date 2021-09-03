import UIKit

class RateCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(rate: Rate) {
        nameLabel.text = rate.curName
        quantityLabel.text = "\(rate.curScale)"
        rateLabel.text = "\(rate.curOfficialRate)"
    }
}
