

import UIKit
import Firebase

class AddConsultaViewController: UIViewController {

    @IBOutlet weak var paciente: UITextField!
    @IBOutlet weak var medico: UITextField!
    @IBOutlet weak var data: UITextField!
    
    @IBAction func voltar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    var ref:DatabaseReference?
    
    @IBAction func adicionar(_ sender: Any) {
        ref = Database.database().reference()
        
        if(paciente.text != "") {
            ref?.child("consultas").child(paciente.text!).setValue(["Paciente":paciente.text, "Medico":medico.text, "Data":data.text ])
            
            let alert = UIAlertController(title: "Sucesso", message: "Paciente adicionado com sucesso!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Confirmar", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            paciente.text = ""
            medico.text = ""
            data.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
