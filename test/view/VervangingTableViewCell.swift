//
//  VervangingTableView.swift
//  test
//
//  Created by Camille Vandenbussche on 14/11/2018.
//  Copyright © 2018 Camille Vandenbussche. All rights reserved.
//
import UIKit

class VervangingTableViewCell: UITableViewCell {

    @IBOutlet weak var groepLabel: UILabel!

    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var endLabel: UILabel!
    
    func update(with verv: Vervanging){
        let formatter = DateFormatter()
        formatter.dateFormat="dd/MM HH:m"
        let datumin = formatter.string(from: verv.checkInDate! )
        let datumout = formatter.string(from: verv.checkOutDate! )
      groepLabel.text = verv.group
      startLabel.text = datumin
      endLabel.text = datumout
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
}
