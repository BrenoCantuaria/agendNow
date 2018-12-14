
import Foundation

class Consulta {
    var nomePaciente:String?
    var nomeMedico:String?
    var dataHora:String?
    
    init(nomePaciente:String?, nomeMedico:String?, dataHora:String? ) {
        self.nomePaciente = nomePaciente
        self.nomeMedico = nomeMedico
        self.dataHora = dataHora
    }
}
