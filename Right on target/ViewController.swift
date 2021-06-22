//
//  ViewController.swift
//  Right on target
//
//  Created by Андрей Бородкин on 19.06.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // Create entity "Game"
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
   
    // ленивое свойство для хранения View Controller
//    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    
    
    
    override func loadView() {
        super.loadView()
        print("loadView()")
        
//        // создаем метку для вывода номера версии
//        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
//        // изменяем текст метки
//        versionLabel.text = "Верися 0.2"
//        // добавляем метку в родительский view
//        self.view.addSubview(versionLabel)
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Create an instance of "Game" entity
        game = Game(startValue: Int(slider.minimumValue), endValue: Int(slider.maximumValue), rounds: 5)
        
        // Update info about current mystery number
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        
        print(game!.currentSecretValue)
    }

    

    // MARK: - Model interaction
    
    @IBAction func checkNumber(_ sender: UIButton) {
        
        // Calculate round score
        game.calculateScore(with: Int(slider.value))
        
        // Find whether game is over
        if game.isGameEnded {
            showAlertWit(score: game.score)
        } else {
            game.startNewRound()
        }
        
        // Update info about current mystery number
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        
        
        print(game.currentSecretValue)
    }
        
   
    // MARK: - View update
    // Mystery number text update
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    private func showAlertWit(score: Int) {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: game.restartGame)
    }
    
    
    //MARK: - Random stuff
    // приватный метод, загружающий View Controller
    private func getSecondViewController() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    
    
        

        
    }
    


