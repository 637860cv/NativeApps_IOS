import UIKit
class AddVervangingController : UITableViewController{
    
    var vervanging: Vervanging? = nil
    
    @IBOutlet weak var  groepTextfield : UITextField!
    @IBOutlet weak var  start : UIDatePicker!
    @IBOutlet weak var  end : UIDatePicker!
    @IBOutlet weak var  saveButton : UIBarButtonItem!

    @IBAction func changeTextfield(_ sender: Any) {
        updateSaveButtonState()
    }
    
    @IBAction func changeStartDate(_ sender: Any){
        end.setDate(start.date, animated: true)
        print("changed")
    }
    
    override func viewDidLoad() {
        
        start.minimumDate   = Calendar.current.startOfDay(for: Date())
        end.minimumDate   = Calendar.current.startOfDay(for: Date())
        
        if let vervanging = vervanging {
            groepTextfield.text = vervanging.group
    
            start.setDate(vervanging.checkInDate ?? Date(), animated:true)
            end.setDate(vervanging.checkOutDate ?? Date(), animated: true)
            
        }
        
        updateSaveButtonState()
    }
    
    
    
   

    
    func updateSaveButtonState() {
        let groepText = groepTextfield.text ?? ""
        saveButton.isEnabled = !groepText.isEmpty
       
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let groepText = groepTextfield.text ?? ""
        let startText = start.date
        let endText = end.date
        
        vervanging = Vervanging(group: groepText, checkInDate: startText, checkOutDate: endText)
    }
}
