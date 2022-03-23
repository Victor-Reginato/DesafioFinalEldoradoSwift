//
//  CleoViewController.swift
//  ProjetoFinal
//
//  Created by Aluno20 on 14/03/22.
//  Copyright © 2022 Aluno20. All rights reserved.
//

import UIKit



class CleoViewController: UIViewController {

    
        
    @IBOutlet weak var botaoProxfaseCleo: UIButton!
    
    @IBOutlet weak var botaoDerrotaCleo: UIButton!
    
    
    @IBOutlet weak var labelNome: UILabel!
    
    //botao de fluxo de fala e respostas(outlet)
    @IBOutlet weak var botaoCleoOutlet: UIButton!
    
    //botao da fala
    @IBOutlet weak var textFieldCleo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        cleoText.text = "Olá, ralé, para passar por mim terás que ter uma imaginação fértil! Você deve responder corretamente três charadas cujas respotas corretas são apenas uma palavra."
        cleoText.isEditable = false
        botaoProxfaseCleo.isHidden = true
        botaoDerrotaCleo.isHidden = true
                textFieldCleo.isHidden = true
        Model.instance.fase = .cleo
        botaoCleoOutlet.setTitle("Ir para a pergunta", for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    
    // variavel que indica se o player ganhou ou perdeu
    var gameStatus = true
    var count = 0
    @IBAction func botaoCleoAction(_ sender: Any) {
        switch count {
            
        case 0:
            cleoText.text = "Para começar, vamos testar sua perspicácia! Diga-me, como se chama o vegetal que não enxerga?"
            count += 1
            textFieldCleo.isHidden = false
            botaoCleoOutlet.setTitle("Confirmar resposta", for: .normal)
            
        
        case 1:
            gameStatus = verificaResposta(respostaCorreta: "acelga", respostaDada: textFieldCleo.text?.lowercased() ?? "")
        if gameStatus {
            cleoText.text = "Boa sacada, mas não vá se achando! Vamos para a próxima: Um gato, um macaco e um passaro sobem em uma palmera, qual deles chega primeiro na banana? "
            textFieldCleo.text = ""
            count += 1
        } else {
            cleoText.text = "Você errou, queride, volte na próxima!"
            botaoDerrotaCleo.isHidden = false
            botaoCleoOutlet.isHidden = true
                
            textFieldCleo.isHidden = true
                }
            
        
        case 2:
        gameStatus = verificaResposta(respostaCorreta: "nenhum", respostaDada: textFieldCleo.text?.lowercased() ?? "")
        if gameStatus {
            cleoText.text = "Você é bom mesmo, hein? Uma última então, o que um bom navegador faz quando o barco afunda? "
            count += 1
            textFieldCleo.text = ""
        } else {
            cleoText.text = "Você errou, volte na próxima! bye bye"
            botaoDerrotaCleo.isHidden = false
            botaoCleoOutlet.isHidden = true
            textFieldCleo.isHidden = true
            
            
        }

            
        default:
            gameStatus = verificaResposta(respostaCorreta: "nada", respostaDada: textFieldCleo.text?.lowercased() ?? "")
            if gameStatus {
                cleoText.text = "Parabéns, você é mesmo muito criativo!"
                textFieldCleo.isHidden = true
                botaoProxfaseCleo.isHidden = false
                botaoCleoOutlet.isHidden = true
                    
            } else {
                cleoText.text = "Você errou, queride, volte na próxima."
                botaoDerrotaCleo.setTitle("Voltar", for: .normal)
                botaoDerrotaCleo.isHidden = false
                botaoCleoOutlet.isHidden = true
                    
                textFieldCleo.isHidden = true
                    
                
    
            }
        }
        
    }
    
    //verificar se a resposta dada é correta
    func verificaResposta(respostaCorreta: String, respostaDada: String) -> Bool {
        if respostaCorreta == respostaDada {
            return true
        } else {
            return false
        }
    }
    
    @IBOutlet weak var cleoText: UITextView!
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
