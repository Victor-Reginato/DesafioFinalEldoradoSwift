//
//  ViewController.swift
//  ProjetoFinal
//
//  Created by Aluno20 on 11/03/22.
//  Copyright © 2022 Aluno20. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBAction func BotaoEscolherNomeAction(_ sender: UIButton) {
        let nome = textNomeOutlet.text ?? ""
        if nome == "" {
            labelAviso.text = "Escolha um nome válido"
        } else {
            labelAviso.text = "Nome escolhido!"
            botaoRegras.isHidden = false
            botaoEscolherNome.isHidden = true
            textNomeOutlet.isHidden = true
            Model.instance.nome = nome
            Model.instance.fase = .inicio
            
        }

        
    }
    
    @IBOutlet weak var textNomeOutlet: UITextField!
    @IBOutlet weak var botaoEscolherNome: UIButton!
    

    @IBOutlet weak var botaoRegras: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        botaoRegras.isHidden = true
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"floresta.jpg")! )
        
    }

    @IBOutlet weak var labelAviso: UILabel!

    
    


    }


