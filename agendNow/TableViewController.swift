
import UIKit
import Firebase

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var consulta = [Consulta]()
    
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        load()
    }
    
    func load() {
        
        consulta.removeAll()
        
        handle = ref?.child("consultas").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? [String: AnyObject] {
                let pac = item["Paciente"]
                let med = item["Medico"]
                let data = item["Data"]
                let items = Consulta(nomePaciente: pac as? String, nomeMedico: med as? String, dataHora: data as? String)
                
                self.consulta.append(items)
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
            }
            
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = consulta[indexPath.row]
        
        ref = self.ref?.child("consultas").child(index.nomePaciente!)
        ref?.removeValue {
            error, _ in
        }
        
        consulta.remove(at: indexPath.row)
        myTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func agendar(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "addConsulta") as! AddConsultaViewController
        
        self.present(myVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return consulta.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTableViewCell
        let dados = consulta[indexPath.row]
        
        cell.nomeMedico.text = dados.nomeMedico
        cell.nomePaciente.text = dados.nomePaciente
        cell.dataHora.text = dados.dataHora
        
        return cell
    }
}
