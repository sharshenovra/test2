import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var text1: [String] = ["Alisa", "Norman", "Vitaly"]
    var textTableView = UITableView()
    var textCell = UITableViewCell()
    var field = UITextField()
    var button1 = UIButton()
    
    struct Cells {
        static let textCell = "TextCell"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return text1.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = textTableView.dequeueReusableCell(withIdentifier: Cells.textCell) as! Cell
        let model = text1[indexPath.row]
        
        cell.textTitle.text = model

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
    
    override func viewDidLoad() {
       
        view.addSubview(field)
        field.placeholder = "Введите"
        field.backgroundColor = .darkGray
        field.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        view.addSubview(button1)
        button1.setTitle("+", for: .normal)
        button1.setTitleColor(.green, for: .normal)
        button1.addTarget(nil, action: #selector(buttonClick(sender:)), for: .touchUpInside)
        button1.snp.makeConstraints{make in
            make.top.equalTo(field.snp.top)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
            make.width.equalTo(50)
        }
        
        view.addSubview(textTableView)
        textTableView.delegate = self
        textTableView.dataSource = self
        textTableView.snp.makeConstraints{make in
            make.top.equalTo(field.snp.bottom).offset(30)
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        textTableView.register(Cell.self, forCellReuseIdentifier: Cells.textCell)
        
        
    }
    @objc func buttonClick(sender: UIButton) {
        text1.append(field.text ?? "")
        textTableView.reloadData()
    }
}
