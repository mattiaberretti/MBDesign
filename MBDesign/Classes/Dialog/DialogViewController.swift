//
//  DialogViewController.swift
//  Design
//
//  Created by Mattia on 30/06/18.
//  Copyright © 2018 Mattia. All rights reserved.
//

import UIKit

public class DialogViewController: UIViewController {
    @IBOutlet weak var labelTesto: UILabel!
    @IBOutlet weak var areaBottoni: UIView!
    @IBOutlet weak var labelTitolo: UILabel!
    @IBOutlet weak var popUp: UIView!
    
    private let paddingElementi : CGFloat = 48
    
    var titolo : String
    var messaggio : String
    
    public var azioni : Array<DialogAction>
    
    private var controllerHeight : CGFloat{
        return self.labelTitolo.frame.height + self.areaBottoni.frame.height + self.labelTesto.frame.height + paddingElementi
    }
    
    public init(titolo : String, messaggio : String){
        self.messaggio = messaggio
        self.titolo = titolo
        self.azioni = []
        super.init(nibName: "DialogViewController", bundle: Bundle(for: DialogViewController.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelTitolo.text = self.titolo
        self.labelTesto.text = self.messaggio
        
        self.popUp.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.popUp.layer.shadowColor = UIColor.lightGray.cgColor
        self.popUp.layer.shadowOpacity = 1
        self.popUp.layer.borderColor = UIColor.lightGray.cgColor
        self.popUp.layer.cornerRadius = 5
        self.popUp.layer.borderWidth = 1
        self.labelTesto.sizeToFit()
        self.inserisciBottoni()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func addAction(_ action : DialogAction){
        self.azioni.append(action)
    }
    
    func inserisciBottoni(){
        var xPosition = self.areaBottoni.frame.size.width
        let altezzaArea = self.areaBottoni.frame.size.height
        for i in 0..<self.azioni.count {
            let bottone = UIButton(type: UIButtonType.roundedRect)
            bottone.setTitle(self.azioni[i].titolo, for: UIControlState.normal)
            bottone.setTitleColor(UIColor.black, for: UIControlState.normal)
            
            bottone.addTarget(self, action: #selector(self.btnClick(_:)), for: UIControlEvents.touchUpInside)
            bottone.tag = i
            bottone.sizeToFit()
            xPosition -= bottone.frame.size.width
            
            let y = altezzaArea - (bottone.frame.size.height)
            
            bottone.frame = CGRect(x: xPosition, y: y, width: bottone.frame.size.width, height: bottone.frame.size.height)
            self.areaBottoni.insertSubview(bottone, at: i)
            xPosition -= 8
        }
    }
    
    @objc
    func btnClick(_ sender : UIButton){
        if let azione = self.azioni[sender.tag].action {
            azione(self.azioni[sender.tag])
        }
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
