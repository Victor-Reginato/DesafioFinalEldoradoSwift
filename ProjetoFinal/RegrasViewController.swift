//
//  RegrasViewController.swift
//  ProjetoFinal
//
//  Created by Aluno20 on 14/03/22.
//  Copyright © 2022 Aluno20. All rights reserved.
//

import UIKit

class RegrasViewController: UIViewController {

    @IBOutlet weak var labelNome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        botaoComecarJogoRegra.isHidden = true
        labelNome.text = Model.instance.nome
        regraTexto.text = "Olá, \(Model.instance.nome), sou o mago Abenty e vou te explicar as regras do jogo."
        regraTexto.isEditable = false
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var regraTexto: UITextView!
    
    @IBOutlet weak var botaoRegra: UIButton!
    
    
    
    @IBOutlet weak var botaoComecarJogoRegra: UIButton!
    
    var count = 0
    //através do botão e da variável count que o fluxo do jogo é controlado
    @IBAction func botaoRegraAction(_ sender: Any) {
        
        switch count {
            
            
        case 0:
            regraTexto.text = "Pois bem então, para vencer você enfrentará 4 figuras curiosas, onde cada uma delas vai propor um tipo diferente de desafio."

            count += 1
            
            
        
        case 1:
            regraTexto.text = "Não poderás perder nenhuma vez, portanto fique atento às suas escolhas."

            count += 1

        case 2:
            regraTexto.text = "Cuidado com as pegadinhas e boa sorte, \(Model.instance.nome)!"
            botaoRegra.isHidden = true
            botaoComecarJogoRegra.isHidden = false
            
            
        default:
            regraTexto.text = "passou"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
