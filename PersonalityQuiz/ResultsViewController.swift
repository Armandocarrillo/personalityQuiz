//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Armando Carrillo on 08/05/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultAnsweLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    

    var responses: [Answer]!
    func calculatePersonalityResult (){
        var frequencyOfAnswer: [AnimalType: Int] = [:]
        let responseType = responses.map {$0.type}// mapea los resultados en un arreglo y los llama por su tipo
    
        for response in responseType{
            frequencyOfAnswer[response] = (frequencyOfAnswer[response] ?? 0) + 1
        }
        /*let frequentAnswersSorted = frequencyOfAnswer.sorted(by: {(pair1, pair2) -> Bool in return pair1.value > pair2.value })// toma los valores de frequencyOfAnswer como dos parametros y compara su valor, si es false, toma otro en el arreglo para ordenarlos de mayor a menor
        let mostCommonAnswer = frequentAnswersSorted.first!.key // Toma el primer elemento con su llave de frequentAnswerSorted
 */
        let mostCommonAnswer = frequencyOfAnswer.sorted{ $0.1 > $1.1 }.first!.key // simplify code
        
        resultAnsweLabel.text = " Tu eres un \(mostCommonAnswer.rawValue)!" //toma el string del primer arreglo
        resultDescriptionLabel.text = mostCommonAnswer.definition
    
    }
    
}
