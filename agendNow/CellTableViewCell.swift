

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var nomePaciente: UILabel!
    @IBOutlet weak var nomeMedico: UILabel!
    @IBOutlet weak var dataHora: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
