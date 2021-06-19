//
//  ViewController.swift
//  Right on target
//
//  Created by Андрей Бородкин on 19.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    //загаданное число
    var number: Int = 0
    
    //раунд
    var round: Int = 0
    
    //сумма очков за раунд
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkNumber(_ sender: UIButton) {
        //если игра только начинается
        if self.round == 0 {
            // генерируем случайное число
            self.number = Int.random(in: 1...50)
            // передаем значение в Лейбл
            self.label.text = String(number)
            // устанавливаем счетчик раундов на 1
            self.round = 1
        } else {
            // получаем значение на слайдере
            let numSlider = Int(self.slider.value.rounded())
            // сравниваем значение с загаданным
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
            
            if self.round == 5 {
                // выводим информацию в окно
                let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
        }
        
        
//        switch slider.value {
//        case Float(number):
//            points = 50
//        case Float((number + 1)...50):
//            points = 50 - number + Int(slider.value)
        
    }
    
}

