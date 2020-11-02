//
//  ViewController.swift
//  PiCKER(GALERiYi ACMAK)
//
//  Created by MAKAN on 12.10.2020.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true //kullanici gorsele tiklayabiliyomu?(true = tiklayabilsin)
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(gestureRec)
    }
    
    @objc func selectImage(){
        
//        Kullaniciyi galeriye(kutuphaneye) goturme islemi
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary //Fotografa nasil erisicegimizi belirtiyoruz.
        picker.allowsEditing = true //Kullanici sectigi gorseli degistirebilecegi sey ile karsilasir.(zoom, kucultme vs,)
        present(picker, animated: true, completion: nil)
        
    }
    
    
//        RESMI SECTIKDEN SONRA NE YAPACAGINI BELIRTIYORUZ.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //Media ile isimiz bitince, gorseli sectikden sonra, bu fonk bize bir tane dictionary dondurur.([UIImagePickerController.InfoKey : Any]) : Any secilen gorseldir.
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)//Actigimiz picker i kapattik.Gorunum denetleyicisini kapatir.
        
        
    }

}

