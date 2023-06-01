//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Gamze Akyüz on 1.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var boy: UITextField!
    @IBOutlet weak var kilo: UITextField!
    
    @IBOutlet weak var sonuc: UILabel!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var deger: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view1.layer.cornerRadius = 10.0
        view2.layer.cornerRadius = 10.0
        
    }
    
    @IBAction func calculator(_ sender: Any){
        calculateBMI()
    }
    @IBAction func clear(_ sender: Any){
        kilo.text = ""
        boy.text = ""
        sonuc.text = ""
        deger.text = ""
    }

    func interpretBMI(_ bmi: Double) -> String {
        if bmi < 18.9 {
            return "Zayıfsınız, Uzunluğunuza göre uygun ağırlıkta olmadığınızı, zayıf olduğunuzu gösterir. Zayıflık, bazı hastalıklar için risk oluşturan ve istenmeyen bir durumdur. Boyunuza uygun ağırlığa erişmeniz için yeterli ve dengeli beslenmeli, beslenme alışkanlıklarınızı geliştirmeye özen göstermelisiniz. "
        } else if bmi < 24.5 {
            return "Kilonuz Normal, Uzunluğunuza göre uygun ağırlıkta olduğunuzu gösterir. Yeterli ve dengeli beslenerek ve düzenli fiziksel aktivite yaparak bu ağırlığınızı korumaya özen gösteriniz."
        } else if bmi < 29.9 {
            return "Fazla Kilolusunuz, Boyunuza göre vücut ağırlığınızın fazla olduğunu gösterir. Fazla kilolu olma durumu gerekli önlemler alınmadığı takdirde pek çok hastalık için risk faktörü olan obeziteye (şişmanlık) yol açar."
        } else if bmi < 34.4 {
            return "Şişman (Obez) - I. Sınıfıdasınız, Boyunuza göre vücut ağırlığınızın fazla olduğunu bir başka deyişle şişman olduğunuzun bir göstergesidir. Şişmanlık, kalp-damar hastalıkları, diyabet, hipertansiyon v.b. kronik hastalıklar için risk faktörüdür. Bir sağlık kuruluşuna başvurarak hekim / diyetisyen kontrolünde zayıflayarak normal ağırlığa inmeniz sağlığınız açısından çok önemlidir. Lütfen, sağlık kuruluşuna başvurunuz."
        }
        else if bmi < 44.9 {
            return "Şişman (Obez) - II. Sınıfındasınız, Uzunluğunuza göre vücut ağırlığınızın fazla olduğunu bir başka deyişle şişman olduğunuzun bir göstergesidir. Şişmanlık, kalp-damar hastalıkları, diyabet, hipertansiyon v.b. kronik hastalıklar için risk faktörüdür. Bir sağlık kuruluşuna başvurarak hekim / diyetisyen kontrolünde zayıflayarak normal ağırlığa inmeniz sağlığınız açısından çok önemlidir. Lütfen, sağlık kuruluşuna başvurunuz."
        }
        else if bmi > 45 {
            return "Aşırı Şişman (Aşırı Obez) - III. Sınıfındasınız, Boyunuza göre vücut ağırlığınızın fazla olduğunu bir başka deyişle şişman olduğunuzun bir göstergesidir. Şişmanlık, kalp-damar hastalıkları, diyabet, hipertansiyon v.b. kronik hastalıklar için risk faktörüdür. Bir sağlık kuruluşuna başvurarak hekim / diyetisyen kontrolünde zayıflayarak normal ağırlığa inmeniz sağlığınız açısından çok önemlidir. Lütfen, sağlık kuruluşuna başvurunuz."
        }
        return "Hatalı"
    }
    func calculateBMI() {
            guard let weightText = kilo.text, let weight = Double(weightText) else {
                displayErrorMessage(message: "Geçersiz kilo girişi yaptınız")
                return
            }
            guard let heightText = boy.text, let height = Double(heightText) else {
                displayErrorMessage(message: "Geçersiz boy girişi yaptınız")
                return
            }

            let bmi = weight / (height * height)
            let interpretation = interpretBMI(bmi)
            deger.text = "BMI: \(String(format: "%.1f", bmi))"
            sonuc.text = "\(interpretation)"
        }
    func displayErrorMessage(message: String) {
           let alertController = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
           alertController.addAction(okAction)
           present(alertController, animated: true, completion: nil)
       }

}

