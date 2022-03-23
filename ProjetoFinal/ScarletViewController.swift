//
//  ScarletViewController.swift
//  ProjetoFinal
//
//  Created by Aluno20 on 18/03/22.
//  Copyright © 2022 Aluno20. All rights reserved.
//

import UIKit

class ScarletViewController: UIViewController {
    
    

    @IBOutlet weak var perdeuBotaoOutlet: UIButton!
    
    @IBOutlet weak var botaoProxOutlet: UIButton!
    
    @IBOutlet weak var botaoProxFase: UIButton!
    
    @IBOutlet weak var fieldBruxa: UITextField!
    
    @IBOutlet weak var textBruxa: UITextView!
    
    @IBOutlet weak var labelTempo: UILabel!
    
    @IBOutlet weak var LabelResposta: UILabel!
    
    @IBOutlet weak var labelNome: UILabel!
    
    var count = 0
    
    //variável que indica se o temporizador precisa seguir
    var timerPrecisaSeguir = true
    
    //numeros que serão inseridos no textfield e depois convertidos para int
    var primeiroNumero = ""
    var segundoNumero = ""
    
    //gerando numeros aleatorios para serem usados
    var randomNumber1 = Int.random(in: 10...20)
    var randomNumber2 = Int.random(in: 10...20)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setando as confirgurações iniciais
        textBruxa.isEditable = false
        botaoProxFase.isHidden = true
        perdeuBotaoOutlet.isHidden = true
        botaoProxOutlet.isHidden = false
        fieldBruxa.isHidden = true
        Model.instance.fase = .bruxa
        labelNome.text = Model.instance.nome
        labelTempo.isHidden = true
        textBruxa.text = "Olá,\(Model.instance.nome), Abenty me disse que você já superou grande desafios, mas terá que ter mais do que sagaz ou ter conhecimentos gerais sobre dragões,aqui terá de ser rápido com os números. Vou te dar um certo tempo para solucionar alguns problemas matemáticos. Quando estiver pronto, prossiga, e boa sorte!"
    }
    

    
    
    
    @IBAction func botaoProxAction(_ sender: UIButton) {
        switch count {
            
            
        case 0:
            textBruxa.text = "A soma de um número com seu quíntuplo é igual ao dobro desse mesmo número somado com 40, qual é o número?"
            fieldBruxa.isHidden = false
            setarTimer(intervalo: 30)
            botaoProxOutlet.setTitle("Confirmar número", for: .normal)
            count += 1
        
            
        case 1:
            //não pode deixar o campo vazio
            if fieldBruxa.text != "" {
                segundoNumero = fieldBruxa.text ?? ""
                fieldBruxa.text = ""
                timerPrecisaSeguir = false
                if (segundoNumero == "10") {
                
                textBruxa.text = "Bravo, você acertou! A próxima será mais dificil, prepare-se! Talvez precise de da ajuda de um camarada chamado Bhaskara."
                    botaoProxOutlet.setTitle("Próxima pergunta", for: .normal)
                    botaoProxFase.isHidden = true
                    botaoProxOutlet.isHidden = false
                    fieldBruxa.isHidden = true
                    count += 1
                
                } else {
                    textBruxa.text = "Você errou! Que pena, tinha mais expectativas em você, \(Model.instance.nome)."
                    perdeuBotaoOutlet.isHidden = false
                    botaoProxOutlet.isHidden = true
                    fieldBruxa.isHidden = true
                }
            } else {
                print("hsssadhs")
            }

            
        case 2:
            textBruxa.text = "Lá vai! Quais dois números que somados resultam em \(randomNumber1 + randomNumber2) e multiplicados dão \(randomNumber1 * randomNumber2)."
            fieldBruxa.isHidden = false
            botaoProxOutlet.setTitle("Confirmar primeiro número", for: .normal)
            count += 1
            timerPrecisaSeguir = true
            setarTimer(intervalo: 30)
            LabelResposta.text = "\(randomNumber1)e\(randomNumber2)"
        
            
        case 3:
            if fieldBruxa.text != "" {
                primeiroNumero = fieldBruxa.text ?? ""
                fieldBruxa.text = ""
                botaoProxOutlet.setTitle("Confirmar segundo número", for: .normal)
                count += 1

                
                
            } else {
                //não acontece nada, o jogador precisa digitar um numero
                print("dsjlkd")
            }
    
        case 4:
            if fieldBruxa.text != "" {
                segundoNumero = fieldBruxa.text ?? ""
                fieldBruxa.text = ""
                timerPrecisaSeguir = false
                let primeiroNumeroInt = Int(primeiroNumero)
                let segundoNumeroInt = Int(segundoNumero)
                timerPrecisaSeguir = false
                if ((primeiroNumeroInt == randomNumber1 && segundoNumeroInt == randomNumber2) || (primeiroNumeroInt == randomNumber2 && segundoNumeroInt == randomNumber1)) {
                    textBruxa.text = "Parabéns!! Você conseguiu, você é realmente talensoso. Boa sorte na próxima etapa... talvez precise!"
                    LabelResposta.isHidden = true
                    botaoProxOutlet.isHidden = true
                    botaoProxFase.isHidden = false
                    botaoProxOutlet.isHidden = true
                    fieldBruxa.isHidden = true
                
                } else {
                    textBruxa.text = "Você errou! Que pena, tinha mais expectativas em você, \(Model.instance.nome)."
                    perdeuBotaoOutlet.isHidden = false
                    botaoProxOutlet.isHidden = true
                    fieldBruxa.isHidden = true
                    timerPrecisaSeguir = false
                }
            } else {
                print("hsadhs")
            }
            
    
            
        default:
            print("default")
        }
    }
    
    
    // setar um timer de "intervalo" segundos que se esgotado, o jogador perde, ou se a variavel TimerPRecisaSeguir for setada para false, o timer0
    //n prossgue
    func setarTimer(intervalo: Int) {
        var counter = 0
        print("wwq")
        labelTempo.isHidden = false
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            counter += 1
            self.labelTempo.text = "Tempo\nrestante:\n\(intervalo-counter)s"
            
            if !self.timerPrecisaSeguir {
               timer.invalidate()
                self.labelTempo.isHidden = true
            }
            
            if counter == intervalo && self.timerPrecisaSeguir {
                timer.invalidate()
                self.labelTempo.isHidden = true
                self.textBruxa.text = "Acabou o tempo! Você não foi rapido o sufiente, camarada, treine mais e volte depois."
                self.timerPrecisaSeguir = false
                self.fieldBruxa.isHidden = true
                self.perdeuBotaoOutlet.isHidden = false
                self.botaoProxOutlet.isHidden = true
                
            }
            
            
        
        }
    }
    
    //funcção que se o tempo acabar, setar o count para 71
    //funcao reseta o timer
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
