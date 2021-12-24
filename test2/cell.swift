
import UIKit
import SnapKit

class Cell: UITableViewCell {
    
    
    var textTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(textTitle)
        textTitle.snp.makeConstraints {make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(frame.height)
        }
        configureNamesTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureNamesTitle() {
        textTitle.numberOfLines = 1
        textTitle.adjustsFontSizeToFitWidth = true
        textTitle.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    }


